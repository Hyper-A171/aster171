import 'package:flutter/material.dart';
import '../../../app/theme/aster_spacing.dart';
import '../../../app/theme/aster_typography.dart';

/// Reusable Aster Dropdown Field.
class AsterDropdownField<T> extends StatelessWidget {
  final T? value;
  final String label;
  final String? hintText;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?>? onChanged;
  final String? errorText;
  final Widget? prefixIcon;

  const AsterDropdownField({
    super.key,
    required this.value,
    required this.label,
    this.hintText,
    required this.items,
    this.onChanged,
    this.errorText,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: AsterTypography.labelLarge.copyWith(
            color: theme.colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: AsterSpacing.spaceXs),
        DropdownButtonFormField<T>(
          value: value,
          items: items,
          onChanged: onChanged,
          style: AsterTypography.bodyLarge.copyWith(
            color: theme.colorScheme.onSurface,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            errorText: errorText,
            prefixIcon: prefixIcon,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AsterSpacing.spaceMd,
              vertical: 14.0,
            ),
          ),
          icon: const Icon(Icons.arrow_drop_down),
        ),
      ],
    );
  }
}
