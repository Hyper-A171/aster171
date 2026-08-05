import 'package:flutter/material.dart';
import '../../../app/theme/aster_spacing.dart';
import '../../../app/theme/aster_typography.dart';

/// Standard empty state component for Aster.
class AsterEmptyState extends StatelessWidget {
  final String title;
  final String message;
  final Widget? action;
  final IconData? icon;

  const AsterEmptyState({
    super.key,
    required this.title,
    required this.message,
    this.action,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AsterSpacing.spaceLg),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 64.0, color: colorScheme.outlineVariant),
              const SizedBox(height: AsterSpacing.spaceLg),
            ],
            Text(
              title,
              style: AsterTypography.headlineSmall.copyWith(
                color: colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AsterSpacing.spaceSm),
            Text(
              message,
              style: AsterTypography.bodyMedium.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            if (action != null) ...[
              const SizedBox(height: AsterSpacing.spaceXl),
              action!,
            ],
          ],
        ),
      ),
    );
  }
}
