import 'package:flutter/material.dart';
import '../../../app/theme/aster_spacing.dart';

/// Reusable loading indicator for Aster.
class AsterLoadingIndicator extends StatelessWidget {
  final String? message;

  const AsterLoadingIndicator({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          if (message != null) ...[
            const SizedBox(height: AsterSpacing.spaceMd),
            Text(message!, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ],
      ),
    );
  }
}
