import 'package:flutter/material.dart';

/// Centralized Aster typography based on the Inter font family.
abstract class AsterTypography {
  static const String fontFamily = 'Inter';

  static const TextStyle displayLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 57.0,
    fontWeight: FontWeight.w700,
    height: 64.0 / 57.0,
    letterSpacing: -0.25,
  );

  static const TextStyle displayMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 45.0,
    fontWeight: FontWeight.w700,
    height: 52.0 / 45.0,
    letterSpacing: 0.0,
  );

  static const TextStyle displaySmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 36.0,
    fontWeight: FontWeight.w600,
    height: 44.0 / 36.0,
    letterSpacing: 0.0,
  );

  static const TextStyle headlineLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 32.0,
    fontWeight: FontWeight.w600,
    height: 40.0 / 32.0,
    letterSpacing: 0.0,
  );

  /// Compact screen variation of headlineLarge
  static const TextStyle headlineLargeMobile = TextStyle(
    fontFamily: fontFamily,
    fontSize: 28.0,
    fontWeight: FontWeight.w600,
    height: 36.0 / 28.0,
    letterSpacing: 0.0,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 28.0,
    fontWeight: FontWeight.w600,
    height: 36.0 / 28.0,
    letterSpacing: 0.0,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24.0,
    fontWeight: FontWeight.w600,
    height: 32.0 / 24.0,
    letterSpacing: 0.0,
  );

  static const TextStyle titleLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 22.0,
    fontWeight: FontWeight.w500,
    height: 28.0 / 22.0,
    letterSpacing: 0.0,
  );

  static const TextStyle titleMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    height: 24.0 / 16.0,
    letterSpacing: 0.15,
  );

  static const TextStyle titleSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    height: 20.0 / 14.0,
    letterSpacing: 0.1,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    height: 24.0 / 16.0,
    letterSpacing: 0.5,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    height: 20.0 / 14.0,
    letterSpacing: 0.25,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    height: 16.0 / 12.0,
    letterSpacing: 0.4,
  );

  static const TextStyle labelLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    height: 20.0 / 14.0,
    letterSpacing: 0.1,
  );

  static const TextStyle labelMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    height: 16.0 / 12.0,
    letterSpacing: 0.5,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 11.0,
    fontWeight: FontWeight.w500,
    height: 16.0 / 11.0,
    letterSpacing: 0.5,
  );

  /// Builds a complete TextTheme with correct font colors based on [colorScheme].
  static TextTheme textTheme(ColorScheme colorScheme) {
    return TextTheme(
      displayLarge: displayLarge.copyWith(color: colorScheme.onSurface),
      displayMedium: displayMedium.copyWith(color: colorScheme.onSurface),
      displaySmall: displaySmall.copyWith(color: colorScheme.onSurface),
      headlineLarge: headlineLarge.copyWith(color: colorScheme.onSurface),
      headlineMedium: headlineMedium.copyWith(color: colorScheme.onSurface),
      headlineSmall: headlineSmall.copyWith(color: colorScheme.onSurface),
      titleLarge: titleLarge.copyWith(color: colorScheme.onSurface),
      titleMedium: titleMedium.copyWith(color: colorScheme.onSurface),
      titleSmall: titleSmall.copyWith(color: colorScheme.onSurface),
      bodyLarge: bodyLarge.copyWith(color: colorScheme.onSurface),
      bodyMedium: bodyMedium.copyWith(color: colorScheme.onSurfaceVariant),
      bodySmall: bodySmall.copyWith(color: colorScheme.onSurfaceVariant),
      labelLarge: labelLarge.copyWith(color: colorScheme.onSurface),
      labelMedium: labelMedium.copyWith(color: colorScheme.onSurfaceVariant),
      labelSmall: labelSmall.copyWith(color: colorScheme.onSurfaceVariant),
    );
  }
}
