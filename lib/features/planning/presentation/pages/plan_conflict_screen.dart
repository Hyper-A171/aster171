import 'package:flutter/material.dart';
import '../../../../app/theme/aster_spacing.dart';
import '../../../../app/theme/aster_theme.dart';
import '../../../../core/responsive/responsive_layout.dart';
import '../../../../core/widgets/cards/aster_card.dart';

class PlanConflictScreen extends StatelessWidget {
  const PlanConflictScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Plan Conflict')),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: context.sideMargin,
          vertical: AsterSpacing.spaceLg,
        ),
        child: Column(
          children: [
            // Warning Header
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: context.colorScheme.errorContainer,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: context.colorScheme.error.withValues(alpha: 0.2),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: context.colorScheme.error,
                    child: Icon(
                      Icons.warning,
                      color: context.colorScheme.onError,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'No completely safe plan available.',
                          style: context.asterTextTheme.titleLarge?.copyWith(
                            color: context.colorScheme.onErrorContainer,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'We detected conflicting requirements between your chosen subjects and your internship schedule.',
                          style: context.asterTextTheme.bodyMedium?.copyWith(
                            color: context.colorScheme.onErrorContainer,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AsterSpacing.spaceXl),

            // Conflicts & Solutions
            Column(
              children: [
                _buildConflictList(context),
                const SizedBox(height: AsterSpacing.spaceXl),
                _buildLeastRiskyOption(context),
                const SizedBox(height: AsterSpacing.spaceXl),
                _buildAlternatives(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConflictList(BuildContext context) {
    return AsterCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.assignment_late, color: context.colorScheme.error),
              const SizedBox(width: 8),
              Text(
                'Conflicting Subjects',
                style: context.asterTextTheme.titleLarge,
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildConflictItem(
            context,
            'Advanced Thermodynamics',
            'Required lab session (Tue 14:00 - 17:00) strictly overlaps with core internship hours.',
            Icons.auto_stories,
          ),
          const SizedBox(height: 12),
          _buildConflictItem(
            context,
            'Machine Learning Ethics',
            'Seminar time varies weekly, violating the fixed schedule requirement.',
            Icons.computer,
          ),
        ],
      ),
    );
  }

  Widget _buildConflictItem(
    BuildContext context,
    String title,
    String reason,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: context.colorScheme.outlineVariant.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: context.colorScheme.onSurfaceVariant),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: context.asterTextTheme.titleSmall),
                const SizedBox(height: 4),
                Text(reason, style: context.asterTextTheme.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeastRiskyOption(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.star,
                color: context.colorScheme.onPrimaryContainer,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                'LEAST RISKY OPTION',
                style: context.asterTextTheme.labelLarge?.copyWith(
                  color: context.colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            "Drop 'Machine Learning Ethics'",
            style: context.asterTextTheme.titleLarge?.copyWith(
              color: context.colorScheme.onPrimaryContainer,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'This resolves the unpredictable schedule variance. You will remain 3 credits short this semester.',
            style: context.asterTextTheme.bodyMedium?.copyWith(
              color: context.colorScheme.onPrimaryContainer.withValues(
                alpha: 0.8,
              ),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: context.colorScheme.onPrimary,
              foregroundColor: context.colorScheme.primary,
            ),
            child: const Text('Apply this fix'),
          ),
        ],
      ),
    );
  }

  Widget _buildAlternatives(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.alt_route, color: context.colorScheme.onSurfaceVariant),
            const SizedBox(width: 8),
            Text(
              'Alternative Suggestions',
              style: context.asterTextTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildAltCard(
                context,
                'Half-day Internship',
                'Request morning shifts.',
                Icons.schedule,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildAltCard(
                context,
                'Shift Changes',
                'Negotiate flexible hours.',
                Icons.swap_horiz,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAltCard(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
  ) {
    return AsterCard(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: context.colorScheme.secondary, size: 24),
          const SizedBox(height: 12),
          Text(title, style: context.asterTextTheme.titleSmall),
          const SizedBox(height: 4),
          Text(subtitle, style: context.asterTextTheme.bodySmall),
        ],
      ),
    );
  }
}
