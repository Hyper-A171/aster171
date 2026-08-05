import 'package:flutter/material.dart';

/// Raw color tokens defined in the Google Stitch design system for Aster.
abstract class AsterColors {
  // Light Palette Tokens
  static const Color lightSurface = Color(0xFFF9F9FF);
  static const Color lightSurfaceDim = Color(0xFFD9D9E1);
  static const Color lightSurfaceBright = Color(0xFFF9F9FF);
  static const Color lightSurfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color lightSurfaceContainerLow = Color(0xFFF3F3FA);
  static const Color lightSurfaceContainer = Color(0xFFEDEDF5);
  static const Color lightSurfaceContainerHigh = Color(0xFFE8E7EF);
  static const Color lightSurfaceContainerHighest = Color(0xFFE2E2E9);

  static const Color lightOnSurface = Color(0xFF1A1B21);
  static const Color lightOnSurfaceVariant = Color(0xFF454652);

  static const Color lightInverseSurface = Color(0xFF2E3036);
  static const Color lightInverseOnSurface = Color(0xFFF0F0F7);

  static const Color lightOutline = Color(0xFF767683);
  static const Color lightOutlineVariant = Color(0xFFC6C5D4);

  static const Color lightSurfaceTint = Color(0xFF4755B6);

  static const Color lightPrimary = Color(0xFF142588);
  static const Color lightOnPrimary = Color(0xFFFFFFFF);
  static const Color lightPrimaryContainer = Color(0xFF303F9F);
  static const Color lightOnPrimaryContainer = Color(0xFFAAB4FF);
  static const Color lightInversePrimary = Color(0xFFBBC3FF);

  static const Color lightSecondary = Color(0xFF5A4BC5);
  static const Color lightOnSecondary = Color(0xFFFFFFFF);
  static const Color lightSecondaryContainer = Color(0xFF8F83FF);
  static const Color lightOnSecondaryContainer = Color(0xFF250193);

  static const Color lightTertiary = Color(0xFF003C22);
  static const Color lightOnTertiary = Color(0xFFFFFFFF);
  static const Color lightTertiaryContainer = Color(0xFF005533);
  static const Color lightOnTertiaryContainer = Color(0xFF56CF90);

  static const Color lightError = Color(0xFFBA1A1A);
  static const Color lightOnError = Color(0xFFFFFFFF);
  static const Color lightErrorContainer = Color(0xFFFFDAD6);
  static const Color lightOnErrorContainer = Color(0xFF93000A);

  static const Color lightPrimaryFixed = Color(0xFFDFE0FF);
  static const Color lightPrimaryFixedDim = Color(0xFFBBC3FF);
  static const Color lightOnPrimaryFixed = Color(0xFF000D5F);
  static const Color lightOnPrimaryFixedVariant = Color(0xFF2D3C9C);

  static const Color lightSecondaryFixed = Color(0xFFE4DFFF);
  static const Color lightSecondaryFixedDim = Color(0xFFC6BFFF);
  static const Color lightOnSecondaryFixed = Color(0xFF160066);
  static const Color lightOnSecondaryFixedVariant = Color(0xFF4130AC);

  static const Color lightTertiaryFixed = Color(0xFF82FAB7);
  static const Color lightTertiaryFixedDim = Color(0xFF65DD9D);
  static const Color lightOnTertiaryFixed = Color(0xFF002111);
  static const Color lightOnTertiaryFixedVariant = Color(0xFF005231);

  static const Color lightBackground = Color(0xFFF9F9FF);
  static const Color lightOnBackground = Color(0xFF1A1B21);
  static const Color lightSurfaceVariant = Color(0xFFE2E2E9);

  // Light Functional Status Colors
  static const Color safe = Color(0xFF2E8B63);
  static const Color safeContainer = Color(0xFFD8F3E6);
  static const Color onSafeContainer = Color(0xFF123D2C);

  static const Color watch = Color(0xFFA96F12);
  static const Color watchContainer = Color(0xFFFFF0D1);
  static const Color onWatchContainer = Color(0xFF4A3108);

  static const Color risky = Color(0xFFC35F19);
  static const Color riskyContainer = Color(0xFFFFE4D2);
  static const Color onRiskyContainer = Color(0xFF552405);

  static const Color critical = Color(0xFFBA1A1A);
  static const Color criticalContainer = Color(0xFFFFDAD6);
  static const Color onCriticalContainer = Color(0xFF93000A);

  static const Color unrecoverable = Color(0xFF761A1A);
  static const Color unrecoverableContainer = Color(0xFFF8D8D8);
  static const Color onUnrecoverableContainer = Color(0xFF460707);

  static const Color information = Color(0xFF4755B6);
  static const Color informationContainer = Color(0xFFDFE0FF);
  static const Color onInformationContainer = Color(0xFF000D5F);

  // Dark Palette Tokens
  static const Color darkBackground = Color(0xFF111318);
  static const Color darkSurface = Color(0xFF1C1F26);
  static const Color darkSurfaceContainerLow = Color(0xFF181B21);
  static const Color darkSurfaceContainer = Color(0xFF20232A);
  static const Color darkSurfaceContainerHigh = Color(0xFF272A32);
  static const Color darkSurfaceContainerHighest = Color(0xFF30343D);

