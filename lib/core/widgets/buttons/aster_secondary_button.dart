import 'package:flutter/material.dart';
import '../../../app/theme/aster_radius.dart';
import '../../../app/theme/aster_spacing.dart';
import '../../../app/theme/aster_typography.dart';

/// Secondary action button for Aster design system.
/// Uses Violet tonal container fill, 12 px radius, and min height of 48.
class AsterSecondaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Widget? icon;
  final bool isLoading;
  final bool fullWidth;

  const AsterSecondaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.isLoading = false,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDisabled = onPressed == null || isLoading;

    final childContent = Row(
      mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isLoading) ...[
          SizedBox(
            width: 20.0,
            height: 20.0,
            child: CircularProgressIndicator(
              strokeWidth: 2.5,
              valueColor: AlwaysStoppedAnimation<Color>(
                colorScheme.onSecondaryContainer,
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
                : colorScheme.onSecondaryContainer,
          ),
        ),
      ],
    );

    final buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: colorScheme.secondaryContainer,
      foregroundColor: colorScheme.onSecondaryContainer,
      disabledBackgroundColor: colorScheme.onSurface.withValues(alpha: 0.12),
      disabledForegroundColor: colorScheme.onSurface.withValues(alpha: 0.38),
      minimumSize: const Size(
        AsterSpacing.minTouchTarget,
        AsterSpacing.minTouchTarget,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AsterSpacing.spaceLg,
        vertical: 12.0,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: AsterRadius.buttonBorderRadius,
      ),
      elevation: 0.0,
    );

    final button = ConstrainedBox(
      constraints: const BoxConstraints(minHeight: AsterSpacing.minTouchTarget),
      child: ElevatedButton(
        onPressed: isDisabled ? null : onPressed,
        style: buttonStyle,
        child: childContent,
      ),
    );

    if (fullWidth) {
      return SizedBox(width: double.infinity, child: button);
    }

    return button;
  }
}
