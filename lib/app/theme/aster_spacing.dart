import 'package:flutter/material.dart';

/// Reusable spacing system based on a strict 8-point grid.
abstract class AsterSpacing {
  static const double spaceXs = 4.0;
  static const double spaceSm = 8.0;
  static const double spaceMd = 16.0;
  static const double spaceLg = 24.0;
  static const double spaceXl = 32.0;

  static const double mobileMargin = 16.0;
  static const double tabletMargin = 24.0;
  static const double gutter = 16.0;

  static const double minTouchTarget = 48.0;

  // Insets helpers
  static const EdgeInsets insetXs = EdgeInsets.all(spaceXs);
  static const EdgeInsets insetSm = EdgeInsets.all(spaceSm);
  static const EdgeInsets insetMd = EdgeInsets.all(spaceMd);
  static const EdgeInsets insetLg = EdgeInsets.all(spaceLg);
  static const EdgeInsets insetXl = EdgeInsets.all(spaceXl);

  static const EdgeInsets mobileMarginInsets = EdgeInsets.symmetric(
    horizontal: mobileMargin,
  );
  static const EdgeInsets tabletMarginInsets = EdgeInsets.symmetric(
    horizontal: tabletMargin,
  );
}

/// Data class wrapper for BuildContext access via extension.
@immutable
class AsterSpacingData {
  const AsterSpacingData();

  double get spaceXs => AsterSpacing.spaceXs;
  double get spaceSm => AsterSpacing.spaceSm;
  double get spaceMd => AsterSpacing.spaceMd;
  double get spaceLg => AsterSpacing.spaceLg;
  double get spaceXl => AsterSpacing.spaceXl;

  double get mobileMargin => AsterSpacing.mobileMargin;
  double get tabletMargin => AsterSpacing.tabletMargin;
  double get gutter => AsterSpacing.gutter;

  double get minTouchTarget => AsterSpacing.minTouchTarget;
}
