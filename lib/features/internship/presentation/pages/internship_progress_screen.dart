import 'package:flutter/material.dart';
import '../../../../app/theme/aster_spacing.dart';
import '../../../../app/theme/aster_theme.dart';
import '../../../../app/theme/aster_typography.dart';
import '../../../../core/responsive/responsive_layout.dart';
import '../../../../core/widgets/cards/aster_card.dart';

class InternshipProgressScreen extends StatelessWidget {
  const InternshipProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Internship Progress'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
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
            Text(
              'Track your required field days for this semester.',
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
                            'COMPLETED',
                            style: context.asterTextTheme.labelSmall,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                '2',
                                style: context.asterTextTheme.displayLarge
                                    ?.copyWith(
                                      color: context.colorScheme.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '/ 3 days',
                                style: context.asterTextTheme.titleMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: context.colorScheme.primaryContainer
                            .withValues(alpha: 0.2),
                        child: Icon(
                          Icons.verified,
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
                        'This Week\'s Goal',
                        style: context.asterTextTheme.labelSmall,
                      ),
                      Text(
                        '66%',
                        style: context.asterTextTheme.labelSmall?.copyWith(
                          color: context.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: _buildSegment(
                          context,
                          active: true,
                          isStart: true,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(child: _buildSegment(context, active: true)),
                      const SizedBox(width: 4),
                      Expanded(
                        child: _buildSegment(
                          context,
                          active: false,
                          isEnd: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tue', style: TextStyle(fontSize: 10)),
                      Text('Thu', style: TextStyle(fontSize: 10)),
                      Text('Fri', style: TextStyle(fontSize: 10)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: AsterSpacing.spaceLg),

            // Actions
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.edit_calendar),
              label: const Text('Change Internship Day'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
              ),
            ),
            const SizedBox(height: AsterSpacing.spaceMd),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add_comment),
              label: const Text('Log Reflection'),
              style: TextButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
                backgroundColor: context.colorScheme.secondaryContainer
                    .withValues(alpha: 0.15),
              ),
            ),
            const SizedBox(height: AsterSpacing.spaceXl),

            // Activity List
            Text('Recent Activity', style: context.asterTextTheme.titleLarge),
            const SizedBox(height: AsterSpacing.spaceMd),
            _buildActivityItem(
              context,
              title: 'Thursday Field Day',
              subtitle: 'TechCorp Inc. • 8 Hours',
              status: 'Completed',
            ),
            const SizedBox(height: AsterSpacing.spaceSm),
            _buildActivityItem(
              context,
              title: 'Tuesday Field Day',
              subtitle: 'TechCorp Inc. • 8 Hours',
              status: 'Completed',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSegment(
    BuildContext context, {
    required bool active,
    bool isStart = false,
    bool isEnd = false,
  }) {
    return Container(
      height: 12,
      decoration: BoxDecoration(
        color: active
            ? context.colorScheme.primary
            : context.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.horizontal(
          left: isStart ? const Radius.circular(6) : Radius.zero,
          right: isEnd ? const Radius.circular(6) : Radius.zero,
        ),
      ),
    );
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
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: context.colorScheme.primaryFixed,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              status,
              style: context.asterTextTheme.labelSmall?.copyWith(
                color: context.colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
