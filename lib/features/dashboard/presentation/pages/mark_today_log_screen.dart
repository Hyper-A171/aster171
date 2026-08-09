import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../app/theme/aster_spacing.dart';
import '../../../../app/theme/aster_theme.dart';
import '../../../../core/database/aster_database.dart';
import '../../../../core/providers/database_providers.dart';
import '../../../../core/responsive/responsive_layout.dart';
import '../../../../core/widgets/cards/aster_card.dart';
import '../../../planning/presentation/pages/timetable_import_screen.dart';

class MarkTodayLogScreen extends ConsumerStatefulWidget {
  const MarkTodayLogScreen({super.key});

  @override
  ConsumerState<MarkTodayLogScreen> createState() => _MarkTodayLogScreenState();
}

class _MarkTodayLogScreenState extends ConsumerState<MarkTodayLogScreen> {
  final Map<int, String> _statuses = {};
  bool _loadingExisting = true;
  bool _saving = false;

  DateTime get _today {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  @override
  void initState() {
    super.initState();
    _loadExisting();
  }

  Future<void> _loadExisting() async {
    final db = ref.read(databaseProvider);
    final tomorrow = _today.add(const Duration(days: 1));
    final sessions =
        await (db.select(db.lectureSessions)..where(
              (s) =>
                  s.sessionDate.isBiggerOrEqualValue(_today) &
                  s.sessionDate.isSmallerThanValue(tomorrow),
            ))
            .get();
    for (final session in sessions) {
      if (session.timetableEntryId == null) continue;
      final record = await (db.select(
        db.attendanceRecords,
      )..where((r) => r.lectureSessionId.equals(session.id))).getSingleOrNull();
      if (record != null) {
        _statuses[session.timetableEntryId!] = record.attendanceStatus;
      }
    }
    if (mounted) setState(() => _loadingExisting = false);
  }

  Future<void> _save(List<TimetableEntry> entries) async {
    if (_statuses.length < entries.length) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Mark every lecture before saving.')),
      );
      return;
    }
    setState(() => _saving = true);
    try {
      final db = ref.read(databaseProvider);
      for (final entry in entries) {
        var session =
            await (db.select(db.lectureSessions)
                  ..where(
                    (s) =>
                        s.timetableEntryId.equals(entry.id) &
                        s.sessionDate.equals(_today),
                  )
                  ..limit(1))
                .getSingleOrNull();
        if (session == null) {
          final id = await db.lectureSessionsDao.insertSession(
            LectureSessionsCompanion.insert(
              subjectId: entry.subjectId,
              timetableEntryId: drift.Value(entry.id),
              sessionDate: _today,
              startMinutes: entry.startMinutes,
              endMinutes: entry.endMinutes,
              attendanceUnits: drift.Value(entry.attendanceUnits),
              sessionStatus: _statuses[entry.id]!,
              isMandatory: drift.Value(entry.isMandatory),
            ),
          );
          session = await (db.select(
            db.lectureSessions,
          )..where((s) => s.id.equals(id))).getSingle();
        }
        final status = _statuses[entry.id]!;
        await db.attendanceDao.markAttendanceTransaction(
          lectureSessionId: session.id,
          subjectId: entry.subjectId,
          status: status,
          countedUnits: entry.attendanceUnits,
          attendedUnits: status == 'present' ? entry.attendanceUnits : 0,
          notes: 'Marked from Today log',
        );
      }
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Today’s attendance was saved.')),
        );
        Navigator.pop(context);
      }
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not save attendance: $error')),
        );
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final db = ref.watch(databaseProvider);
    final subjects =
        ref.watch(activeSubjectsProvider).value ?? const <Subject>[];
    final names = {for (final subject in subjects) subject.id: subject};
    return Scaffold(
      appBar: AppBar(title: const Text('Mark Today’s Log')),
      body: StreamBuilder<List<TimetableEntry>>(
        stream: (db.select(
          db.timetableEntries,
        )..where((entry) => entry.weekday.equals(_today.weekday))).watch(),
        builder: (context, snapshot) {
          if (_loadingExisting ||
              snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final subjectIds = names.keys.toSet();
          final entries =
              (snapshot.data ?? const <TimetableEntry>[])
                  .where((entry) => subjectIds.contains(entry.subjectId))
                  .toList()
                ..sort((a, b) => a.startMinutes.compareTo(b.startMinutes));
          if (entries.isEmpty) return _emptyState(context);

          return ListView(
            padding: EdgeInsets.symmetric(
              horizontal: context.sideMargin,
              vertical: AsterSpacing.spaceLg,
            ),
            children: [
              Text(
                DateFormat('EEEE, d MMMM').format(_today),
                style: context.asterTextTheme.titleLarge,
              ),
              Text(
                'Mark the actual status for all ${entries.length} scheduled lectures.',
                style: context.asterTextTheme.bodySmall?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: AsterSpacing.spaceLg),
              ...entries.map(
                (entry) => Padding(
                  padding: const EdgeInsets.only(bottom: AsterSpacing.spaceMd),
                  child: _LectureLogCard(
                    entry: entry,
                    subject: names[entry.subjectId],
                    status: _statuses[entry.id],
                    onChanged: (status) =>
                        setState(() => _statuses[entry.id] = status),
                  ),
                ),
              ),
              const SizedBox(height: AsterSpacing.spaceMd),
              FilledButton.icon(
                onPressed: _saving ? null : () => _save(entries),
                icon: _saving
                    ? const SizedBox.square(
                        dimension: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.save_outlined),
                label: const Text('Save Today’s Attendance'),
                style: FilledButton.styleFrom(
                  minimumSize: const Size(double.infinity, 52),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _emptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AsterSpacing.spaceXl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.event_available_outlined,
              size: 64,
              color: context.colorScheme.primary,
            ),
            const SizedBox(height: AsterSpacing.spaceLg),
            Text(
              'No lectures scheduled today',
              style: context.asterTextTheme.titleLarge,
            ),
            const SizedBox(height: AsterSpacing.spaceXs),
            const Text(
              'If this is incorrect, import or update your college timetable.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AsterSpacing.spaceLg),
            FilledButton.icon(
              onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) => const TimetableImportScreen(),
                ),
              ),
              icon: const Icon(Icons.upload_file),
              label: const Text('Import Timetable'),
            ),
          ],
        ),
      ),
    );
  }
}

