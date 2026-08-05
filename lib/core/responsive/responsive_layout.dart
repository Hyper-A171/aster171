import 'package:flutter/material.dart';
import 'aster_breakpoints.dart';

/// Builder widget that renders different layouts according to current screen breakpoint.
class ResponsiveLayout extends StatelessWidget {
  final WidgetBuilder mobile;
  final WidgetBuilder? tablet;
  final WidgetBuilder? desktop;

  const ResponsiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= AsterBreakpoints.desktopMin &&
            desktop != null) {
          return desktop!(context);
        }
        if (constraints.maxWidth >= AsterBreakpoints.tabletMin &&
            tablet != null) {
          return tablet!(context);
        }
        return mobile(context);
      },
    );
  }
}

/// Helper extension on BuildContext for quick responsive queries.
extension ResponsiveContextX on BuildContext {
  bool get isMobile => AsterBreakpoints.isMobile(this);
  bool get isTablet => AsterBreakpoints.isTablet(this);
  bool get isDesktop => AsterBreakpoints.isDesktop(this);

  double get sideMargin => isMobile ? 16.0 : 24.0;
}
