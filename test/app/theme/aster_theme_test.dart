import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:aster/app/theme/aster_theme.dart';
import 'package:aster/app/theme/aster_colors.dart';
import 'package:aster/app/theme/aster_radius.dart';

void main() {
  group('AsterTheme', () {
    test('Light theme has correct primary color', () {
      final theme = AsterTheme.light;
      expect(theme.colorScheme.primary, AsterColors.lightPrimary);
    });

    test('Dark theme has correct brightness', () {
      final theme = AsterTheme.dark;
      expect(theme.brightness, Brightness.dark);
    });

    test('Theme has AsterStatusColors extension', () {
      final theme = AsterTheme.light;
      final statusColors = theme.extension<AsterStatusColors>();
      expect(statusColors, isNotNull);
      expect(statusColors!.safe, AsterColors.safe);
    });

    test('AppBar title has correct typography', () {
      final theme = AsterTheme.light;
      expect(theme.appBarTheme.titleTextStyle?.fontSize, 16.0);
      expect(theme.appBarTheme.titleTextStyle?.fontWeight, FontWeight.w500);
    });

    test('Card theme has correct radius', () {
      final theme = AsterTheme.light;
      final shape = theme.cardTheme.shape as RoundedRectangleBorder;
      expect(shape.borderRadius, AsterRadius.cardBorderRadius);
    });
  });
}
