import 'package:flutter/material.dart';
import '../../../app/theme/aster_spacing.dart';
import '../../../app/theme/aster_typography.dart';

/// Standard error state component for Aster.
class AsterErrorState extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback? onRetry;

  const AsterErrorState({
    super.key,
    this.title = 'Something went wrong',
    required this.message,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AsterSpacing.spaceLg),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64.0, color: colorScheme.error),
            const SizedBox(height: AsterSpacing.spaceLg),
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
            if (onRetry != null) ...[
              const SizedBox(height: AsterSpacing.spaceXl),
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: const Text('Try Again'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
