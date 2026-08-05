import 'package:flutter/material.dart';

/// Reusable shadow definitions for Aster design system.
abstract class AsterShadows {
  /// Surface level 1 subtle elevation shadow.
  static const BoxShadow level1 = BoxShadow(
    offset: Offset(0, 2),
    blurRadius: 8.0,
    spreadRadius: 0.0,
    color: Color(0x0D000000), // 5% black opacity
  );

  /// Surface level 2 elevation shadow.
  static const BoxShadow level2 = BoxShadow(
    offset: Offset(0, 4),
    blurRadius: 12.0,
    spreadRadius: 0.0,
    color: Color(0x1A000000), // 10% black opacity
  );

  static const List<BoxShadow> level1List = [level1];
  static const List<BoxShadow> level2List = [level2];
  static const List<BoxShadow> none = [];
}
