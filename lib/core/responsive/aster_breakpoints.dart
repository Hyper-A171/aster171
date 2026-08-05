import 'package:flutter/material.dart';

/// Screen size breakpoint thresholds for Aster responsive layouts.
abstract class AsterBreakpoints {
  static const double mobileMax = 599.0;
  static const double tabletMin = 600.0;
  static const double tabletMax = 1199.0;
  static const double desktopMin = 1200.0;

  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < tabletMin;

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return width >= tabletMin && width <= tabletMax;
  }

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= desktopMin;
}
