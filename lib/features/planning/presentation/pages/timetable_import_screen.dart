import 'dart:typed_data';

import 'package:drift/drift.dart' as drift;
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/theme/aster_spacing.dart';
import '../../../../app/theme/aster_theme.dart';
import '../../../../core/ai/ai_providers.dart';
import '../../../../core/ai/gemini_client.dart';
import '../../../../core/database/aster_database.dart';
import '../../../../core/models/timetable_import.dart';
import '../../../../core/providers/database_providers.dart';
import '../../../../core/responsive/responsive_layout.dart';
import '../../../../core/services/notification_service.dart';
import '../../../../core/widgets/cards/aster_card.dart';

class TimetableImportScreen extends ConsumerStatefulWidget {
  const TimetableImportScreen({super.key, this.scheduleOnly = false});

  final bool scheduleOnly;

  @override
  ConsumerState<TimetableImportScreen> createState() =>
      _TimetableImportScreenState();
}

class _TimetableImportScreenState extends ConsumerState<TimetableImportScreen> {
  List<TimetableImportEntry> _entries = const [];
  String? _fileName;
  String? _error;
  bool _analyzing = false;
  bool _importing = false;
  Uint8List? _selectedBytes;
  String? _selectedMimeType;

  static const _weekdays = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  Future<void> _chooseAndAnalyze() async {
    setState(() {
      _analyzing = true;
      _error = null;
      _entries = const [];
    });
    try {
      const timetableFiles = XTypeGroup(
        label: 'Timetable files',
        extensions: ['pdf', 'png', 'jpg', 'jpeg'],
        mimeTypes: ['application/pdf', 'image/png', 'image/jpeg'],
      );
      final file = await openFile(acceptedTypeGroups: [timetableFiles]);
      if (file == null) return;
      if (mounted) setState(() => _fileName = file.name);
      final bytes = await file.readAsBytes();
      if (bytes.length > 10 * 1024 * 1024) {
        throw Exception('Choose a timetable file smaller than 10 MB.');
      }

      final extension = file.name.split('.').last.toLowerCase();
      final mimeType = switch (extension) {
        'pdf' => 'application/pdf',
        'png' => 'image/png',
        'jpg' || 'jpeg' => 'image/jpeg',
        _ => throw Exception('Only PDF, PNG, JPG, and JPEG are supported.'),
      };
      _selectedBytes = bytes;
      _selectedMimeType = mimeType;
      final entries = await ref
          .read(geminiClientProvider)
          .analyzeTimetable(bytes, mimeType);
      if (!mounted) return;
      setState(() {
        _fileName = file.name;
        _entries = entries;
      });
    } catch (error) {
      final message = error is GeminiException
          ? error.message
          : error.toString().replaceFirst('Exception: ', '');
      if (mounted) setState(() => _error = message);
    } finally {
      if (mounted) setState(() => _analyzing = false);
    }
  }

  Future<void> _retryAnalysis() async {
    final bytes = _selectedBytes;
    final mimeType = _selectedMimeType;
    if (bytes == null || mimeType == null) {
      await _chooseAndAnalyze();
      return;
    }
    setState(() {
      _analyzing = true;
      _error = null;
      _entries = const [];
    });
    try {
      final entries = await ref
          .read(geminiClientProvider)
          .analyzeTimetable(bytes, mimeType);
      if (mounted) setState(() => _entries = entries);
    } catch (error) {
      final message = error is GeminiException
          ? error.message
          : 'Analysis failed. Check your connection and try again.';
      if (mounted) setState(() => _error = message);
    } finally {
      if (mounted) setState(() => _analyzing = false);
    }
  }

