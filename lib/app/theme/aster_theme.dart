import 'package:flutter/material.dart';
import 'aster_color_scheme.dart';
import 'aster_colors.dart';
import 'aster_component_themes.dart';
import 'aster_radius.dart';
import 'aster_spacing.dart';
import 'aster_typography.dart';

/// Central theme provider for Aster Flutter app.
abstract class AsterTheme {
  static ThemeData get light {
    final colorScheme = AsterColorScheme.light;
    final textTheme = AsterTypography.textTheme(colorScheme);

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      fontFamily: AsterTypography.fontFamily,
      textTheme: textTheme,
      appBarTheme: AsterComponentThemes.appBarTheme(colorScheme),
      cardTheme: AsterComponentThemes.cardTheme(
        isDark: false,
        colorScheme: colorScheme,
      ),
      elevatedButtonTheme: AsterComponentThemes.elevatedButtonTheme(
        colorScheme,
      ),
      filledButtonTheme: AsterComponentThemes.filledButtonTheme(colorScheme),
      outlinedButtonTheme: AsterComponentThemes.outlinedButtonTheme(
        colorScheme,
      ),
      textButtonTheme: AsterComponentThemes.textButtonTheme(colorScheme),
      iconButtonTheme: AsterComponentThemes.iconButtonTheme(colorScheme),
      inputDecorationTheme: AsterComponentThemes.inputDecorationTheme(
        colorScheme,
      ),
      navigationBarTheme: AsterComponentThemes.navigationBarTheme(colorScheme),
      floatingActionButtonTheme: AsterComponentThemes.fabTheme(colorScheme),
      bottomSheetTheme: AsterComponentThemes.bottomSheetTheme(colorScheme),
      dialogTheme: AsterComponentThemes.dialogTheme(colorScheme),
      chipTheme: AsterComponentThemes.chipTheme(colorScheme),
      extensions: <ThemeExtension<dynamic>>[AsterStatusColors.light],
    );
  }

  static ThemeData get dark {
    final colorScheme = AsterColorScheme.dark;
    final textTheme = AsterTypography.textTheme(colorScheme);

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      fontFamily: AsterTypography.fontFamily,
      textTheme: textTheme,
      appBarTheme: AsterComponentThemes.appBarTheme(colorScheme),
      cardTheme: AsterComponentThemes.cardTheme(
        isDark: true,
        colorScheme: colorScheme,
      ),
      elevatedButtonTheme: AsterComponentThemes.elevatedButtonTheme(
        colorScheme,
      ),
      filledButtonTheme: AsterComponentThemes.filledButtonTheme(colorScheme),
      outlinedButtonTheme: AsterComponentThemes.outlinedButtonTheme(
        colorScheme,
      ),
      textButtonTheme: AsterComponentThemes.textButtonTheme(colorScheme),
      iconButtonTheme: AsterComponentThemes.iconButtonTheme(colorScheme),
      inputDecorationTheme: AsterComponentThemes.inputDecorationTheme(
        colorScheme,
      ),
      navigationBarTheme: AsterComponentThemes.navigationBarTheme(colorScheme),
      floatingActionButtonTheme: AsterComponentThemes.fabTheme(colorScheme),
      bottomSheetTheme: AsterComponentThemes.bottomSheetTheme(colorScheme),
      dialogTheme: AsterComponentThemes.dialogTheme(colorScheme),
      chipTheme: AsterComponentThemes.chipTheme(colorScheme),
      extensions: <ThemeExtension<dynamic>>[AsterStatusColors.dark],
    );
  }
}

/// Helpful BuildContext extensions for accessing Aster design system extensions.
extension AsterThemeX on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get asterTextTheme => Theme.of(this).textTheme;

  AsterStatusColors get asterColors {
    return Theme.of(this).extension<AsterStatusColors>() ??
        AsterStatusColors.light;
  }

  AsterSpacingData get asterSpacing => const AsterSpacingData();
  AsterRadiusData get asterRadius => const AsterRadiusData();
}
