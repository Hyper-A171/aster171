import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../app/theme/aster_spacing.dart';
import '../../../../app/theme/aster_theme.dart';
import '../../../../core/responsive/responsive_layout.dart';
import '../../../../core/widgets/cards/aster_card.dart';
import '../../../../core/widgets/buttons/aster_primary_button.dart';
import '../../../../core/widgets/chips/aster_status_chip.dart';
import '../../../../core/widgets/cards/aster_status_card.dart';
import '../../../../core/providers/database_providers.dart';
import '../../../../core/database/aster_database.dart';
import '../../../../core/models/attendance_summary.dart';
import '../../../../core/services/attendance_risk_evaluator.dart';
import '../../../../core/services/semester_projection_service.dart';

class SubjectDetailsScreen extends ConsumerWidget {
  final int subjectId;

  const SubjectDetailsScreen({super.key, required this.subjectId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subjectAsync = ref.watch(subjectDetailProvider(subjectId));
    final summaryAsync = ref.watch(subjectAttendanceSummaryProvider(subjectId));
    final historyAsync = ref.watch(subjectAttendanceHistoryProvider(subjectId));

    return subjectAsync.when(
      data: (subject) {
        final summary = summaryAsync.value ?? const AttendanceSummary.initial();
        final history = historyAsync.value ?? [];
        return _buildContent(context, ref, subject, summary, history);
      },
      loading: () => Scaffold(
        appBar: AppBar(title: const Text('Loading...')),
        body: const Center(child: CircularProgressIndicator()),
      ),
      error: (err, stack) => Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: Center(child: Text('Error loading subject: $err')),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    WidgetRef ref,
    Subject subject,
    AttendanceSummary summary,
    List<AttendanceRecord> history,
  ) {
    final double requiredPct = subject.requiredPercentageOverride ?? 75.0;
    const double safetyTargetPct = 80.0;

    final double maxPossible =
        SemesterProjectionService.calculateMaxPossibleAttendance(
          attendedUnits: summary.attendedUnits,
          totalCountedUnits: summary.totalCountedUnits,
          remainingPlannedUnits: 20.0, // Default remaining semester units
        );

    final double projected =
        SemesterProjectionService.calculateProjectedAttendance(
          attendedUnits: summary.attendedUnits,
          totalCountedUnits: summary.totalCountedUnits,
          remainingPlannedUnits: 20.0,
        );

    return Scaffold(
      appBar: AppBar(
        title: Text(subject.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            onPressed: () {
              // Edit subject action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: context.sideMargin,
          vertical: AsterSpacing.spaceLg,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (subject.code != null && subject.code!.isNotEmpty)
                  Text(
                    subject.code!,
                    style: context.asterTextTheme.bodyLarge?.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                const SizedBox(height: AsterSpacing.spaceSm),
                AsterStatusChip(status: summary.riskStatus),
              ],
            ),
            const SizedBox(height: AsterSpacing.spaceXl),

            // Single Main Attendance Percentage Indicator
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: CircularProgressIndicator(
                      value: summary.hasData
                          ? summary.currentPercentage / 100
                          : 0,
                      strokeWidth: 16,
                      strokeCap: StrokeCap.round,
                      backgroundColor:
                          context.colorScheme.surfaceContainerHighest,
                      color: summary.hasData
                          ? (summary.currentPercentage >= requiredPct
                                ? context.colorScheme.primary
                                : context.colorScheme.error)
                          : context.colorScheme.outlineVariant,
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (summary.hasData) ...[
                        Text(
                          '${summary.currentPercentage.toStringAsFixed(1)}%',
                          style: context.asterTextTheme.displayMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: context.colorScheme.onSurface,
                          ),
                        ),
                        Text(
                          'Attendance',
                          style: context.asterTextTheme.labelMedium?.copyWith(
                            color: context.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ] else ...[
                        Text(
                          'No attendance\nrecorded',
                          textAlign: TextAlign.center,
                          style: context.asterTextTheme.titleMedium?.copyWith(
                            color: context.colorScheme.onSurfaceVariant,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: AsterSpacing.spaceXl),

            // Two-Column Metrics Section
            _buildMetricsSection(
              context,
              summary: summary,
              requiredPct: requiredPct,
              safetyTargetPct: safetyTargetPct,
              maxPossible: maxPossible,
              projected: projected,
            ),
            const SizedBox(height: AsterSpacing.spaceXl),

            // Primary Action: Mark Attendance
            AsterPrimaryButton(
              label: 'Mark Attendance',
              icon: const Icon(Icons.check_circle_outline),
              onPressed: () {
                _showMarkAttendanceBottomSheet(context, ref, subject);
              },
              fullWidth: true,
            ),
            const SizedBox(height: AsterSpacing.spaceXl),

            // Attendance History Section
            Text(
              'Attendance History',
              style: context.asterTextTheme.titleMedium,
            ),
            const SizedBox(height: AsterSpacing.spaceMd),
            if (history.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'No attendance sessions recorded yet.',
                  style: context.asterTextTheme.bodyMedium?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
              )
            else
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: history.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: AsterSpacing.spaceSm),
                itemBuilder: (context, index) {
                  final record = history[index];
                  return _buildHistoryCard(context, record);
                },
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricsSection(
    BuildContext context, {
    required AttendanceSummary summary,
    required double requiredPct,
    required double safetyTargetPct,
    required double maxPossible,
    required double projected,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Overview & Metrics',
          style: context.asterTextTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: AsterSpacing.spaceMd),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: AsterSpacing.spaceMd,
          crossAxisSpacing: AsterSpacing.spaceMd,
          childAspectRatio: 2.3,
          children: [
            _buildMetricTile(
              context,
              label: 'Attended lectures',
              value:
                  '${summary.attendedUnits.toInt()} of ${summary.totalCountedUnits.toInt()}',
            ),
            _buildMetricTile(
              context,
              label: 'Total counted',
              value: '${summary.totalCountedUnits.toInt()}',
            ),
            _buildMetricTile(
              context,
              label: 'Required',
              value: '${requiredPct.toInt()}%',
            ),
            _buildMetricTile(
              context,
              label: 'Safety target',
              value: '${safetyTargetPct.toInt()}%',
            ),
            _buildMetricTile(
              context,
              label: 'Safe absences',
              value: summary.hasData ? '${summary.safeAbsences}' : 'N/A',
            ),
            _buildMetricTile(
              context,
              label: 'Recovery needed',
              value: summary.hasData ? '${summary.recoveryNeeded}' : 'N/A',
            ),
            _buildMetricTile(
              context,
              label: 'Max possible',
              value: '${maxPossible.round()}%',
            ),
            _buildMetricTile(
              context,
              label: 'Projected semester-end',
              value: summary.hasData ? '${projected.round()}%' : 'N/A',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMetricTile(
    BuildContext context, {
    required String label,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: context.asterTextTheme.labelSmall?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: context.asterTextTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryCard(BuildContext context, AttendanceRecord record) {
    final dateStr = DateFormat('EEEE, MMM d, yyyy').format(record.createdAt);
    final status = record.attendanceStatus.toUpperCase();
    final isPresent = record.attendanceStatus.toLowerCase() == 'present';
    final isAbsent = record.attendanceStatus.toLowerCase() == 'absent';

    Color statusColor;
    if (isPresent) {
      statusColor = context.asterColors.safe;
    } else if (isAbsent) {
      statusColor = context.colorScheme.error;
    } else {
      statusColor = context.colorScheme.outline;
    }

    return AsterCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(dateStr, style: context.asterTextTheme.bodyMedium),
          Text(
            status,
            style: context.asterTextTheme.labelLarge?.copyWith(
              color: statusColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  void _showMarkAttendanceBottomSheet(
    BuildContext context,
    WidgetRef ref,
    Subject subject,
  ) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Text(
                    'Mark Attendance - ${subject.name}',
                    style: context.asterTextTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.check_circle, color: Colors.green),
                  title: const Text('Present'),
                  onTap: () => _handleMarkAttendance(
                    context,
                    ref,
                    subject.id,
                    'present',
                    1.0,
                    1.0,
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.cancel, color: Colors.red),
                  title: const Text('Absent'),
                  onTap: () => _handleMarkAttendance(
                    context,
                    ref,
                    subject.id,
                    'absent',
                    1.0,
                    0.0,
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.event_busy, color: Colors.orange),
                  title: const Text('Cancelled'),
                  onTap: () => _handleMarkAttendance(
                    context,
                    ref,
                    subject.id,
                    'cancelled',
                    0.0,
                    0.0,
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.help_outline, color: Colors.blue),
                  title: const Text('Excused'),
                  onTap: () => _handleMarkAttendance(
                    context,
                    ref,
                    subject.id,
                    'excused',
                    0.0,
                    0.0,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _handleMarkAttendance(
    BuildContext context,
    WidgetRef ref,
    int subjectId,
    String status,
    double countedUnits,
    double attendedUnits,
  ) async {
    Navigator.pop(context); // Close bottom sheet

    final db = ref.read(databaseProvider);
    final now = DateTime.now();

    // Insert a new lecture session first
    final sessionId = await db.lectureSessionsDao.insertSession(
      LectureSessionsCompanion.insert(
        subjectId: subjectId,
        sessionDate: now,
        startMinutes: now.hour * 60 + now.minute,
        endMinutes: (now.hour + 1) * 60 + now.minute,
        sessionStatus: status,
      ),
    );

    // Call attendance repository transaction
    await ref
        .read(attendanceRepositoryProvider)
        .markAttendance(
          subjectId: subjectId,
          lectureSessionId: sessionId,
          status: status,
          countedUnits: countedUnits,
          attendedUnits: attendedUnits,
        );
  }
}