  Future<void> _import() async {
    if (_entries.isEmpty) return;
    setState(() {
      _importing = true;
      _error = null;
    });
    try {
      final profile = await ref.read(currentStudentProfileProvider.future);
      if (profile == null) throw Exception('Complete your profile first.');
      final db = ref.read(databaseProvider);

      await db.transaction(() async {
        final subjects = await (db.select(
          db.subjects,
        )..where((table) => table.studentProfileId.equals(profile.id))).get();
        final subjectIds = subjects.map((subject) => subject.id).toList();
        if (subjectIds.isNotEmpty) {
          await (db.delete(
            db.timetableEntries,
          )..where((table) => table.subjectId.isIn(subjectIds))).go();
        }

        final idsByCode = <String, int>{
          for (final subject in subjects)
            if (subject.code?.trim().isNotEmpty ?? false)
              _normalize(subject.code!): subject.id,
        };
        final idsByName = <String, int>{
          for (final subject in subjects) _normalize(subject.name): subject.id,
        };

        for (final entry in _entries) {
          final normalizedCode = _normalize(entry.courseCode);
          final normalizedName = _normalize(entry.subjectName);
          var subjectId = normalizedCode.isEmpty
              ? null
              : idsByCode[normalizedCode];
          subjectId ??= idsByName[normalizedName];
          if (subjectId == null) {
            subjectId = await db
                .into(db.subjects)
                .insert(
                  SubjectsCompanion.insert(
                    studentProfileId: profile.id,
                    name: entry.subjectName,
                    code: drift.Value(
                      entry.courseCode.isEmpty ? null : entry.courseCode,
                    ),
                    subjectType: 'Theory',
                    teacherName: drift.Value(
                      entry.teacherName.isEmpty ? null : entry.teacherName,
                    ),
                  ),
                );
            idsByName[normalizedName] = subjectId;
            if (normalizedCode.isNotEmpty) {
              idsByCode[normalizedCode] = subjectId;
            }
          } else if (entry.teacherName.isNotEmpty) {
            await (db.update(
              db.subjects,
            )..where((subject) => subject.id.equals(subjectId!))).write(
              SubjectsCompanion(
                teacherName: drift.Value(entry.teacherName),
                updatedAt: drift.Value(DateTime.now()),
              ),
            );
          }

          await db
              .into(db.timetableEntries)
              .insert(
                TimetableEntriesCompanion.insert(
                  subjectId: subjectId,
                  weekday: entry.weekday,
                  startMinutes: entry.startMinutes,
                  endMinutes: entry.endMinutes,
                ),
              );
        }
      });

      await NotificationService.instance.syncAllReminders(db);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '${_entries.length} periods imported and reminders updated.',
          ),
        ),
      );
      setState(() {
        _entries = const [];
        _fileName = null;
      });
    } catch (error) {
      if (mounted) setState(() => _error = error.toString());
    } finally {
      if (mounted) setState(() => _importing = false);
    }
  }

  String _normalize(String value) =>
      value.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]'), '');

  String _formatMinutes(int minutes) {
    final hour = minutes ~/ 60;
    final minute = minutes % 60;
    final period = hour < 12 ? 'AM' : 'PM';
    final displayHour = hour % 12 == 0 ? 12 : hour % 12;
    return '$displayHour:${minute.toString().padLeft(2, '0')} $period';
  }

  @override
  Widget build(BuildContext context) {
    final db = ref.watch(databaseProvider);
    final subjects =
        ref.watch(activeSubjectsProvider).value ?? const <Subject>[];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.scheduleOnly ? 'Full Schedule' : 'Import Timetable'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: context.sideMargin,
          vertical: AsterSpacing.spaceLg,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!widget.scheduleOnly) ...[
              AsterCard(
                child: Column(
                  children: [
                    Icon(
                      Icons.upload_file,
                      size: 48,
                      color: context.colorScheme.primary,
                    ),
                    const SizedBox(height: AsterSpacing.spaceSm),
                    Text(
                      'Upload your college timetable',
                      style: context.asterTextTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AsterSpacing.spaceXs),
                    Text(
                      'Choose a clear PDF or image. Aster will extract lecture days and times for your review.',
                      style: context.asterTextTheme.bodySmall?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AsterSpacing.spaceMd),
                    FilledButton.icon(
                      onPressed: _analyzing ? null : _chooseAndAnalyze,
                      icon: _analyzing
                          ? const SizedBox.square(
                              dimension: 18,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Icon(Icons.attach_file),
                      label: Text(
                        _analyzing ? 'Analyzing timetable...' : 'Choose file',
                      ),
                    ),
                  ],
                ),
              ),
              if (_error != null) ...[
                const SizedBox(height: AsterSpacing.spaceMd),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(AsterSpacing.spaceMd),
                  decoration: BoxDecoration(
                    color: context.colorScheme.errorContainer,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.document_scanner_outlined,
                        color: context.colorScheme.onErrorContainer,
                      ),
                      const SizedBox(width: AsterSpacing.spaceSm),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Timetable could not be read',
                              style: context.asterTextTheme.titleSmall
                                  ?.copyWith(
                                    color: context.colorScheme.onErrorContainer,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _error!,
                              style: context.asterTextTheme.bodySmall?.copyWith(
                                color: context.colorScheme.onErrorContainer,
                              ),
                            ),
                            if (_fileName != null) ...[
                              const SizedBox(height: 6),
                              Text(
                                'Selected: $_fileName',
                                style: context.asterTextTheme.labelSmall
                                    ?.copyWith(
                                      color:
                                          context.colorScheme.onErrorContainer,
                                    ),
                              ),
                            ],
                            const SizedBox(height: AsterSpacing.spaceSm),
                            OutlinedButton.icon(
                              onPressed: _analyzing ? null : _retryAnalysis,
                              icon: const Icon(Icons.refresh),
                              label: const Text('Retry same file'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AsterSpacing.spaceSm),
                Text(
                  'Tip: crop the image to one class timetable and make sure weekday names and bell timings are readable.',
                  style: context.asterTextTheme.bodySmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
              if (_entries.isNotEmpty) ...[
                const SizedBox(height: AsterSpacing.spaceLg),
                Text(
                  'Review ${_entries.length} periods',
                  style: context.asterTextTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (_fileName != null)
                  Text(
                    _fileName!,
                    style: context.asterTextTheme.bodySmall?.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                const SizedBox(height: AsterSpacing.spaceMd),
                ..._entries.map(
                  (entry) => Padding(
                    padding: const EdgeInsets.only(
                      bottom: AsterSpacing.spaceSm,
                    ),
                    child: AsterCard(
                      padding: const EdgeInsets.all(AsterSpacing.spaceMd),
                      child: Row(
                        children: [
                          CircleAvatar(
                            child: Text(_weekdays[entry.weekday - 1][0]),
                          ),
                          const SizedBox(width: AsterSpacing.spaceMd),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  entry.subjectName,
                                  style: context.asterTextTheme.titleSmall
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '${_weekdays[entry.weekday - 1]} | ${_formatMinutes(entry.startMinutes)} - ${_formatMinutes(entry.endMinutes)}',
                                  style: context.asterTextTheme.bodySmall,
                                ),
                                if (entry.teacherName.isNotEmpty)
                                  Text(
                                    entry.teacherName,
                                    style: context.asterTextTheme.bodySmall
                                        ?.copyWith(
                                          color: context.colorScheme.primary,
                                        ),
                                  ),
                              ],
                            ),
                          ),
                          if (entry.courseCode.isNotEmpty)
                            Text(
                              entry.courseCode,
                              style: context.asterTextTheme.labelSmall,
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: AsterSpacing.spaceMd),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: _importing ? null : _import,
                    icon: const Icon(Icons.check_circle_outline),
                    label: Text(
                      _importing
                          ? 'Importing...'
                          : 'Replace & Import Timetable',
                    ),
                  ),
                ),
              ],
            ],
            const SizedBox(height: AsterSpacing.spaceXl),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Your saved timetable',
                    style: context.asterTextTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Icon(
                  Icons.calendar_view_week_outlined,
                  color: context.colorScheme.primary,
                ),
              ],
            ),
            const SizedBox(height: AsterSpacing.spaceXs),
            Text(
              'This schedule is used for lecture and next-period reminders.',
              style: context.asterTextTheme.bodySmall?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: AsterSpacing.spaceMd),
            StreamBuilder<List<TimetableEntry>>(
              stream: db.select(db.timetableEntries).watch(),
              builder: (context, snapshot) {
                final subjectIds = subjects
                    .map((subject) => subject.id)
                    .toSet();
                final entries =
                    (snapshot.data ?? const <TimetableEntry>[])
                        .where((entry) => subjectIds.contains(entry.subjectId))
                        .toList()
                      ..sort((a, b) {
                        final day = a.weekday.compareTo(b.weekday);
                        return day != 0
                            ? day
                            : a.startMinutes.compareTo(b.startMinutes);
                      });
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (entries.isEmpty) {
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(AsterSpacing.spaceLg),
                    decoration: BoxDecoration(
                      color: context.colorScheme.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: context.colorScheme.outlineVariant,
                      ),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.event_note_outlined,
                          size: 36,
                          color: context.colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(height: AsterSpacing.spaceSm),
                        const Text('No timetable has been saved yet.'),
                        const SizedBox(height: 4),
                        Text(
                          widget.scheduleOnly
                              ? 'Import your college timetable to create the weekly schedule.'
                              : 'Upload a timetable above to create your weekly schedule.',
                          textAlign: TextAlign.center,
                          style: context.asterTextTheme.bodySmall?.copyWith(
                            color: context.colorScheme.onSurfaceVariant,
                          ),
                        ),
                        if (widget.scheduleOnly) ...[
                          const SizedBox(height: AsterSpacing.spaceMd),
                          FilledButton.icon(
                            onPressed: () =>
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        const TimetableImportScreen(),
                                  ),
                                ),
                            icon: const Icon(Icons.upload_file),
                            label: const Text('Import Timetable'),
                          ),
                        ],
                      ],
                    ),
                  );
                }
                final names = {
                  for (final subject in subjects) subject.id: subject,
                };
                return Column(
                  children: [
                    for (var weekday = 1; weekday <= 7; weekday++)
                      if (entries.any((entry) => entry.weekday == weekday))
                        _SavedDayCard(
                          day: _weekdays[weekday - 1],
                          entries: entries
                              .where((entry) => entry.weekday == weekday)
                              .toList(),
                          subjects: names,
                          formatMinutes: _formatMinutes,
                        ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _SavedDayCard extends StatelessWidget {
  const _SavedDayCard({
    required this.day,
    required this.entries,
    required this.subjects,
    required this.formatMinutes,
  });

  final String day;
  final List<TimetableEntry> entries;
  final Map<int, Subject> subjects;
  final String Function(int) formatMinutes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AsterSpacing.spaceMd),
      child: AsterCard(
        padding: const EdgeInsets.all(AsterSpacing.spaceMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(day, style: context.asterTextTheme.titleMedium),
                const Spacer(),
                Text(
                  '${entries.length} ${entries.length == 1 ? 'period' : 'periods'}',
                  style: context.asterTextTheme.labelSmall?.copyWith(
                    color: context.colorScheme.primary,
                  ),
                ),
              ],
            ),
            const Divider(height: AsterSpacing.spaceLg),
            for (var index = 0; index < entries.length; index++) ...[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 82,
                    child: Text(
                      formatMinutes(entries[index].startMinutes),
                      style: context.asterTextTheme.labelMedium?.copyWith(
                        color: context.colorScheme.primary,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          subjects[entries[index].subjectId]?.name ??
                              'Unknown subject',
                          style: context.asterTextTheme.titleSmall,
                        ),
                        Text(
                          '${formatMinutes(entries[index].startMinutes)} – ${formatMinutes(entries[index].endMinutes)}',
                          style: context.asterTextTheme.bodySmall?.copyWith(
                            color: context.colorScheme.onSurfaceVariant,
                          ),
                        ),
                        if (subjects[entries[index].subjectId]
                                ?.teacherName
                                ?.isNotEmpty ==
                            true)
                          Text(
                            subjects[entries[index].subjectId]!.teacherName!,
                            style: context.asterTextTheme.bodySmall?.copyWith(
                              color: context.colorScheme.primary,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              if (index != entries.length - 1)
                const Divider(height: AsterSpacing.spaceLg),
            ],
          ],
        ),
      ),
    );
  }
}
