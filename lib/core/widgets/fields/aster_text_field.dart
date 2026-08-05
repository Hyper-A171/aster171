import 'package:flutter/material.dart';
import '../../../app/theme/aster_spacing.dart';
import '../../../app/theme/aster_typography.dart';

/// Reusable Material 3 Aster Text Field.
/// Uses filled style with 12px radius and min height 48.
class AsterTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final bool readOnly;
  final int? maxLines;

  const AsterTextField({
    super.key,
    this.controller,
    required this.label,
    this.hintText,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.onTap,
    this.readOnly = false,
    this.maxLines = 1,
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
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          onChanged: onChanged,
          onTap: onTap,
          readOnly: readOnly,
          maxLines: maxLines,
          style: AsterTypography.bodyLarge,
          decoration: InputDecoration(
            hintText: hintText,
            helperText: helperText,
            errorText: errorText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AsterSpacing.spaceMd,
              vertical: 14.0,
            ),
          ),
        ),
      ],
    );
  }
}
