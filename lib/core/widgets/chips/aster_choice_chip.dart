import 'package:flutter/material.dart';
import '../../../app/theme/aster_typography.dart';

/// Pill-shaped selection chip for Aster.
/// Active state uses solid Primary Indigo with white text.
/// Inactive state uses tonal surface with outline.
class AsterChoiceChip extends StatelessWidget {
  final String label;
  final bool selected;
  final ValueChanged<bool>? onSelected;
  final Widget? icon;

  const AsterChoiceChip({
    super.key,
    required this.label,
    required this.selected,
    this.onSelected,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ChoiceChip(
      label: Text(label),
      selected: selected,
      onSelected: onSelected,
      labelStyle: AsterTypography.labelMedium.copyWith(
        color: selected ? colorScheme.onPrimary : colorScheme.onSurface,
        fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
      ),
      avatar: icon,
      selectedColor: colorScheme.primary,
      backgroundColor: colorScheme.surfaceContainer,
      checkmarkColor: colorScheme.onPrimary,
      side: BorderSide(
        color: selected ? colorScheme.primary : colorScheme.outlineVariant,
        width: 1.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(9999.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      visualDensity: VisualDensity.compact,
      materialTapTargetSize:
          MaterialTapTargetSize.padded, // Ensures 48dp target
    );
  }
}
