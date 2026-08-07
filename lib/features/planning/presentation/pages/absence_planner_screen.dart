import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../app/theme/aster_spacing.dart';
import '../../../../app/theme/aster_theme.dart';
import '../../../../core/database/aster_database.dart';
import '../../../../core/providers/database_providers.dart';
import '../../../../core/responsive/responsive_layout.dart';
import '../../../../core/services/attendance_calculator.dart';
import '../../../../core/services/notification_service.dart';
import '../../../../core/widgets/buttons/aster_primary_button.dart';
import '../../../../core/widgets/cards/aster_card.dart';
import '../../../../core/widgets/fields/aster_date_field.dart';

class AbsencePlannerScreen extends ConsumerStatefulWidget {
  const AbsencePlannerScreen({super.key});

  @override
  ConsumerState<AbsencePlannerScreen> createState() => _State();
}

class _State extends ConsumerState<AbsencePlannerScreen> {
  DateTime _date = DateTime.now().add(const Duration(days: 1));
  String _reason = 'Travel';
  bool _loading = false;
  bool _saving = false;
  List<_Impact>? _impacts;
  bool _internshipAffected = false;

  Future<void> _analyze() async {
    setState(() => _loading = true);
    try {
      final db = ref.read(databaseProvider);
      final profile = await ref.read(currentStudentProfileProvider.future);
      if (profile == null) throw Exception('Complete your profile first.');
      final entries = await (db.select(
        db.timetableEntries,
      )..where((e) => e.weekday.equals(_date.weekday))).get();
      final subjects = await (db.select(
        db.subjects,
      )..where((s) => s.studentProfileId.equals(profile.id))).get();
      final subjectsById = {for (final s in subjects) s.id: s};
      final impacts = <_Impact>[];

      for (final entry in entries) {
        final subject = subjectsById[entry.subjectId];
        if (subject == null) continue;
        final records = await (db.select(
          db.attendanceRecords,
        )..where((r) => r.subjectId.equals(subject.id))).get();
        var attended = 0.0;
        var counted = 0.0;
        for (final record in records) {
          if (record.attendanceStatus == 'present') {
            attended += record.attendedUnits;
            counted += record.countedUnits;
          } else if (record.attendanceStatus == 'absent') {
            counted += record.countedUnits;
          }
        }
        final required = subject.requiredPercentageOverride ?? 75.0;
        final projected = AttendanceCalculator.calculatePercentage(
          attended,
          counted + entry.attendanceUnits,
        );
        impacts.add(
          _Impact(
            name: subject.name,
            startMinutes: entry.startMinutes,
            current: counted == 0
                ? null
                : AttendanceCalculator.calculatePercentage(attended, counted),
            projected: projected,
            required: required,
            recovery: AttendanceCalculator.calculateRecoveryLectures(
              attended,
              counted + entry.attendanceUnits,
              required,
            ),
          ),
        );
      }

      final req =
          await (db.select(db.internshipRequirements)
                ..where((r) => r.studentProfileId.equals(profile.id))
                ..limit(1))
              .getSingleOrNull();
      var internshipAffected = false;
      if (req != null && _date.weekday <= 6) {
        final selected =
            await (db.select(db.internshipAvailability)..where(
                  (a) =>
                      a.internshipRequirementId.equals(req.id) &
                      a.weekday.equals(_date.weekday) &
                      a.isAvailable.equals(true),
                ))
                .getSingleOrNull();
        internshipAffected =
            selected != null &&
            (req.internshipStartDate == null ||
                !_date.isBefore(req.internshipStartDate!)) &&
            (req.internshipEndDate == null ||
                !_date.isAfter(req.internshipEndDate!));
      }
      if (mounted) {
        setState(() {
          _impacts = impacts;
          _internshipAffected = internshipAffected;
        });
      }
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not analyze date: $error')),
        );
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _save() async {
    if (_impacts == null) await _analyze();
    if (!mounted || _impacts == null) return;
    setState(() => _saving = true);
    try {
      final db = ref.read(databaseProvider);
      final day = DateTime(_date.year, _date.month, _date.day);
      final monday = day.subtract(Duration(days: day.weekday - 1));
      await db.transaction(() async {
        var plan =
            await (db.select(db.weeklyPlans)
                  ..where((p) => p.weekStartDate.equals(monday))
                  ..orderBy([(p) => drift.OrderingTerm.desc(p.isSelected)])
                  ..limit(1))
                .getSingleOrNull();
        if (plan == null) {
          final id = await db
              .into(db.weeklyPlans)
              .insert(
                WeeklyPlansCompanion.insert(
                  weekStartDate: monday,
                  planType: 'personalized',
                  isSelected: const drift.Value(true),
                  explanation: drift.Value(
                    'Adjusted for $_reason on ${DateFormat('d MMM yyyy').format(day)}.',
                  ),
                ),
              );
          plan = await (db.select(
            db.weeklyPlans,
          )..where((p) => p.id.equals(id))).getSingle();
        }
        final old =
            await (db.select(db.weeklyPlanDays)..where(
                  (d) => d.weeklyPlanId.equals(plan!.id) & d.date.equals(day),
                ))
                .getSingleOrNull();
        final warning = _warning();
        if (old == null) {
          await db
              .into(db.weeklyPlanDays)
              .insert(
                WeeklyPlanDaysCompanion.insert(
                  weeklyPlanId: plan.id,
                  date: day,
                  dayType: 'plannedLeave',
                  warning: drift.Value(warning),
                ),
              );
        } else {
          await (db.update(
            db.weeklyPlanDays,
          )..where((d) => d.id.equals(old.id))).write(
            WeeklyPlanDaysCompanion(
              dayType: const drift.Value('plannedLeave'),
              warning: drift.Value(warning),
              updatedAt: drift.Value(DateTime.now()),
            ),
          );
        }
      });
      await NotificationService.instance.syncAllReminders(db);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Leave saved and reminders updated.')),
        );
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  String _warning() {
    final risky = _impacts!.where((i) => !i.safe).length;
    return [
      '$_reason leave',
      if (_impacts!.isNotEmpty) '${_impacts!.length} lectures missed',
      if (risky > 0) '$risky subjects below 75%',
      if (_internshipAffected) 'reschedule internship day',
    ].join(' • ');
  }

  @override
  Widget build(BuildContext context) {
    final impacts = _impacts;
    final risky = impacts?.where((i) => !i.safe).length ?? 0;
    return Scaffold(
      appBar: AppBar(title: const Text('Plan Travel or Leave')),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: context.sideMargin,
          vertical: AsterSpacing.spaceLg,
        ),
        children: [
          Container(
            padding: const EdgeInsets.all(AsterSpacing.spaceLg),
            decoration: BoxDecoration(
              color: context.colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.route_outlined,
                  size: 36,
                  color: context.colorScheme.onPrimaryContainer,
                ),
                const SizedBox(width: AsterSpacing.spaceMd),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Plan before you miss a day',
                        style: context.asterTextTheme.titleMedium?.copyWith(
                          color: context.colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Preview lecture, attendance and internship impact before confirming leave.',
                        style: context.asterTextTheme.bodySmall?.copyWith(
                          color: context.colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AsterSpacing.spaceLg),
          const _StepHeader(number: 1, title: 'Choose date and reason'),
          const SizedBox(height: AsterSpacing.spaceSm),
          AsterCard(
            child: Column(
              children: [
                AsterDateField(
                  label: 'Leave date',
                  value: _date,
                  onDateSelected: (value) => setState(() {
                    _date = value;
                    _impacts = null;
                  }),
                ),
                const SizedBox(height: AsterSpacing.spaceMd),
                DropdownButtonFormField<String>(
                  initialValue: _reason,
                  decoration: const InputDecoration(labelText: 'Reason'),
                  items: const [
                    DropdownMenuItem(value: 'Travel', child: Text('Travel')),
                    DropdownMenuItem(
                      value: 'Personal',
                      child: Text('Personal leave'),
                    ),
                    DropdownMenuItem(
                      value: 'Medical',
                      child: Text('Medical leave'),
                    ),
                    DropdownMenuItem(value: 'Bunk', child: Text('Bunk')),
                  ],
                  onChanged: (value) => setState(() {
                    _reason = value ?? 'Travel';
                    _impacts = null;
                  }),
                ),
                const SizedBox(height: AsterSpacing.spaceLg),
                AsterPrimaryButton(
                  label: 'Preview Impact',
                  icon: const Icon(Icons.analytics_outlined),
                  isLoading: _loading,
                  onPressed: _analyze,
                  fullWidth: true,
                ),
              ],
            ),
          ),
          if (impacts != null) ...[
            const SizedBox(height: AsterSpacing.spaceLg),
            const _StepHeader(number: 2, title: 'Review the impact'),
            const SizedBox(height: AsterSpacing.spaceSm),
            AsterCard(
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(
                  risky == 0 ? Icons.check_circle : Icons.warning_amber,
                  color: risky == 0 ? Colors.green : Colors.orange,
                ),
                title: Text(
                  impacts.isEmpty && !_internshipAffected
                      ? 'No commitment found for this date'
                      : risky == 0
                      ? 'Leave is currently safe'
                      : '$risky subject(s) need recovery',
                ),
                subtitle: Text(
                  risky == 0
                      ? 'Projected attendance remains at or above 75%.'
                      : 'Review the projected percentage before saving.',
                ),
              ),
            ),
            if (_internshipAffected) ...[
              const SizedBox(height: AsterSpacing.spaceSm),
              const AsterCard(
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.work_history_outlined),
                  title: Text('Internship day affected'),
                  subtitle: Text(
                    'Move this visit to another Monday–Saturday day and still complete at least 3 days this week.',
                  ),
                ),
              ),
            ],
            const SizedBox(height: AsterSpacing.spaceLg),
            Text('Lecture impact', style: context.asterTextTheme.titleLarge),
            const SizedBox(height: AsterSpacing.spaceSm),
            if (impacts.isEmpty)
              const Text('No lectures scheduled on this date.')
            else
              ...impacts.map((impact) => _ImpactCard(impact: impact)),
            const SizedBox(height: AsterSpacing.spaceLg),
            const _StepHeader(number: 3, title: 'Confirm your plan'),
            const SizedBox(height: AsterSpacing.spaceSm),
            AsterPrimaryButton(
              label: 'Save Leave & Update Plan',
              icon: const Icon(Icons.event_busy),
              isLoading: _saving,
              onPressed: _save,
              fullWidth: true,
            ),
            const SizedBox(height: AsterSpacing.spaceSm),
            Text(
              'This adjusts the plan and suppresses reminders for the date. Official attendance is not changed automatically.',
              style: context.asterTextTheme.bodySmall?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _StepHeader extends StatelessWidget {
  const _StepHeader({required this.number, required this.title});
  final int number;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 15,
          backgroundColor: context.colorScheme.primary,
          foregroundColor: context.colorScheme.onPrimary,
          child: Text('$number'),
        ),
        const SizedBox(width: AsterSpacing.spaceSm),
        Text(title, style: context.asterTextTheme.titleMedium),
      ],
    );
  }
}

class _Impact {
  const _Impact({
    required this.name,
    required this.startMinutes,
    required this.current,
    required this.projected,
    required this.required,
    required this.recovery,
  });
  final String name;
  final int startMinutes;
  final double? current;
  final double projected;
  final double required;
  final int recovery;
  bool get safe => projected >= required;
}

class _ImpactCard extends StatelessWidget {
  const _ImpactCard({required this.impact});
  final _Impact impact;

  @override
  Widget build(BuildContext context) {
    final time = TimeOfDay(
      hour: impact.startMinutes ~/ 60,
      minute: impact.startMinutes % 60,
    ).format(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: AsterSpacing.spaceSm),
      child: AsterCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(impact.name, style: context.asterTextTheme.titleMedium),
            Text('Lecture at $time'),
            const SizedBox(height: AsterSpacing.spaceSm),
            Text(
              impact.current == null
                  ? 'No history → projected ${impact.projected.toStringAsFixed(1)}%'
                  : '${impact.current!.toStringAsFixed(1)}% → ${impact.projected.toStringAsFixed(1)}%',
              style: TextStyle(
                color: impact.safe ? Colors.green : Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              impact.safe
                  ? 'Still meets the ${impact.required.toStringAsFixed(0)}% requirement.'
                  : 'Attend the next ${impact.recovery} lecture(s) to recover.',
            ),
          ],
        ),
      ),
    );
  }
}
