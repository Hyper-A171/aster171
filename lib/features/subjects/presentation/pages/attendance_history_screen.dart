import 'package:flutter/material.dart';
import '../../../../app/theme/aster_spacing.dart';
import '../../../../app/theme/aster_theme.dart';
import '../../../../app/theme/aster_typography.dart';
import '../../../../core/responsive/responsive_layout.dart';
import '../../../../core/widgets/cards/aster_card.dart';
import '../../../../core/widgets/cards/aster_status_card.dart';
import '../../../../core/widgets/chips/aster_status_chip.dart';

class AttendanceHistoryScreen extends StatelessWidget {
  const AttendanceHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Attendance History')),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: context.sideMargin,
          vertical: AsterSpacing.spaceLg,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Review your detailed lecture attendance and percentage shifts.',
              style: context.asterTextTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: AsterSpacing.spaceLg),

            // Filters
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilter(context, 'All Subjects', active: true),
                  const SizedBox(width: 8),
                  _buildFilter(context, 'This Week'),
                  const SizedBox(width: 8),
                  _buildFilter(context, 'Last Month'),
                ],
              ),
            ),
            const SizedBox(height: AsterSpacing.spaceLg),

            // History List
            AsterCard(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  _buildHistoryEntry(
                    context,
                    date: 'Oct 24, 2023',
                    subject: 'Advanced Data Structures',
                    session: 'Lec 14',
                    status: AsterStatus.safe,
                    statusLabel: 'Present',
                    shift: '+0.5% (84.5%)',
                    isUp: true,
                  ),
                  const Divider(height: 1),
                  _buildHistoryEntry(
                    context,
                    date: 'Oct 23, 2023',
                    subject: 'Machine Learning Ethics',
                    session: 'Sem 04',
                    status: AsterStatus.critical,
                    statusLabel: 'Absent',
                    shift: '-1.2% (79.0%)',
                    isUp: false,
                    isBackground: true,
                  ),
                  const Divider(height: 1),
                  _buildHistoryEntry(
                    context,
                    date: 'Oct 21, 2023',
                    subject: 'Linear Algebra',
                    session: 'Lec 22',
                    status: AsterStatus.safe,
                    statusLabel: 'Present',
                    shift: '+0.3% (91.2%)',
                    isUp: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text('Load More History'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilter(
    BuildContext context,
    String label, {
    bool active = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: active ? context.colorScheme.primary : Colors.transparent,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: active
              ? context.colorScheme.primary
              : context.colorScheme.outlineVariant,
        ),
      ),
      child: Text(
        label,
        style: context.asterTextTheme.labelMedium?.copyWith(
          color: active
              ? context.colorScheme.onPrimary
              : context.colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }

  Widget _buildHistoryEntry(
    BuildContext context, {
    required String date,
    required String subject,
    required String session,
    required AsterStatus status,
    required String statusLabel,
    required String shift,
    required bool isUp,
    bool isBackground = false,
  }) {
    return Container(
      color: isBackground
          ? context.colorScheme.errorContainer.withValues(alpha: 0.05)
          : null,
      padding: const EdgeInsets.all(AsterSpacing.spaceMd),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(date, style: context.asterTextTheme.bodySmall),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.undo, size: 18),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit, size: 18),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(subject, style: context.asterTextTheme.titleSmall),
                    Text(session, style: context.asterTextTheme.bodySmall),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AsterStatusChip(status: status, label: statusLabel),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        isUp ? Icons.trending_up : Icons.trending_down,
                        size: 14,
                        color: isUp
                            ? context.asterColors.safe
                            : context.colorScheme.error,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        shift,
                        style: context.asterTextTheme.bodySmall?.copyWith(
                          color: isUp
                              ? context.asterColors.safe
                              : context.colorScheme.error,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
