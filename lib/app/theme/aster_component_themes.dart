import 'package:flutter/material.dart';
import 'aster_colors.dart';

import 'aster_radius.dart';
import 'aster_spacing.dart';
import 'aster_typography.dart';

/// Component themes configuring standard Material 3 widgets to match Stitch design specs.
abstract class AsterComponentThemes {
  static AppBarTheme appBarTheme(ColorScheme colorScheme) {
    return AppBarTheme(
      backgroundColor: colorScheme.surface,
      foregroundColor: colorScheme.onSurface,
      elevation: 0.0,
      scrolledUnderElevation: 1.0,
      centerTitle: false,
      titleTextStyle: AsterTypography.titleMedium.copyWith(
        color: colorScheme.onSurface,
      ),
      iconTheme: IconThemeData(color: colorScheme.onSurface, size: 24.0),
    );
  }

  static CardThemeData cardTheme({
    required bool isDark,
    required ColorScheme colorScheme,
  }) {
    return CardThemeData(
      color: isDark
          ? colorScheme.surfaceContainer
          : colorScheme.surfaceContainerLowest,
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: AsterRadius.cardBorderRadius,
        side: isDark
            ? const BorderSide(color: AsterColors.darkCardBorder, width: 1.0)
            : BorderSide.none,
      ),
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
    );
  }

  static ElevatedButtonThemeData elevatedButtonTheme(ColorScheme colorScheme) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        minimumSize: const Size(
          AsterSpacing.minTouchTarget,
          AsterSpacing.minTouchTarget,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AsterSpacing.spaceLg,
          vertical: 12.0,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: AsterRadius.buttonBorderRadius,
        ),
        textStyle: AsterTypography.labelLarge,
        elevation: 0.0,
      ),
    );
  }

  static FilledButtonThemeData filledButtonTheme(ColorScheme colorScheme) {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        minimumSize: const Size(
          AsterSpacing.minTouchTarget,
          AsterSpacing.minTouchTarget,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AsterSpacing.spaceLg,
          vertical: 12.0,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: AsterRadius.buttonBorderRadius,
        ),
        textStyle: AsterTypography.labelLarge,
        elevation: 0.0,
      ),
    );
  }

  static OutlinedButtonThemeData outlinedButtonTheme(ColorScheme colorScheme) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: colorScheme.primary,
        minimumSize: const Size(
          AsterSpacing.minTouchTarget,
          AsterSpacing.minTouchTarget,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AsterSpacing.spaceLg,
          vertical: 12.0,
        ),
        side: BorderSide(color: colorScheme.outline, width: 1.0),
        shape: const RoundedRectangleBorder(
          borderRadius: AsterRadius.buttonBorderRadius,
        ),
        textStyle: AsterTypography.labelLarge,
      ),
    );
  }

  static TextButtonThemeData textButtonTheme(ColorScheme colorScheme) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: colorScheme.primary,
        minimumSize: const Size(
          AsterSpacing.minTouchTarget,
          AsterSpacing.minTouchTarget,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AsterSpacing.spaceMd,
          vertical: 12.0,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: AsterRadius.buttonBorderRadius,
        ),
        textStyle: AsterTypography.labelLarge,
      ),
    );
  }

  static IconButtonThemeData iconButtonTheme(ColorScheme colorScheme) {
    return IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: colorScheme.onSurface,
        minimumSize: const Size(
          AsterSpacing.minTouchTarget,
          AsterSpacing.minTouchTarget,
        ),
        padding: const EdgeInsets.all(12.0),
      ),
    );
  }

  static InputDecorationTheme inputDecorationTheme(ColorScheme colorScheme) {
    return InputDecorationTheme(
      filled: true,
      fillColor: colorScheme.surfaceContainerLow,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AsterSpacing.spaceMd,
        vertical: 14.0,
      ),
      border: OutlineInputBorder(
        borderRadius: AsterRadius.borderMedium,
        borderSide: BorderSide(color: colorScheme.outlineVariant, width: 1.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: AsterRadius.borderMedium,
        borderSide: BorderSide(color: colorScheme.outlineVariant, width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: AsterRadius.borderMedium,
        borderSide: BorderSide(color: colorScheme.primary, width: 2.0),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: AsterRadius.borderMedium,
        borderSide: BorderSide(color: colorScheme.error, width: 1.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: AsterRadius.borderMedium,
        borderSide: BorderSide(color: colorScheme.error, width: 2.0),
      ),
      labelStyle: AsterTypography.bodyMedium.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
      hintStyle: AsterTypography.bodyMedium.copyWith(
        color: colorScheme.outline,
      ),
      errorStyle: AsterTypography.bodySmall.copyWith(color: colorScheme.error),
      helperStyle: AsterTypography.bodySmall.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
    );
  }

  static NavigationBarThemeData navigationBarTheme(ColorScheme colorScheme) {
    return NavigationBarThemeData(
      height: 64.0,
      backgroundColor: colorScheme.surface,
      elevation: 0.0,
      indicatorColor: colorScheme.primaryContainer,
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return IconThemeData(
            color: colorScheme.onPrimaryContainer,
            size: 24.0,
          );
        }
        return IconThemeData(color: colorScheme.onSurfaceVariant, size: 24.0);
      }),
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AsterTypography.labelMedium.copyWith(
            color: colorScheme.primary,
            fontWeight: FontWeight.w600,
          );
        }
        return AsterTypography.labelMedium.copyWith(
          color: colorScheme.onSurfaceVariant,
        );
      }),
    );
  }

  static FloatingActionButtonThemeData fabTheme(ColorScheme colorScheme) {
    return FloatingActionButtonThemeData(
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
      elevation: 2.0,
      shape: const RoundedRectangleBorder(
        borderRadius: AsterRadius.fabBorderRadius,
      ),
      sizeConstraints: const BoxConstraints.tightFor(width: 56.0, height: 56.0),
    );
  }

  static BottomSheetThemeData bottomSheetTheme(ColorScheme colorScheme) {
    return BottomSheetThemeData(
      backgroundColor: colorScheme.surface,
      surfaceTintColor: colorScheme.surfaceTint,
      elevation: 2.0,
      shape: const RoundedRectangleBorder(
        borderRadius: AsterRadius.bottomSheetBorderRadius,
      ),
    );
  }

  static DialogThemeData dialogTheme(ColorScheme colorScheme) {
    return DialogThemeData(
      backgroundColor: colorScheme.surface,
      elevation: 4.0,
      shape: const RoundedRectangleBorder(
        borderRadius: AsterRadius.borderExtraLarge,
      ),
      titleTextStyle: AsterTypography.headlineSmall.copyWith(
        color: colorScheme.onSurface,
      ),
      contentTextStyle: AsterTypography.bodyMedium.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
    );
  }

  static ChipThemeData chipTheme(ColorScheme colorScheme) {
    return ChipThemeData(
      backgroundColor: colorScheme.surfaceContainer,
      disabledColor: colorScheme.surfaceContainerLow,
      selectedColor: colorScheme.primary,
      secondarySelectedColor: colorScheme.primaryContainer,
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      labelStyle: AsterTypography.labelMedium.copyWith(
        color: colorScheme.onSurface,
      ),
      secondaryLabelStyle: AsterTypography.labelMedium.copyWith(
        color: colorScheme.onPrimary,
      ),
      brightness: colorScheme.brightness,
      shape: const RoundedRectangleBorder(
        borderRadius: AsterRadius.pillChipBorderRadius,
      ),
      side: BorderSide(color: colorScheme.outlineVariant, width: 1.0),
    );
  }
}
