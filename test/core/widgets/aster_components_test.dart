import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:aster/app/theme/aster_theme.dart';
import 'package:aster/core/widgets/buttons/aster_primary_button.dart';
import 'package:aster/core/widgets/chips/aster_status_chip.dart';
import 'package:aster/core/widgets/cards/aster_status_card.dart';

void main() {
  Widget wrap(Widget child) {
    return MaterialApp(
      theme: AsterTheme.light,
      home: Scaffold(body: child),
    );
  }

  group('Aster Components', () {
    testWidgets('AsterPrimaryButton renders label and has min height', (
      tester,
    ) async {
      await tester.pumpWidget(
        wrap(AsterPrimaryButton(label: 'Test Button', onPressed: () {})),
      );

      expect(find.text('Test Button'), findsOneWidget);

      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(button.style?.minimumSize?.resolve({}), const Size(48.0, 48.0));
    });

    testWidgets('AsterStatusChip displays correct label', (tester) async {
      await tester.pumpWidget(
        wrap(
          const AsterStatusChip(status: AsterStatus.safe, label: 'On Track'),
        ),
      );

      expect(find.text('On Track'), findsOneWidget);
    });

    testWidgets('AsterIconButton has minimum touch target', (tester) async {
      await tester.pumpWidget(
        wrap(IconButton(icon: const Icon(Icons.add), onPressed: () {})),
      );

      final Size size = tester.getSize(find.byType(IconButton));
      expect(size.width, greaterThanOrEqualTo(48.0));
      expect(size.height, greaterThanOrEqualTo(48.0));
    });
  });
}
