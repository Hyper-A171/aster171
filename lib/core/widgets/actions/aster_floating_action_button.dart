import 'package:flutter/material.dart';

/// Floating Action Button for Aster.
/// Rounded square with 16 radius, Primary Indigo fill, white icon.
class AsterFloatingActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget icon;
  final String? tooltip;

  const AsterFloatingActionButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      tooltip: tooltip,
      child: icon,
    );
  }
}
