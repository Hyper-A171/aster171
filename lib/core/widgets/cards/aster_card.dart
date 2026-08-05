import 'package:flutter/material.dart';
import '../../../app/theme/aster_radius.dart';
import '../../../app/theme/aster_shadows.dart';
import '../../../app/theme/aster_spacing.dart';

/// Standard organizational card for Aster.
/// Light mode: SurfaceContainerLowest, subtle level-1 shadow, no border.
/// Dark mode: SurfaceContainer, 1dp stroke #30343D, no shadow.
class AsterCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final Color? color;
  final double? radius;
  final bool showShadow;

  const AsterCard({
    super.key,
    required this.child,
    this.padding,
    this.onTap,
    this.color,
    this.radius,
    this.showShadow = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final colorScheme = theme.colorScheme;

    final cardColor =
        color ??
        (isDark
            ? colorScheme.surfaceContainer
            : colorScheme.surfaceContainerLowest);

    final borderRadius = BorderRadius.circular(
      radius ?? AsterRadius.radiusLarge,
    );

    Widget current = Container(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: borderRadius,
        border: isDark
            ? Border.all(color: const Color(0xFF30343D), width: 1.0)
            : null,
        boxShadow: (!isDark && showShadow) ? AsterShadows.level1List : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: borderRadius,
          child: Padding(
            padding: padding ?? const EdgeInsets.all(AsterSpacing.spaceMd),
            child: child,
          ),
        ),
      ),
    );

    return current;
  }
}