  static const Color darkOnSurface = Color(0xFFE4E2EA);
  static const Color darkOnSurfaceVariant = Color(0xFFC7C5D0);
  static const Color darkOutline = Color(0xFF90909E);
  static const Color darkOutlineVariant = Color(0xFF454650);

  static const Color darkPrimary = Color(0xFFBBC3FF);
  static const Color darkOnPrimary = Color(0xFF10227F);
  static const Color darkPrimaryContainer = Color(0xFF303F9F);
  static const Color darkOnPrimaryContainer = Color(0xFFDFE0FF);

  static const Color darkSecondary = Color(0xFFC6BFFF);
  static const Color darkOnSecondary = Color(0xFF2C178F);
  static const Color darkSecondaryContainer = Color(0xFF4130AC);
  static const Color darkOnSecondaryContainer = Color(0xFFE4DFFF);

  static const Color darkTertiary = Color(0xFF65DD9D);
  static const Color darkOnTertiary = Color(0xFF00391F);
  static const Color darkTertiaryContainer = Color(0xFF005231);
  static const Color darkOnTertiaryContainer = Color(0xFF82FAB7);

  static const Color darkError = Color(0xFFFFB4AB);
  static const Color darkOnError = Color(0xFF690005);
  static const Color darkErrorContainer = Color(0xFF93000A);
  static const Color darkOnErrorContainer = Color(0xFFFFDAD6);

  static const Color darkCardBorder = Color(0xFF30343D);

  // Dark Functional Status Colors
  static const Color darkSafe = Color(0xFF65DD9D);
  static const Color darkSafeContainer = Color(0xFF005231);
  static const Color darkOnSafeContainer = Color(0xFF82FAB7);

  static const Color darkWatch = Color(0xFFE5B869);
  static const Color darkWatchContainer = Color(0xFF513A00);
  static const Color darkOnWatchContainer = Color(0xFFFFE0A8);

  static const Color darkRisky = Color(0xFFFFB68D);
  static const Color darkRiskyContainer = Color(0xFF6B3100);
  static const Color darkOnRiskyContainer = Color(0xFFFFDBC8);

  static const Color darkCritical = Color(0xFFFFB4AB);
  static const Color darkCriticalContainer = Color(0xFF93000A);
  static const Color darkOnCriticalContainer = Color(0xFFFFDAD6);

  static const Color darkUnrecoverable = Color(0xFFFFB4B4);
  static const Color darkUnrecoverableContainer = Color(0xFF680005);
  static const Color darkOnUnrecoverableContainer = Color(0xFFFFDAD6);

  static const Color darkInformation = Color(0xFFBBC3FF);
  static const Color darkInformationContainer = Color(0xFF303F9F);
  static const Color darkOnInformationContainer = Color(0xFFDFE0FF);
}

/// Theme extension for Aster functional status colors.
@immutable
class AsterStatusColors extends ThemeExtension<AsterStatusColors> {
  final Color safe;
  final Color safeContainer;
  final Color onSafeContainer;

  final Color watch;
  final Color watchContainer;
  final Color onWatchContainer;

  final Color risky;
  final Color riskyContainer;
  final Color onRiskyContainer;

  final Color critical;
  final Color criticalContainer;
  final Color onCriticalContainer;

  final Color unrecoverable;
  final Color unrecoverableContainer;
  final Color onUnrecoverableContainer;

  final Color information;
  final Color informationContainer;
  final Color onInformationContainer;

  const AsterStatusColors({
    required this.safe,
    required this.safeContainer,
    required this.onSafeContainer,
    required this.watch,
    required this.watchContainer,
    required this.onWatchContainer,
    required this.risky,
    required this.riskyContainer,
    required this.onRiskyContainer,
    required this.critical,
    required this.criticalContainer,
    required this.onCriticalContainer,
    required this.unrecoverable,
    required this.unrecoverableContainer,
    required this.onUnrecoverableContainer,
    required this.information,
    required this.informationContainer,
    required this.onInformationContainer,
  });

  static const AsterStatusColors light = AsterStatusColors(
    safe: AsterColors.safe,
    safeContainer: AsterColors.safeContainer,
    onSafeContainer: AsterColors.onSafeContainer,
    watch: AsterColors.watch,
    watchContainer: AsterColors.watchContainer,
    onWatchContainer: AsterColors.onWatchContainer,
    risky: AsterColors.risky,
    riskyContainer: AsterColors.riskyContainer,
    onRiskyContainer: AsterColors.onRiskyContainer,
    critical: AsterColors.critical,
    criticalContainer: AsterColors.criticalContainer,
    onCriticalContainer: AsterColors.onCriticalContainer,
    unrecoverable: AsterColors.unrecoverable,
    unrecoverableContainer: AsterColors.unrecoverableContainer,
    onUnrecoverableContainer: AsterColors.onUnrecoverableContainer,
    information: AsterColors.information,
    informationContainer: AsterColors.informationContainer,
    onInformationContainer: AsterColors.onInformationContainer,
  );

