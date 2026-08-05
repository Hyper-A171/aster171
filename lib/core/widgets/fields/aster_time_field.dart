import 'package:flutter/material.dart';
import 'aster_text_field.dart';

/// Reusable Aster Time Picker Field.
class AsterTimeField extends StatelessWidget {
  final TimeOfDay? value;
  final String label;
  final String? hintText;
  final ValueChanged<TimeOfDay>? onTimeSelected;

  const AsterTimeField({
    super.key,
    required this.value,
    required this.label,
    this.hintText,
    this.onTimeSelected,
  });

  @override
  Widget build(BuildContext context) {
    final displayValue = value != null ? value!.format(context) : '';

    return AsterTextField(
      label: label,
      hintText: hintText ?? 'Select time',
      readOnly: true,
      controller: TextEditingController(text: displayValue),
      onTap: () async {
        final picked = await showTimePicker(
          context: context,
          initialTime: value ?? TimeOfDay.now(),
        );
        if (picked != null && onTimeSelected != null) {
          onTimeSelected!(picked);
        }
      },
      suffixIcon: const Icon(Icons.access_time),
    );
  }
}
