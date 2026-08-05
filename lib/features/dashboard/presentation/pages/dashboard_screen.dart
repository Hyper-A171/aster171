import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:aster/app/theme/aster_spacing.dart';
import 'package:aster/app/theme/aster_theme.dart';
import 'package:aster/core/responsive/responsive_layout.dart';
import 'package:aster/core/widgets/cards/aster_card.dart';
import 'package:aster/core/widgets/cards/aster_status_card.dart';
import 'package:aster/core/widgets/buttons/aster_primary_button.dart';
import 'package:aster/core/widgets/chips/aster_status_chip.dart';
import 'package:aster/core/providers/database_providers.dart';
import 'package:aster/features/profile/presentation/pages/profile_screen.dart';
import 'package:aster/features/notifications/presentation/pages/notifications_screen.dart';
import 'today_schedule_screen.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(currentStudentProfileProvider);
    final activeSubjectsAsync = ref.watch(activeSubjectsProvider);

    final profile = profileAsync.value;
    final studentName = profile?.name.trim().isNotEmpty == true
        ? profile!.name.trim()
        : 'Alex';
    final initials = studentName
        .split(' ')
        .map((e) => e.isEmpty ? '' : e[0])
        .take(2)
        .join()
        .toUpperCase();
    final dateStr = DateFormat('EEEE, MMMM d').format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Aster'),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const ProfileScreen()));
            },
            child: CircleAvatar(
              backgroundColor: context.colorScheme.primaryContainer,
              child: Text(
                initials.isEmpty ? 'AW' : initials,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: context.colorScheme.onPrimaryContainer,
                ),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const NotificationsScreen()),
              );
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
            // Greeting
            Text(
              'Hello, $studentName',
              style: context.asterTextTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              dateStr,
              style: context.asterTextTheme.titleLarge?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: AsterSpacing.spaceLg),

            // Bento Grid
            ResponsiveLayout(
              mobile: (context) =>
                  _buildMobileLayout(context, activeSubjectsAsync),
              tablet: (context) =>
                  _buildTabletLayout(context, activeSubjectsAsync),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileLayout(
    BuildContext context,
    AsyncValue activeSubjectsAsync,
  ) {
    return Column(
      children: [
        _buildHeroCard(context),
        const SizedBox(height: AsterSpacing.spaceLg),
        _buildWeeklyPlanCard(context),
        const SizedBox(height: AsterSpacing.spaceLg),
        _buildLecturesCard(context),
        const SizedBox(height: AsterSpacing.spaceLg),
        Row(
          children: [
            Expanded(child: _buildInternshipCard(context)),
            const SizedBox(width: AsterSpacing.spaceMd),
            Expanded(child: _buildCriticalSubjectCard(context)),
          ],
        ),
      ],
    );
  }

  Widget _buildTabletLayout(
    BuildContext context,
    AsyncValue activeSubjectsAsync,
  ) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 2, child: _buildHeroCard(context)),
            const SizedBox(width: AsterSpacing.spaceLg),
            Expanded(flex: 1, child: _buildWeeklyPlanCard(context)),
          ],
        ),
        const SizedBox(height: AsterSpacing.spaceLg),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _buildLecturesCard(context)),
            const SizedBox(width: AsterSpacing.spaceLg),
            Column(
              children: [
                _buildInternshipCard(context),
                const SizedBox(height: AsterSpacing.spaceMd),
                _buildCriticalSubjectCard(context),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHeroCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AsterSpacing.spaceLg),
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(AsterSpacing.spaceMd),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AsterStatusChip(
            status: AsterStatus.safe,
            label: '98% Confidence Match',
            icon: Icons.verified,
          ),
          const SizedBox(height: AsterSpacing.spaceMd),
          Text(
            'Attend College Today',
            style: context.asterTextTheme.headlineLarge?.copyWith(
              color: context.colorScheme.onPrimaryContainer,
            ),
          ),
          const SizedBox(height: AsterSpacing.spaceSm),
          Text(
            'Missing Java today would reduce your attendance below 75%.',
            style: context.asterTextTheme.bodyLarge?.copyWith(
              color: context.colorScheme.onPrimaryContainer.withValues(
                alpha: 0.8,
              ),
            ),
          ),
          const SizedBox(height: AsterSpacing.spaceXl),
          Wrap(
            spacing: AsterSpacing.spaceSm,
            runSpacing: AsterSpacing.spaceSm,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Attendance planned for today!'),
                    ),
                  );
                },
                icon: const Icon(Icons.check_circle),
                label: const Text('Plan to Attend'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Explore Scenario'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWeeklyPlanCard(BuildContext context) {
    return AsterCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Weekly Plan', style: context.asterTextTheme.titleLarge),
              Icon(
                Icons.event_note,
                color: context.colorScheme.onSurfaceVariant,
              ),
            ],
          ),
          const SizedBox(height: AsterSpacing.spaceMd),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: ['M', 'T', 'W', 'T', 'F'].asMap().entries.map((entry) {
              final isToday = entry.key == 2;
              return Column(
                children: [
                  Text(entry.value, style: context.asterTextTheme.labelMedium),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: isToday
                          ? context.colorScheme.primary
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '${21 + entry.key}',
                      style: context.asterTextTheme.titleMedium?.copyWith(
                        color: isToday
                            ? context.colorScheme.onPrimary
                            : context.colorScheme.onSurface,
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
          const SizedBox(height: AsterSpacing.spaceMd),
          Center(
            child: TextButton(
              onPressed: () {},
              child: const Text('View full schedule'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLecturesCard(BuildContext context) {
    return AsterCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Today's Lectures",
                style: context.asterTextTheme.titleLarge,
              ),
              Icon(
                Icons.auto_stories,
                color: context.colorScheme.onSurfaceVariant,
              ),
            ],
          ),
          const SizedBox(height: AsterSpacing.spaceMd),
          _buildLectureItem(
            context,
            title: 'Java Programming',
            time: '10:00 AM - Room 402',
            icon: Icons.terminal,
            isCritical: true,
          ),
          const SizedBox(height: AsterSpacing.spaceSm),
          _buildLectureItem(
            context,
            title: 'Database Systems',
            time: '1:00 PM - Lab 2',
            icon: Icons.storage,
          ),
          const SizedBox(height: AsterSpacing.spaceMd),
          AsterPrimaryButton(
            label: 'View Detailed Timeline',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const TodayScheduleScreen()),
              );
            },
            fullWidth: true,
          ),
        ],
      ),
    );
  }

  Widget _buildLectureItem(
    BuildContext context, {
    required String title,
    required String time,
    required IconData icon,
    bool isCritical = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(AsterSpacing.spaceMd),
      decoration: BoxDecoration(
        color: isCritical
            ? context.colorScheme.errorContainer.withValues(alpha: 0.2)
            : context.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isCritical
              ? context.colorScheme.errorContainer
              : Colors.transparent,
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: isCritical
                ? context.colorScheme.errorContainer
                : context.colorScheme.surfaceContainerHighest,
            child: Icon(
              icon,
              color: isCritical
                  ? context.colorScheme.error
                  : context.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(width: AsterSpacing.spaceMd),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: context.asterTextTheme.titleMedium),
                Text(time, style: context.asterTextTheme.bodyMedium),
              ],
            ),
          ),
          if (isCritical)
            Text(
              'Critical',
              style: context.asterTextTheme.labelMedium?.copyWith(
                color: context.colorScheme.error,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildInternshipCard(BuildContext context) {
    return AsterCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.work_outline,
                color: context.colorScheme.primary,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text('Internship', style: context.asterTextTheme.titleMedium),
            ],
          ),
          const SizedBox(height: AsterSpacing.spaceSm),
          const Text('2 of 3 days completed'),
          const SizedBox(height: AsterSpacing.spaceMd),
          LinearProgressIndicator(
            value: 0.66,
            color: context.colorScheme.secondary,
            backgroundColor: context.colorScheme.surfaceContainerHighest,
          ),
        ],
      ),
    );
  }

  Widget _buildCriticalSubjectCard(BuildContext context) {
    return AsterStatusCard(
      status: AsterStatus.critical,
      title: '76%',
      description: 'Java Programming',
      content: Text(
        'Current Attendance',
        style: context.asterTextTheme.labelSmall,
      ),
    );
  }
}