class _LectureLogCard extends StatelessWidget {
  const _LectureLogCard({
    required this.entry,
    required this.subject,
    required this.status,
    required this.onChanged,
  });

  final TimetableEntry entry;
  final Subject? subject;
  final String? status;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return AsterCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subject?.name ?? 'Unknown subject',
                      style: context.asterTextTheme.titleMedium,
                    ),
                    Text(
                      '${_time(entry.startMinutes)} – ${_time(entry.endMinutes)}${subject?.code == null ? '' : ' • ${subject!.code}'}',
                      style: context.asterTextTheme.bodySmall?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              if (status != null)
                Icon(Icons.check_circle, color: context.colorScheme.primary),
            ],
          ),
          const SizedBox(height: AsterSpacing.spaceMd),
          Wrap(
            spacing: AsterSpacing.spaceSm,
            runSpacing: AsterSpacing.spaceSm,
            children: [
              _choice(context, 'present', 'Present', Icons.check),
              _choice(context, 'absent', 'Absent', Icons.close),
              _choice(context, 'cancelled', 'Cancelled', Icons.block),
              _choice(context, 'excused', 'Excused', Icons.health_and_safety),
            ],
          ),
        ],
      ),
    );
  }

  Widget _choice(
    BuildContext context,
    String value,
    String label,
    IconData icon,
  ) {
    return ChoiceChip(
      selected: status == value,
      avatar: Icon(icon, size: 16),
      label: Text(label),
      onSelected: (_) => onChanged(value),
    );
  }

  String _time(int minutes) {
    final hour = minutes ~/ 60;
    final minute = minutes % 60;
    final shownHour = hour % 12 == 0 ? 12 : hour % 12;
    return '$shownHour:${minute.toString().padLeft(2, '0')} ${hour < 12 ? 'AM' : 'PM'}';
  }
}
