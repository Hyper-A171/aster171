import 'package:flutter/material.dart';
import '../../../app/theme/aster_radius.dart';
import '../../../app/theme/aster_spacing.dart';
import '../../../app/theme/aster_typography.dart';

/// Text button for Aster design system.
/// Min height 48, LabelLarge typography.
class AsterTextButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Widget? icon;
  final bool isLoading;

  const AsterTextButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDisabled = onPressed == null || isLoading;

    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: AsterSpacing.minTouchTarget,
        minWidth: AsterSpacing.minTouchTarget,
      ),
      child: TextButton(
        onPressed: isDisabled ? null : onPressed,
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.primary,
          disabledForegroundColor: colorScheme.onSurface.withValues(
            alpha: 0.38,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AsterSpacing.spaceMd,
            vertical: 12.0,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: AsterRadius.buttonBorderRadius,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isLoading) ...[
              SizedBox(
                width: 18.0,
                height: 18.0,
                child: CircularProgressIndicator(
                  strokeWidth: 2.0,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(width: AsterSpacing.spaceSm),
            ] else if (icon != null) ...[
              icon!,
              const SizedBox(width: AsterSpacing.spaceSm),
            ],
            Text(
              label,
              style: AsterTypography.labelLarge.copyWith(
                color: isDisabled
                    ? colorScheme.onSurface.withValues(alpha: 0.38)
                    : colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