  static const AsterStatusColors dark = AsterStatusColors(
    safe: AsterColors.darkSafe,
    safeContainer: AsterColors.darkSafeContainer,
    onSafeContainer: AsterColors.darkOnSafeContainer,
    watch: AsterColors.darkWatch,
    watchContainer: AsterColors.darkWatchContainer,
    onWatchContainer: AsterColors.darkOnWatchContainer,
    risky: AsterColors.darkRisky,
    riskyContainer: AsterColors.darkRiskyContainer,
    onRiskyContainer: AsterColors.darkOnRiskyContainer,
    critical: AsterColors.darkCritical,
    criticalContainer: AsterColors.darkCriticalContainer,
    onCriticalContainer: AsterColors.darkOnCriticalContainer,
    unrecoverable: AsterColors.darkUnrecoverable,
    unrecoverableContainer: AsterColors.darkUnrecoverableContainer,
    onUnrecoverableContainer: AsterColors.darkOnUnrecoverableContainer,
    information: AsterColors.darkInformation,
    informationContainer: AsterColors.darkInformationContainer,
    onInformationContainer: AsterColors.darkOnInformationContainer,
  );

  @override
  AsterStatusColors copyWith({
    Color? safe,
    Color? safeContainer,
    Color? onSafeContainer,
    Color? watch,
    Color? watchContainer,
    Color? onWatchContainer,
    Color? risky,
    Color? riskyContainer,
    Color? onRiskyContainer,
    Color? critical,
    Color? criticalContainer,
    Color? onCriticalContainer,
    Color? unrecoverable,
    Color? unrecoverableContainer,
    Color? onUnrecoverableContainer,
    Color? information,
    Color? informationContainer,
    Color? onInformationContainer,
  }) {
    return AsterStatusColors(
      safe: safe ?? this.safe,
      safeContainer: safeContainer ?? this.safeContainer,
      onSafeContainer: onSafeContainer ?? this.onSafeContainer,
      watch: watch ?? this.watch,
      watchContainer: watchContainer ?? this.watchContainer,
      onWatchContainer: onWatchContainer ?? this.onWatchContainer,
      risky: risky ?? this.risky,
      riskyContainer: riskyContainer ?? this.riskyContainer,
      onRiskyContainer: onRiskyContainer ?? this.onRiskyContainer,
      critical: critical ?? this.critical,
      criticalContainer: criticalContainer ?? this.criticalContainer,
      onCriticalContainer: onCriticalContainer ?? this.onCriticalContainer,
      unrecoverable: unrecoverable ?? this.unrecoverable,
      unrecoverableContainer:
          unrecoverableContainer ?? this.unrecoverableContainer,
      onUnrecoverableContainer:
          onUnrecoverableContainer ?? this.onUnrecoverableContainer,
      information: information ?? this.information,
      informationContainer: informationContainer ?? this.informationContainer,
      onInformationContainer:
          onInformationContainer ?? this.onInformationContainer,
    );
  }

  @override
  AsterStatusColors lerp(ThemeExtension<AsterStatusColors>? other, double t) {
    if (other is! AsterStatusColors) return this;
    return AsterStatusColors(
      safe: Color.lerp(safe, other.safe, t)!,
      safeContainer: Color.lerp(safeContainer, other.safeContainer, t)!,
      onSafeContainer: Color.lerp(onSafeContainer, other.onSafeContainer, t)!,
      watch: Color.lerp(watch, other.watch, t)!,
      watchContainer: Color.lerp(watchContainer, other.watchContainer, t)!,
      onWatchContainer: Color.lerp(
        onWatchContainer,
        other.onWatchContainer,
        t,
      )!,
      risky: Color.lerp(risky, other.risky, t)!,
      riskyContainer: Color.lerp(riskyContainer, other.riskyContainer, t)!,
      onRiskyContainer: Color.lerp(
        onRiskyContainer,
        other.onRiskyContainer,
        t,
      )!,
      critical: Color.lerp(critical, other.critical, t)!,
      criticalContainer: Color.lerp(
        criticalContainer,
        other.criticalContainer,
        t,
      )!,
      onCriticalContainer: Color.lerp(
        onCriticalContainer,
        other.onCriticalContainer,
        t,
      )!,
      unrecoverable: Color.lerp(unrecoverable, other.unrecoverable, t)!,
      unrecoverableContainer: Color.lerp(
        unrecoverableContainer,
        other.unrecoverableContainer,
        t,
      )!,
      onUnrecoverableContainer: Color.lerp(
        onUnrecoverableContainer,
        other.onUnrecoverableContainer,
        t,
      )!,
      information: Color.lerp(information, other.information, t)!,
      informationContainer: Color.lerp(
        informationContainer,
        other.informationContainer,
        t,
      )!,
      onInformationContainer: Color.lerp(
        onInformationContainer,
        other.onInformationContainer,
        t,
      )!,
    );
  }
}
