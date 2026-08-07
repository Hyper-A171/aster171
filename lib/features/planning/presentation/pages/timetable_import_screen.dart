import 'package:drift/drift.dart' as drift;
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/theme/aster_spacing.dart';
import '../../../../app/theme/aster_theme.dart';
import '../../../../core/ai/ai_providers.dart';
import '../../../../core/database/aster_database.dart';
import '../../../../core/models/timetable_import.dart';
import '../../../../core/providers/database_providers.dart';
import '../../../../core/responsive/responsive_layout.dart';
import '../../../../core/services/notification_service.dart';
import '../../../../core/widgets/cards/aster_card.dart';

class TimetableImportScreen extends ConsumerStatefulWidget {
  const TimetableImportScreen({super.key});

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
      final entries = await ref
          .read(geminiClientProvider)
          .analyzeTimetable(bytes, mimeType);
      if (!mounted) return;
      setState(() {
        _fileName = file.name;
        _entries = entries;
      });
    } catch (error) {
      if (mounted) setState(() => _error = error.toString());
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
                  ),
                );
            idsByName[normalizedName] = subjectId;
            if (normalizedCode.isNotEmpty) {
              idsByCode[normalizedCode] = subjectId;
            }
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
      Navigator.of(context).pop();
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
    return Scaffold(
      appBar: AppBar(title: const Text('Import Timetable')),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: context.sideMargin,
          vertical: AsterSpacing.spaceLg,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              Text(
                _error!,
                style: context.asterTextTheme.bodySmall?.copyWith(
                  color: context.colorScheme.error,
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
                  padding: const EdgeInsets.only(bottom: AsterSpacing.spaceSm),
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
                    _importing ? 'Importing...' : 'Replace & Import Timetable',
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
