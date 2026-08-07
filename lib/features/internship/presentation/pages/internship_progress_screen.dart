import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:aster/app/theme/aster_spacing.dart';
import 'package:aster/app/theme/aster_theme.dart';
import 'package:aster/core/responsive/responsive_layout.dart';
import 'package:aster/core/widgets/cards/aster_card.dart';
import 'package:aster/core/providers/database_providers.dart';
import 'package:aster/features/internship/presentation/pages/internship_setup_screen.dart';

class InternshipProgressScreen extends ConsumerWidget {
  const InternshipProgressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(currentStudentProfileProvider);
    final profile = profileAsync.value;

    final db = ref.watch(databaseProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Internship Progress')),
      body: StreamBuilder(
        stream: profile != null
            ? db.internshipDao.watchRequirements(profile.id)
            : const Stream.empty(),
        builder: (context, snapshot) {
          final requirement = snapshot.data;
          final int requiredDays = requirement?.requiredDaysPerWeek ?? 3;
          final startDate =
              requirement?.internshipStartDate ?? DateTime(2026, 6, 1);
          final endDate =
              requirement?.internshipEndDate ?? DateTime(2026, 8, 29);
          final now = DateTime.now();
          final isPastDeadline = now.isAfter(
            DateTime(endDate.year, endDate.month, endDate.day, 23, 59, 59),
          );
          final totalDays = endDate.difference(startDate).inDays + 1;
          final elapsedDays = now.isBefore(startDate)
              ? 0
              : now.isAfter(endDate)
              ? totalDays
              : now.difference(startDate).inDays + 1;
          final progress = totalDays <= 0
              ? 0.0
              : (elapsedDays / totalDays).clamp(0.0, 1.0);
          final progressPercent = (progress * 100).round();
          final status = now.isBefore(startDate)
              ? 'Upcoming'
              : now.isAfter(endDate)
              ? 'Completed'
              : 'In Progress';

          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: context.sideMargin,
              vertical: AsterSpacing.spaceLg,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!isPastDeadline) ...[
                  Text(
                    'Track your MSBTE Semester 5 internship requirement.',
                    style: context.asterTextTheme.bodyMedium?.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: AsterSpacing.spaceLg),

                  // Progress Card
                  AsterCard(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'INTERNSHIP | 315004',
                                  style: context.asterTextTheme.labelSmall,
                                ),
                                Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Text(
                                      '$progressPercent%',
                                      style: context.asterTextTheme.displayLarge
                                          ?.copyWith(
                                            color: context.colorScheme.primary,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      'complete',
                                      style: context.asterTextTheme.titleMedium,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            CircleAvatar(
                              radius: 24,
                              backgroundColor: context
                                  .colorScheme
                                  .primaryContainer
                                  .withValues(alpha: 0.2),
                              child: Icon(
                                Icons.work_outline_rounded,
                                color: context.colorScheme.primary,
                                size: 28,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AsterSpacing.spaceLg),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Status',
                              style: context.asterTextTheme.labelSmall,
                            ),
                            Text(
                              status,
                              style: context.asterTextTheme.labelSmall
                                  ?.copyWith(
                                    color: context.colorScheme.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AsterSpacing.spaceSm),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: LinearProgressIndicator(
                            value: progress,
                            minHeight: 8,
                            backgroundColor:
                                context.colorScheme.surfaceContainerHighest,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AsterSpacing.spaceLg),

                  // Actions
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const InternshipSetupScreen(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.edit_calendar),
                    label: const Text('Configure Internship Schedule'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 48),
                    ),
                  ),
                  const SizedBox(height: AsterSpacing.spaceXl),
                ],

                // Activity List
                Text(
                  'Internship Requirements Overview',
                  style: MediaQuery.sizeOf(context).width < 360
                      ? context.asterTextTheme.titleMedium
                      : context.asterTextTheme.titleLarge,
                ),
                const SizedBox(height: AsterSpacing.spaceMd),
                _buildActivityItem(
                  context,
                  title: 'Official Duration',
                  subtitle:
                      '${DateFormat('d MMM').format(startDate)} - '
                      '${DateFormat('d MMM yyyy').format(endDate)}',
                  status: '12 weeks',
                ),
                const SizedBox(height: AsterSpacing.spaceSm),
                _buildActivityItem(
                  context,
                  title: 'Working Hours',
                  subtitle:
                      requirement != null &&
                          requirement.startMinutes != null &&
                          requirement.endMinutes != null
                      ? '${_formatMinutes(requirement.startMinutes!)} - ${_formatMinutes(requirement.endMinutes!)}'
                      : '9:00 AM - 5:00 PM',
                  status: 'Scheduled',
                ),
                const SizedBox(height: AsterSpacing.spaceSm),
                _buildActivityItem(
                  context,
                  title: 'Weekly Availability',
                  subtitle:
                      '$requiredDays working days ${requirement?.allowsHalfDay == true ? '(half-days allowed)' : ''}',
                  status: 'Configured',
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  String _formatMinutes(int minutes) {
    final normalizedMinutes = minutes % (24 * 60);
    final hour = normalizedMinutes ~/ 60;
    final minute = normalizedMinutes % 60;
    final period = hour < 12 ? 'AM' : 'PM';
    final displayHour = hour % 12 == 0 ? 12 : hour % 12;
    return '$displayHour:${minute.toString().padLeft(2, '0')} $period';
  }

  Widget _buildActivityItem(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String status,
  }) {
    return AsterCard(
      padding: const EdgeInsets.all(AsterSpacing.spaceSm),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: context.colorScheme.secondaryContainer.withValues(
              alpha: 0.2,
            ),
            child: Icon(
              Icons.work_history,
              color: context.colorScheme.secondary,
              size: 20,
            ),
          ),
          const SizedBox(width: AsterSpacing.spaceMd),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: context.asterTextTheme.labelLarge),
                Text(subtitle, style: context.asterTextTheme.bodySmall),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: context.colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              status,
              style: context.asterTextTheme.labelSmall?.copyWith(
                color: context.colorScheme.onPrimaryContainer,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
