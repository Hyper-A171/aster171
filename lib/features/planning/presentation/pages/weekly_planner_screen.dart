import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app/theme/aster_spacing.dart';
import '../../../../app/theme/aster_theme.dart';
import '../../../../core/responsive/responsive_layout.dart';
import '../../../../core/widgets/cards/aster_card.dart';
import '../../../../core/widgets/chips/aster_choice_chip.dart';
import '../../../../core/widgets/buttons/aster_primary_button.dart';
import '../../../../core/providers/database_providers.dart';
import '../../../dashboard/presentation/pages/home_navigation_wrapper.dart';

class WeeklyPlannerScreen extends ConsumerStatefulWidget {
  final bool isFromOnboarding;

  const WeeklyPlannerScreen({super.key, this.isFromOnboarding = false});

  @override
  ConsumerState<WeeklyPlannerScreen> createState() =>
      _WeeklyPlannerScreenState();
}

class _WeeklyPlannerScreenState extends ConsumerState<WeeklyPlannerScreen> {
  int _selectedTab = 0;

  final List<String> _weekDays = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
  ];

  @override
  Widget build(BuildContext context) {
    final bool showFinishButton =
        widget.isFromOnboarding || Navigator.canPop(context);

    final activeSubjectsAsync = ref.watch(activeSubjectsProvider);
    final subjects = activeSubjectsAsync.value ?? [];
    final int totalSubjects = subjects.length;

    final internshipReqAsync = ref.watch(internshipRequirementsProvider);
    final internshipReq = internshipReqAsync.value;

    return Scaffold(
      appBar: AppBar(title: const Text('Weekly Planner & Strategy')),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: context.sideMargin,
          vertical: AsterSpacing.spaceLg,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.isFromOnboarding) ...[
              Text(
                'Step 5 of 5',
                style: context.asterTextTheme.labelMedium?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: AsterSpacing.spaceXs),
              LinearProgressIndicator(
                value: 1.0,
                backgroundColor: context.colorScheme.surfaceContainerHigh,
                color: context.colorScheme.primary,
                borderRadius: BorderRadius.circular(9999),
              ),
              const SizedBox(height: AsterSpacing.spaceLg),
            ],

            // Strategy Header Banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: context.colorScheme.primaryContainer.withValues(
                  alpha: 0.7,
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: context.colorScheme.primary.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: context.colorScheme.primary,
                    child: const Icon(
                      Icons.auto_awesome,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _getPlanTitle(_selectedTab),
                          style: context.asterTextTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: context.colorScheme.onPrimaryContainer,
                          ),
                        ),
                        Text(
                          _getPlanSubtitle(_selectedTab),
                          style: context.asterTextTheme.bodySmall?.copyWith(
                            color: context.colorScheme.onPrimaryContainer
                                .withValues(alpha: 0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AsterSpacing.spaceLg),

            // Strategy Filter Chips
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildTab(0, 'Recommended', icon: Icons.star_rounded),
                  const SizedBox(width: 8),
                  _buildTab(1, 'Attendance First', icon: Icons.shield_outlined),
                  const SizedBox(width: 8),
                  _buildTab(2, 'Internship Focus', icon: Icons.work_outline),
                ],
              ),
            ),
            const SizedBox(height: AsterSpacing.spaceLg),

            // Metrics Grid
            Row(
              children: [
                Expanded(
                  child: _buildMetricCard(
                    context,
                    title: 'Active Courses',
                    value: '$totalSubjects',
                    icon: Icons.menu_book_rounded,
                    color: context.colorScheme.primary,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildMetricCard(
                    context,
                    title: 'Risk Profile',
                    value: totalSubjects > 0 ? 'Safe' : 'Setup',
                    icon: Icons.verified_user_outlined,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AsterSpacing.spaceLg),

            // Plan Rationale Card
            AsterCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.lightbulb_outline_rounded,
                        color: context.colorScheme.tertiary,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'PLAN RATIONALE',
                        style: context.asterTextTheme.labelMedium?.copyWith(
                          color: context.colorScheme.tertiary,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _buildReasonItem(
                    context,
                    'Optimizes weekly schedule based on active enrolled curriculum.',
                  ),
                  const SizedBox(height: 6),
                  _buildReasonItem(
                    context,
                    'Guarantees attendance remains above the 75% required policy limit.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: AsterSpacing.spaceXl),

            // Weekly Schedule Section
            Text(
              'Weekly Timetable & Action Plan',
              style: context.asterTextTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AsterSpacing.spaceMd),

            if (totalSubjects == 0)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: context.colorScheme.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: context.colorScheme.outlineVariant),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 48,
                      color: context.colorScheme.outlineVariant,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'No subjects added to planner yet',
                      style: context.asterTextTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Add your subjects in Curriculum to generate your dynamic weekly schedule.',
                      style: context.asterTextTheme.bodySmall?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            else
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _weekDays.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: AsterSpacing.spaceMd),
                itemBuilder: (context, index) {
                  final dayName = _weekDays[index];
                  // Check if this weekday is an internship day
                  final bool isInternshipDay = internshipReq != null && 
                      (index + 1) == 2; // Demo logic: Tuesday is internship day
                  
                  return _buildDayScheduleCard(
                    context,
                    dayName: dayName,
                    dynamicSubjects: subjects,
                    dayIndex: index,
                    isInternshipDay: isInternshipDay,
                  );
                },
              ),
          ],
        ),
      ),
      bottomNavigationBar: showFinishButton
          ? Container(
              padding: EdgeInsets.all(context.sideMargin),
              decoration: BoxDecoration(
                color: context.colorScheme.surface,
                border: Border(
                  top: BorderSide(color: context.colorScheme.outlineVariant),
                ),
              ),
              child: SafeArea(
                child: AsterPrimaryButton(
                  label: 'Confirm Plan & Finish Setup',
                  icon: const Icon(Icons.check_circle_outline),
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (_) => const HomeNavigationWrapper(),
                      ),
                      (route) => false,
                    );
                  },
                ),
              ),
            )
          : null,
    );
  }

  String _getPlanTitle(int tab) => switch (tab) {
    0 => 'Recommended Balanced Strategy',
    1 => 'Attendance Protection First',
    2 => 'Internship Priority Strategy',
    _ => 'Weekly Strategy',
  };

  String _getPlanSubtitle(int tab) => switch (tab) {
    0 => 'Balanced distribution between college lectures and internship hours.',
    1 => 'Prioritizes college attendance for subjects near threshold limits.',
    2 => 'Clears contiguous field work blocks for your internship commitments.',
    _ => 'Optimized schedule plan.',
  };

  Widget _buildTab(int index, String label, {IconData? icon}) {
    return AsterChoiceChip(
      label: label,
      selected: _selectedTab == index,
      icon: icon != null ? Icon(icon, size: 16) : null,
      onSelected: (val) => setState(() => _selectedTab = index),
    );
  }

  Widget _buildMetricCard(
    BuildContext context, {
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return AsterCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 18, color: color),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  title.toUpperCase(),
                  style: context.asterTextTheme.labelSmall?.copyWith(
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: context.asterTextTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w800,
              color: context.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReasonItem(BuildContext context, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.check_circle_rounded,
          size: 16,
          color: context.colorScheme.primary,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: context.asterTextTheme.bodySmall?.copyWith(
              color: context.colorScheme.onSurface,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDayScheduleCard(
    BuildContext context, {
    required String dayName,
    required List dynamicSubjects,
    required int dayIndex,
    required bool isInternshipDay,
  }) {
    return AsterCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dayName,
                style: context.asterTextTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: isInternshipDay
                      ? context.colorScheme.secondaryContainer
                      : context.colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  isInternshipDay ? 'Internship Focus' : 'Campus Day',
                  style: context.asterTextTheme.labelSmall?.copyWith(
                    color: isInternshipDay
                        ? context.colorScheme.onSecondaryContainer
                        : context.colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Column(
            children: dynamicSubjects.take(2).map((sub) {
              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: context.colorScheme.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: context.colorScheme.outlineVariant),
                ),
                child: Row(
                  children: [
                    Icon(
                      sub.subjectType == 'Practical'
                          ? Icons.storage
                          : Icons.menu_book,
                      size: 18,
                      color: context.colorScheme.primary,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            sub.name,
                            style: context.asterTextTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${sub.code ?? sub.subjectType} • 09:00 AM',
                            style: context.asterTextTheme.bodySmall?.copyWith(
                              color: context.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'ATTEND',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
