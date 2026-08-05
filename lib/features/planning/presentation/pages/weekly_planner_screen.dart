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

  @override
  Widget build(BuildContext context) {
    final bool showFinishButton =
        widget.isFromOnboarding || Navigator.canPop(context);

    final activeSubjectsAsync = ref.watch(activeSubjectsProvider);
    final int totalSubjects = activeSubjectsAsync.value?.length ?? 0;

    return Scaffold(
      appBar: AppBar(title: const Text('Weekly Planner')),
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
            Text(
              'Optimize your schedule for the upcoming week.',
              style: context.asterTextTheme.bodyLarge?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: AsterSpacing.spaceLg),

            // Plan Tabs
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildTab(0, 'Recommended', icon: Icons.check),
                  const SizedBox(width: 8),
                  _buildTab(1, 'Attendance First'),
                  const SizedBox(width: 8),
                  _buildTab(2, 'Internship First'),
                ],
              ),
            ),
            const SizedBox(height: AsterSpacing.spaceLg),

            // Summary Cards
            Column(
              children: [
                _buildSummaryCard(
                  context,
                  title: 'Curriculum Subjects',
                  value: '$totalSubjects',
                  total: 'Active Courses',
                  icon: Icons.menu_book_rounded,
                  color: context.colorScheme.primary,
                  subtitle: totalSubjects > 0
                      ? 'Live tracking across all $totalSubjects enrolled subjects.'
                      : 'No active subjects added. Add subjects in Curriculum.',
                ),
                const SizedBox(height: 12),
                _buildSummaryCard(
                  context,
                  title: 'Risk Score',
                  value: totalSubjects > 0 ? 'Low' : 'N/A',
                  icon: Icons.bar_chart_rounded,
                  color: context.colorScheme.primary,
                  progress: totalSubjects > 0 ? 0.20 : 0.0,
                ),
                const SizedBox(height: 12),
                _buildSummaryCard(
                  context,
                  title: 'Why this plan?',
                  icon: Icons.lightbulb_outline_rounded,
                  color: context.colorScheme.secondary,
                  content: Column(
                    children: [
                      _buildReasonItem(
                        context,
                        'Balances study and internship hours optimally.',
                      ),
                      const SizedBox(height: 4),
                      _buildReasonItem(
                        context,
                        'Maintains attendance above critical policy threshold.',
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AsterSpacing.spaceXl),

            // Weekly Schedule
            Text(
              'Weekly Schedule Overview',
              style: context.asterTextTheme.titleLarge,
            ),
            const SizedBox(height: AsterSpacing.spaceMd),
            if (totalSubjects == 0)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: context.colorScheme.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: context.colorScheme.outlineVariant),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 40,
                      color: context.colorScheme.outlineVariant,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'No subjects added to planner yet.',
                      style: context.asterTextTheme.titleSmall,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Add subjects during setup to view your weekly breakdown.',
                      style: context.asterTextTheme.bodySmall?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            else
              Column(
                children: [
                  _buildDayPlan(
                    context,
                    day: 'Monday',
                    date: 'Week Start',
                    items: (activeSubjectsAsync.value ?? []).map((subject) {
                      return _buildPlanItem(
                        context,
                        subject.name,
                        '${subject.code ?? subject.subjectType} • Scheduled',
                        subject.subjectType == 'Practical'
                            ? Icons.storage
                            : Icons.menu_book,
                        context.colorScheme.primary,
                      );
                    }).toList(),
                  ),
                ],
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

  Widget _buildTab(int index, String label, {IconData? icon}) {
    return AsterChoiceChip(
      label: label,
      selected: _selectedTab == index,
      icon: icon != null ? Icon(icon, size: 16) : null,
      onSelected: (val) => setState(() => _selectedTab = index),
    );
  }

  Widget _buildSummaryCard(
    BuildContext context, {
    required String title,
    String? value,
    String? total,
    required IconData icon,
    required Color color,
    String? subtitle,
    double? progress,
    Widget? content,
  }) {
    return AsterCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 18, color: color),
              const SizedBox(width: 8),
              Text(
                title.toUpperCase(),
                style: context.asterTextTheme.labelMedium?.copyWith(
                  color: color,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          if (value != null) ...[
            const SizedBox(height: 32),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  value,
                  style: context.asterTextTheme.displayLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: context.colorScheme.onSurface,
                  ),
                ),
                if (total != null) ...[
                  const SizedBox(width: 6),
                  Text(
                    total,
                    style: context.asterTextTheme.bodyLarge?.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ],
            ),
          ],
          if (subtitle != null) ...[
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: context.asterTextTheme.bodySmall?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
          if (progress != null) ...[
            const SizedBox(height: 24),
            ClipRRect(
              borderRadius: BorderRadius.circular(99),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 6,
                color: color,
                backgroundColor: context.colorScheme.surfaceContainerHighest,
              ),
            ),
          ],
          if (content != null) ...[const SizedBox(height: 16), content],
        ],
      ),
    );
  }

  Widget _buildReasonItem(BuildContext context, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.check_circle_outline_rounded,
          size: 16,
          color: context.colorScheme.secondary,
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

  Widget _buildDayPlan(
    BuildContext context, {
    required String day,
    required String date,
    required List<Widget> items,
    bool isDimmed = false,
  }) {
    return Opacity(
      opacity: isDimmed ? 0.6 : 1.0,
      child: AsterCard(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(day, style: context.asterTextTheme.titleSmall),
                  Text(date, style: context.asterTextTheme.labelSmall),
                ],
              ),
            ),
            const VerticalDivider(),
            Expanded(child: Column(children: items)),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanItem(
    BuildContext context,
    String title,
    String time,
    IconData icon,
    Color color, {
    bool isSkip = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: color.withValues(alpha: 0.3),
          style: isSkip ? BorderStyle.none : BorderStyle.solid,
        ),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.asterTextTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    decoration: isSkip ? TextDecoration.lineThrough : null,
                  ),
                ),
                Text(time, style: const TextStyle(fontSize: 10)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
