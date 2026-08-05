import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aster/app/theme/aster_spacing.dart';
import 'package:aster/app/theme/aster_theme.dart';
import 'package:aster/core/responsive/responsive_layout.dart';
import 'package:aster/core/widgets/cards/aster_card.dart';
import 'package:aster/core/providers/database_providers.dart';
import 'package:aster/core/services/attendance_calculator.dart';
import 'package:aster/core/services/attendance_risk_evaluator.dart';
import 'package:aster/core/widgets/cards/aster_status_card.dart';

class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeSubjectsAsync = ref.watch(activeSubjectsProvider);
    final profileAsync = ref.watch(currentStudentProfileProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Notifications & Alerts')),
      body: activeSubjectsAsync.when(
        data: (subjects) {
          final profile = profileAsync.value;
          final alerts = <_NotificationItemData>[];

          // Welcome / profile notification
          alerts.add(
            _NotificationItemData(
              title: 'Semester Plan Active',
              description:
                  'Your profile is set up for ${profile?.semesterName ?? 'this semester'}. Attendance and internship recommendations are updated automatically.',
              time: 'Just now',
              icon: Icons.check_circle_outline,
              color: Colors.green,
            ),
          );

          if (subjects.isEmpty) {
            alerts.add(
              const _NotificationItemData(
                title: 'No Subjects Added',
                description:
                    'Add your subjects in Curriculum to start tracking live attendance and safe absence counts.',
                time: 'Action Required',
                icon: Icons.menu_book_outlined,
                color: Colors.orange,
              ),
            );
          }

          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: context.sideMargin,
              vertical: AsterSpacing.spaceLg,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recent Updates & Risk Alerts',
                  style: context.asterTextTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: AsterSpacing.spaceMd),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: alerts.length + subjects.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: AsterSpacing.spaceSm),
                  itemBuilder: (context, index) {
                    if (index < alerts.length) {
                      return _buildNotificationCard(context, alerts[index]);
                    }
                    final subject = subjects[index - alerts.length];
                    return _SubjectNotificationTile(
                      subjectId: subject.id,
                      subjectName: subject.name,
                    );
                  },
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) =>
            Center(child: Text('Error loading notifications: $err')),
      ),
    );
  }

  Widget _buildNotificationCard(
    BuildContext context,
    _NotificationItemData item,
  ) {
    return AsterCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: item.color.withValues(alpha: 0.15),
            child: Icon(item.icon, color: item.color, size: 20),
          ),
          const SizedBox(width: AsterSpacing.spaceMd),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item.title,
                      style: context.asterTextTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      item.time,
                      style: context.asterTextTheme.labelSmall?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  item.description,
                  style: context.asterTextTheme.bodySmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NotificationItemData {
  final String title;
  final String description;
  final String time;
  final IconData icon;
  final Color color;

  const _NotificationItemData({
    required this.title,
    required this.description,
    required this.time,
    required this.icon,
    required this.color,
  });
}

class _SubjectNotificationTile extends ConsumerWidget {
  final int subjectId;
  final String subjectName;

  const _SubjectNotificationTile({
    required this.subjectId,
    required this.subjectName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summaryAsync = ref.watch(subjectAttendanceSummaryProvider(subjectId));

    return summaryAsync.when(
      data: (summary) {
        if (summary.totalCountedUnits == 0) {
          return const SizedBox.shrink();
        }

        final pct = AttendanceCalculator.calculatePercentage(
          summary.attendedUnits,
          summary.totalCountedUnits,
        );

        final status = AttendanceRiskEvaluator.evaluate(
          currentPercentage: pct,
          requiredPercentage: 75.0,
          safetyTargetPercentage: 80.0,
        );

        if (status == AsterStatus.safe) {
          return const SizedBox.shrink();
        }

        Color iconColor;
        String statusText;
        if (status == AsterStatus.watch) {
          iconColor = Colors.amber;
          statusText =
              'Attendance is at ${pct.toStringAsFixed(1)}%. Keep attending to reach safety target (80%).';
        } else if (status == AsterStatus.risky) {
          iconColor = Colors.orange;
          statusText =
              'Attendance dropped to ${pct.toStringAsFixed(1)}%. Below required 75% policy threshold!';
        } else {
          iconColor = Colors.red;
          statusText =
              'Critical Risk! Attendance is ${pct.toStringAsFixed(1)}%. Urgent recovery needed.';
        }

        return AsterCard(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: iconColor.withValues(alpha: 0.15),
                child: Icon(
                  Icons.warning_amber_rounded,
                  color: iconColor,
                  size: 20,
                ),
              ),
              const SizedBox(width: AsterSpacing.spaceMd),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Attendance Alert: $subjectName',
                      style: context.asterTextTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      statusText,
                      style: context.asterTextTheme.bodySmall?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (err, stack) => const SizedBox.shrink(),
    );
  }
}
