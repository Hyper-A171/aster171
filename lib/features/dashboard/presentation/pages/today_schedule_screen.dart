import 'package:flutter/material.dart';
import '../../../../app/theme/aster_spacing.dart';
import '../../../../app/theme/aster_theme.dart';
import '../../../../app/theme/aster_typography.dart';
import '../../../../core/responsive/responsive_layout.dart';
import '../../../../core/widgets/cards/aster_card.dart';
import '../../../../core/widgets/cards/aster_status_card.dart';
import '../../../../core/widgets/chips/aster_status_chip.dart';

class TodayScheduleScreen extends StatelessWidget {
  const TodayScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Today's Schedule"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
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
            Text('Thursday, Oct 26', style: context.asterTextTheme.titleLarge),
            Text(
              '3 events • 1 conflict detected',
              style: context.asterTextTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: AsterSpacing.spaceXl),

            // Timeline
            _buildTimelineItem(
              context,
              time: '09:00',
              icon: Icons.menu_book,
              child: _buildLectureCard(
                context,
                title: 'Advanced Thermodynamics',
                subtitle: 'Prof. Henderson • Room 302, Engineering Bldg',
                timeRange: '09:00 - 10:30',
                status: 'Present',
              ),
            ),

            _buildTransitItem(context, duration: '45 min transit'),

            _buildTimelineItem(
              context,
              time: '11:15',
              icon: Icons.work,
              isConflict: true,
              child: _buildConflictCard(
                context,
                title: 'Data Analysis Internship',
                subtitle: 'TechCorp Inc. • Main Office',
                conflictMessage:
                    'Transit time overlaps with shift start (11:00 AM).',
              ),
            ),

            _buildTimelineItem(
              context,
              time: '15:00',
              icon: Icons.groups,
              child: _buildPendingCard(
                context,
                title: 'Thermo Study Group',
                subtitle: 'Library, 2nd Floor',
                timeRange: '15:00 - 17:00',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineItem(
    BuildContext context, {
    required String time,
    required IconData icon,
    required Widget child,
    bool isConflict = false,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Text(
                time,
                style: context.asterTextTheme.labelMedium?.copyWith(
                  color: isConflict
                      ? context.colorScheme.error
                      : context.colorScheme.onSurfaceVariant,
                  fontWeight: isConflict ? FontWeight.w700 : null,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: isConflict
                      ? context.colorScheme.errorContainer
                      : context.colorScheme.surfaceContainerHigh,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: context.colorScheme.surface,
                    width: 4,
                  ),
                ),
                child: Icon(
                  icon,
                  size: 20,
                  color: isConflict
                      ? context.colorScheme.onErrorContainer
                      : context.colorScheme.onSurfaceVariant,
                ),
              ),
              Expanded(
                child: Container(
                  width: 2,
                  color: context.colorScheme.surfaceContainerHighest,
                ),
              ),
            ],
          ),
          const SizedBox(width: AsterSpacing.spaceMd),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: AsterSpacing.spaceXl),
              child: child,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransitItem(BuildContext context, {required String duration}) {
    return IntrinsicHeight(
      child: Row(
        children: [
          SizedBox(
            width: 48,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: 2,
                    color: context.colorScheme.surfaceContainerHighest,
                  ),
                ),
                const Icon(Icons.directions_bus, size: 16, color: Colors.grey),
                Expanded(
                  child: Container(
                    width: 2,
                    color: context.colorScheme.surfaceContainerHighest,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: AsterSpacing.spaceMd),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Divider(color: context.colorScheme.outlineVariant),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    duration,
                    style: context.asterTextTheme.bodySmall,
                  ),
                ),
                Expanded(
                  child: Divider(color: context.colorScheme.outlineVariant),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLectureCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String timeRange,
    required String status,
  }) {
    return AsterCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(title, style: context.asterTextTheme.titleMedium),
              ),
              const AsterStatusChip(status: AsterStatus.safe, label: 'Present'),
            ],
          ),
          const SizedBox(height: 4),
          Text(subtitle, style: context.asterTextTheme.bodySmall),
          const SizedBox(height: 8),
          Row(
            children: [
              _buildTag(context, timeRange),
              const SizedBox(width: 8),
              _buildTag(context, 'Campus', icon: Icons.location_on),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildConflictCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String conflictMessage,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.errorContainer.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: context.colorScheme.error.withValues(alpha: 0.3),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              width: 4,
              child: Container(color: context.colorScheme.error),
            ),
            Padding(
              padding: const EdgeInsets.all(AsterSpacing.spaceMd),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: context.asterTextTheme.titleMedium,
                        ),
                      ),
                      const AsterStatusChip(
                        status: AsterStatus.critical,
                        label: 'Conflict',
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(subtitle, style: context.asterTextTheme.bodySmall),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: context.colorScheme.surface,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: context.colorScheme.errorContainer,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.schedule,
                          color: context.colorScheme.error,
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Arrival delayed',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                conflictMessage,
                                style: const TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPendingCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String timeRange,
  }) {
    return Container(
      padding: const EdgeInsets.all(AsterSpacing.spaceMd),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: context.colorScheme.outlineVariant,
          style: BorderStyle.solid,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(title, style: context.asterTextTheme.titleMedium),
              ),
              const AsterStatusChip(
                status: AsterStatus.watch,
                label: 'Pending',
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(subtitle, style: context.asterTextTheme.bodySmall),
          const SizedBox(height: 8),
          _buildTag(context, timeRange),
        ],
      ),
    );
  }

  Widget _buildTag(BuildContext context, String text, {IconData? icon}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 12, color: context.colorScheme.onSurface),
            const SizedBox(width: 4),
          ],
          Text(text, style: context.asterTextTheme.labelSmall),
        ],
      ),
    );
  }
}
