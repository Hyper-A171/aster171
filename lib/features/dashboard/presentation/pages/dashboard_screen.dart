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
import 'package:aster/core/ai/ai_providers.dart';
import 'package:aster/core/ai/daily_recommendation.dart';
import 'package:aster/features/profile/presentation/pages/profile_screen.dart';
import 'package:aster/features/notifications/presentation/pages/notifications_screen.dart';
import 'package:aster/features/subjects/presentation/pages/add_subjects_screen.dart';
import 'today_schedule_screen.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(currentStudentProfileProvider);

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
              mobile: (context) => _buildMobileLayout(context, ref),
              tablet: (context) => _buildTabletLayout(context, ref),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        _buildHeroCard(context, ref),
        const SizedBox(height: AsterSpacing.spaceLg),
        _buildWeeklyPlanCard(context),
        const SizedBox(height: AsterSpacing.spaceLg),
        _buildLecturesCard(context, ref),
        const SizedBox(height: AsterSpacing.spaceLg),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: _buildInternshipCard(context, ref)),
              const SizedBox(width: AsterSpacing.spaceMd),
              Expanded(child: _buildCriticalSubjectCard(context, ref)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTabletLayout(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 2, child: _buildHeroCard(context, ref)),
            const SizedBox(width: AsterSpacing.spaceLg),
            Expanded(flex: 1, child: _buildWeeklyPlanCard(context)),
          ],
        ),
        const SizedBox(height: AsterSpacing.spaceLg),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _buildLecturesCard(context, ref)),
            const SizedBox(width: AsterSpacing.spaceLg),
            Column(
              children: [
                _buildInternshipCard(context, ref),
                const SizedBox(height: AsterSpacing.spaceMd),
                _buildCriticalSubjectCard(context, ref),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHeroCard(BuildContext context, WidgetRef ref) {
    final activeSubjectsAsync = ref.watch(activeSubjectsProvider);
    final subjects = activeSubjectsAsync.value ?? [];

    final aiRecAsync = ref.watch(dailyAiRecommendationProvider);
    final aiRec = aiRecAsync.value;

    String headlineText = 'Attend College Today';
    String descriptionText =
        'Keep up your attendance momentum across all active subjects.';
    AsterStatus cardStatus = AsterStatus.safe;
    String badgeLabel = 'Live Schedule Match';

    if (aiRec != null) {
      headlineText = aiRec.decision == DailyDecision.attendCollege
          ? 'Attend College Today'
          : aiRec.decision == DailyDecision.attendInternship
          ? 'Safe to Attend Internship'
          : 'Flexible Schedule Today';
      descriptionText = aiRec.summary;
      badgeLabel = 'Gemini AI • ${(aiRec.confidence * 100).toInt()}% Match';
      cardStatus = aiRec.riskLevel == RecommendationRisk.low
          ? AsterStatus.safe
          : AsterStatus.watch;
    } else if (subjects.isEmpty) {
      headlineText = 'Welcome to Aster';
      descriptionText =
          'Add your subjects in Curriculum to track live attendance and safety scores.';
      badgeLabel = 'Setup Mode';
    } else {
      headlineText = 'Curriculum Tracking Active';
      descriptionText =
          '${subjects.length} active subject${subjects.length > 1 ? 's' : ''} enrolled for this semester.';
    }

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
          AsterStatusChip(
            status: cardStatus,
            label: badgeLabel,
            icon: Icons.auto_awesome,
          ),
          const SizedBox(height: AsterSpacing.spaceMd),
          Text(
            headlineText,
            style: context.asterTextTheme.headlineLarge?.copyWith(
              color: context.colorScheme.onPrimaryContainer,
            ),
          ),
          const SizedBox(height: AsterSpacing.spaceSm),
          Text(
            descriptionText,
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
                  if (subjects.isEmpty) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const AddSubjectsScreen(),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Attendance log updated!')),
                    );
                  }
                },
                icon: Icon(subjects.isEmpty ? Icons.add : Icons.check_circle),
                label: Text(
                  subjects.isEmpty ? 'Add Subjects' : 'Mark Today\'s Log',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWeeklyPlanCard(BuildContext context) {
    final now = DateTime.now();
    final monday = now.subtract(Duration(days: now.weekday - 1));
    final weekDays = List.generate(5, (i) => monday.add(Duration(days: i)));
    final dayLabels = ['M', 'T', 'W', 'T', 'F'];

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
            children: List.generate(5, (index) {
              final dayDate = weekDays[index];
              final isToday =
                  dayDate.year == now.year &&
                  dayDate.month == now.month &&
                  dayDate.day == now.day;

              return Column(
                children: [
                  Text(
                    dayLabels[index],
                    style: context.asterTextTheme.labelMedium,
                  ),
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
                      '${dayDate.day}',
                      style: context.asterTextTheme.titleMedium?.copyWith(
                        color: isToday
                            ? context.colorScheme.onPrimary
                            : context.colorScheme.onSurface,
                        fontWeight: isToday ? FontWeight.bold : null,
                      ),
                    ),
                  ),
                ],
              );
            }),
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

  Widget _buildLecturesCard(BuildContext context, WidgetRef ref) {
    final activeSubjectsAsync = ref.watch(activeSubjectsProvider);

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
          activeSubjectsAsync.when(
            data: (subjects) {
              if (subjects.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    children: [
                      Icon(
                        Icons.event_available_outlined,
                        size: 40,
                        color: context.colorScheme.outlineVariant,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'No lectures scheduled',
                        style: context.asterTextTheme.titleSmall,
                      ),
                      Text(
                        'Add subjects to see your live timetable here.',
                        style: context.asterTextTheme.bodySmall?.copyWith(
                          color: context.colorScheme.onSurfaceVariant,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              }
              return Column(
                children: subjects.take(3).map((subject) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: _buildLectureItem(
                      context,
                      title: subject.name,
                      time: subject.code ?? subject.subjectType,
                      icon: subject.subjectType == 'Practical'
                          ? Icons.storage
                          : Icons.terminal,
                      isCritical: subject.isMandatory,
                    ),
                  );
                }).toList(),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (_, __) => const SizedBox.shrink(),
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
            ? context.colorScheme.errorContainer.withValues(alpha: 0.1)
            : context.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isCritical
              ? context.colorScheme.errorContainer.withValues(alpha: 0.5)
              : context.colorScheme.outlineVariant,
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
              'Mandatory',
              style: context.asterTextTheme.labelMedium?.copyWith(
                color: context.colorScheme.error,
                fontWeight: FontWeight.bold,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildInternshipCard(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(currentStudentProfileProvider);
    final profile = profileAsync.value;
    final db = ref.watch(databaseProvider);

    return StreamBuilder(
      stream: profile != null
          ? db.internshipDao.watchRequirements(profile.id)
          : const Stream.empty(),
      builder: (context, snapshot) {
        final req = snapshot.data;
        final reqDays = req?.requiredDaysPerWeek ?? 0;

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
              Text(
                reqDays > 0
                    ? '$reqDays days / week required'
                    : 'No requirement set',
                style: context.asterTextTheme.bodySmall,
              ),
              const SizedBox(height: AsterSpacing.spaceMd),
              LinearProgressIndicator(
                value: reqDays > 0 ? 1.0 : 0.0,
                color: context.colorScheme.secondary,
                backgroundColor: context.colorScheme.surfaceContainerHighest,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCriticalSubjectCard(BuildContext context, WidgetRef ref) {
    final activeSubjectsAsync = ref.watch(activeSubjectsProvider);
    final subjects = activeSubjectsAsync.value ?? [];

    if (subjects.isEmpty) {
      return AsterStatusCard(
        status: AsterStatus.safe,
        title: 'Safe',
        description: 'Curriculum Status',
        content: Text(
          'No active subjects added',
          style: context.asterTextTheme.labelSmall,
        ),
      );
    }

    final firstSubject = subjects.first;
    return AsterStatusCard(
      status: firstSubject.isMandatory ? AsterStatus.watch : AsterStatus.safe,
      title: firstSubject.code ?? firstSubject.subjectType,
      description: firstSubject.name,
      content: Text('Active Subject', style: context.asterTextTheme.labelSmall),
    );
  }
}
