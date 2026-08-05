import 'package:flutter/material.dart';
import '../../../app/theme/aster_spacing.dart';
import '../../../app/theme/aster_theme.dart';
import '../../../app/theme/aster_typography.dart';
import 'aster_card.dart';

enum AsterStatus { safe, watch, risky, critical, unrecoverable, information }

/// Specialized card for displaying attendance or internship status.
/// Uses semantic status colors and includes icon/label support.
class AsterStatusCard extends StatelessWidget {
  final AsterStatus status;
  final String title;
  final String? description;
  final Widget? content;
  final IconData? icon;
  final VoidCallback? onTap;

  const AsterStatusCard({
    super.key,
    required this.status,
    required this.title,
    this.description,
    this.content,
    this.icon,
    this.onTap,
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
        statusLabel = 'Safe';
      case AsterStatus.watch:
        backgroundColor = statusColors.watchContainer;
        onContainerColor = statusColors.onWatchContainer;
        statusIcon = icon ?? Icons.info_outline;
        statusLabel = 'Watch';
      case AsterStatus.risky:
        backgroundColor = statusColors.riskyContainer;
        onContainerColor = statusColors.onRiskyContainer;
        statusIcon = icon ?? Icons.warning_amber;
        statusLabel = 'Risky';
      case AsterStatus.critical:
        backgroundColor = statusColors.criticalContainer;
        onContainerColor = statusColors.onCriticalContainer;
        statusIcon = icon ?? Icons.error_outline;
        statusLabel = 'Critical';
      case AsterStatus.unrecoverable:
        backgroundColor = statusColors.unrecoverableContainer;
        onContainerColor = statusColors.onUnrecoverableContainer;
        statusIcon = icon ?? Icons.dangerous_outlined;
        statusLabel = 'Unrecoverable';
      case AsterStatus.information:
        backgroundColor = statusColors.informationContainer;
        onContainerColor = statusColors.onInformationContainer;
        statusIcon = icon ?? Icons.lightbulb_outline;
        statusLabel = 'Information';
    }

    return AsterCard(
      onTap: onTap,
      color: backgroundColor,
      showShadow: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(statusIcon, color: onContainerColor, size: 20.0),
              const SizedBox(width: AsterSpacing.spaceSm),
              Text(
                statusLabel.toUpperCase(),
                style: AsterTypography.labelMedium.copyWith(
                  color: onContainerColor,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.0,
                ),
              ),
            ],
          ),
          const SizedBox(height: AsterSpacing.spaceSm),
          Text(
            title,
            style: AsterTypography.titleLarge.copyWith(color: onContainerColor),
          ),
          if (description != null) ...[
            const SizedBox(height: AsterSpacing.spaceXs),
            Text(
              description!,
              style: AsterTypography.bodyMedium.copyWith(
                color: onContainerColor.withValues(alpha: 0.8),
              ),
            ),
          ],
          if (content != null) ...[
            const SizedBox(height: AsterSpacing.spaceMd),
            content!,
          ],
        ],
      ),
    );
  }
}
