import 'package:flutter/material.dart';
import '../../../app/theme/aster_spacing.dart';
import '../../../app/theme/aster_theme.dart';
import '../../../app/theme/aster_typography.dart';
import '../cards/aster_status_card.dart';

/// Pill-shaped chip for displaying status.
class AsterStatusChip extends StatelessWidget {
  final AsterStatus status;
  final String? label;
  final IconData? icon;

  const AsterStatusChip({
    super.key,
    required this.status,
    this.label,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final statusColors = context.asterColors;

    Color backgroundColor;
    Color onContainerColor;
    IconData statusIcon;
    String statusLabel;

    switch (status) {
      case AsterStatus.safe:
        backgroundColor = statusColors.safeContainer;
        onContainerColor = statusColors.onSafeContainer;
        statusIcon = icon ?? Icons.check_circle_outline;
        statusLabel = label ?? 'Safe';
      case AsterStatus.watch:
        backgroundColor = statusColors.watchContainer;
        onContainerColor = statusColors.onWatchContainer;
        statusIcon = icon ?? Icons.info_outline;
        statusLabel = label ?? 'Watch';
      case AsterStatus.risky:
        backgroundColor = statusColors.riskyContainer;
        onContainerColor = statusColors.onRiskyContainer;
        statusIcon = icon ?? Icons.warning_amber;
        statusLabel = label ?? 'Risky';
      case AsterStatus.critical:
        backgroundColor = statusColors.criticalContainer;
        onContainerColor = statusColors.onCriticalContainer;
        statusIcon = icon ?? Icons.error_outline;
        statusLabel = label ?? 'Critical';
      case AsterStatus.unrecoverable:
        backgroundColor = statusColors.unrecoverableContainer;
        onContainerColor = statusColors.onUnrecoverableContainer;
        statusIcon = icon ?? Icons.dangerous_outlined;
        statusLabel = label ?? 'Unrecoverable';
      case AsterStatus.information:
        backgroundColor = statusColors.informationContainer;
        onContainerColor = statusColors.onInformationContainer;
        statusIcon = icon ?? Icons.lightbulb_outline;
        statusLabel = label ?? 'Info';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(9999.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(statusIcon, color: onContainerColor, size: 16.0),
          const SizedBox(width: AsterSpacing.spaceXs),
          Text(
            statusLabel,
            style: AsterTypography.labelMedium.copyWith(
              color: onContainerColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
