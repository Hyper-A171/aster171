import 'package:flutter/material.dart';

/// Centralized border radius design tokens for Aster.
abstract class AsterRadius {
  static const double radiusSmall = 4.0;
  static const double radiusDefault = 8.0;
  static const double radiusMedium = 12.0;
  static const double radiusLarge = 16.0;
  static const double radiusExtraLarge = 24.0;
  static const double radiusFull = 9999.0;

  // Radius objects
  static const Radius rSmall = Radius.circular(radiusSmall);
  static const Radius rDefault = Radius.circular(radiusDefault);
  static const Radius rMedium = Radius.circular(radiusMedium);
  static const Radius rLarge = Radius.circular(radiusLarge);
  static const Radius rExtraLarge = Radius.circular(radiusExtraLarge);
  static const Radius rFull = Radius.circular(radiusFull);

  // BorderRadius objects
  static const BorderRadius borderSmall = BorderRadius.all(rSmall);
  static const BorderRadius borderDefault = BorderRadius.all(rDefault);
  static const BorderRadius borderMedium = BorderRadius.all(rMedium);
  static const BorderRadius borderLarge = BorderRadius.all(rLarge);
  static const BorderRadius borderExtraLarge = BorderRadius.all(rExtraLarge);
  static const BorderRadius borderFull = BorderRadius.all(rFull);

  // Component Specific Radius
  static const BorderRadius buttonBorderRadius = borderMedium; // 12px
  static const BorderRadius chipBorderRadius = borderDefault; // 8px
  static const BorderRadius pillChipBorderRadius = borderFull; // Fully rounded
  static const BorderRadius cardBorderRadius = borderLarge; // 16px
  static const BorderRadius fabBorderRadius = borderLarge; // 16px
  static const BorderRadius bottomSheetBorderRadius = BorderRadius.only(
    topLeft: rExtraLarge,
    topRight: rExtraLarge,
  ); // 24px top corners
}

/// Data class wrapper for BuildContext access via extension.
@immutable
class AsterRadiusData {
  const AsterRadiusData();

  double get radiusSmall => AsterRadius.radiusSmall;
  double get radiusDefault => AsterRadius.radiusDefault;
  double get radiusMedium => AsterRadius.radiusMedium;
  double get radiusLarge => AsterRadius.radiusLarge;
  double get radiusExtraLarge => AsterRadius.radiusExtraLarge;
  double get radiusFull => AsterRadius.radiusFull;

  BorderRadius get button => AsterRadius.buttonBorderRadius;
  BorderRadius get card => AsterRadius.cardBorderRadius;
  BorderRadius get fab => AsterRadius.fabBorderRadius;
  BorderRadius get bottomSheet => AsterRadius.bottomSheetBorderRadius;
}
