import 'package:flutter/material.dart';
import '../../../../app/theme/aster_spacing.dart';
import '../../../../app/theme/aster_theme.dart';
import '../../../../core/responsive/responsive_layout.dart';
import '../../../../core/widgets/cards/aster_card.dart';
import '../../../../core/widgets/chips/aster_choice_chip.dart';
import '../../../../core/widgets/buttons/aster_primary_button.dart';
import '../../../dashboard/presentation/pages/home_navigation_wrapper.dart';

class WeeklyPlannerScreen extends StatefulWidget {
  final bool isFromOnboarding;

  const WeeklyPlannerScreen({super.key, this.isFromOnboarding = false});

  @override
  State<WeeklyPlannerScreen> createState() => _WeeklyPlannerScreenState();
}

class _WeeklyPlannerScreenState extends State<WeeklyPlannerScreen> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    final bool showFinishButton =
        widget.isFromOnboarding || Navigator.canPop(context);

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
                  title: 'Lectures Missed',
                  value: '3',
                  total: '/ 15 Total',
                  icon: Icons.warning_amber_rounded,
                  color: context.colorScheme.error,
                  subtitle: 'Acceptable range for this plan.',
                ),
                const SizedBox(height: 12),
                _buildSummaryCard(
                  context,
                  title: 'Risk Score',
                  value: 'Low',
                  icon: Icons.bar_chart_rounded,
                  color: context.colorScheme.primary,
                  progress: 0.25,
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
                        'Maintains attendance above critical threshold.',
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AsterSpacing.spaceXl),

            // Weekly Schedule
            Text('Weekly Schedule', style: context.asterTextTheme.titleLarge),
            const SizedBox(height: AsterSpacing.spaceMd),
            _buildDayPlan(
              context,
              day: 'Monday',
              date: 'Oct 23',
              items: [
                _buildPlanItem(
                  context,
                  'Advanced Physics',
                  '9:00 AM - 11:00 AM',
                  Icons.menu_book,
                  context.colorScheme.primary,
                ),
                _buildPlanItem(
                  context,
                  'Internship',
                  '1:00 PM - 5:00 PM',
                  Icons.work,
                  context.colorScheme.secondary,
                ),
              ],
            ),
            const SizedBox(height: AsterSpacing.spaceSm),
            _buildDayPlan(
              context,
              day: 'Tuesday',
              date: 'Oct 24',
              isDimmed: true,
              items: [
                _buildPlanItem(
                  context,
                  'Data Structures',
                  '10:00 AM - 12:00 PM',
                  Icons.menu_book,
                  context.colorScheme.primary,
                ),
                _buildPlanItem(
                  context,
                  'Calculus II (Planned Skip)',
                  '2:00 PM - 4:00 PM',
                  Icons.cancel,
                  context.colorScheme.error,
                  isSkip: true,
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
