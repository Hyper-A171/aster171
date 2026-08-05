import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'aster_text_field.dart';

/// Reusable Aster Date Picker Field.
class AsterDateField extends StatelessWidget {
  final DateTime? value;
  final String label;
  final String? hintText;
  final ValueChanged<DateTime>? onDateSelected;
  final DateTime? firstDate;
  final DateTime? lastDate;

  const AsterDateField({
    super.key,
    required this.value,
    required this.label,
    this.hintText,
    this.onDateSelected,
    this.firstDate,
    this.lastDate,
  });

  @override
  Widget build(BuildContext context) {
    final displayValue = value != null
        ? DateFormat('MMM dd, yyyy').format(value!)
        : '';

    return AsterTextField(
      label: label,
      hintText: hintText ?? 'Select date',
      readOnly: true,
      controller: TextEditingController(text: displayValue),
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: value ?? DateTime.now(),
          firstDate: firstDate ?? DateTime(2000),
          lastDate: lastDate ?? DateTime(2100),
        );
        if (picked != null && onDateSelected != null) {
          onDateSelected!(picked);
        }
      },
      suffixIcon: const Icon(Icons.calendar_today_outlined),
    );
  }
}
