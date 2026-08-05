import 'package:flutter/material.dart';
import '../../../app/theme/aster_spacing.dart';

/// Icon button for Aster design system with minimum 48x48 touch target and accessibility support.
class AsterIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final String tooltip;
  final Color? color;
  final Color? backgroundColor;

  const AsterIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.tooltip,
    this.color,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    Widget button = ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: AsterSpacing.minTouchTarget,
        minHeight: AsterSpacing.minTouchTarget,
      ),
      child: IconButton(
        icon: Icon(icon),
        onPressed: onPressed,
        tooltip: tooltip,
        color: color ?? colorScheme.onSurface,
        style: backgroundColor != null
            ? IconButton.styleFrom(
                backgroundColor: backgroundColor,
                foregroundColor: color ?? colorScheme.onSurface,
              )
            : null,
      ),
    );

    return Semantics(
      label: tooltip,
      button: true,
      enabled: onPressed != null,
      child: button,
    );
  }
}
