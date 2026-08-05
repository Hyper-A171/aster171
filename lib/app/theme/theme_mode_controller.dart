import 'package:flutter/material.dart';

/// Controller for managing active application theme mode (system, light, dark).
class ThemeModeController extends ValueNotifier<ThemeMode> {
  ThemeModeController([super.initialMode = ThemeMode.system]);

  static final ThemeModeController instance = ThemeModeController();

  ThemeMode get themeMode => value;

  void setThemeMode(ThemeMode mode) {
    if (value != mode) {
      value = mode;
    }
  }

  void toggleTheme() {
    if (value == ThemeMode.dark) {
      value = ThemeMode.light;
    } else {
      value = ThemeMode.dark;
    }
  }

  void setSystem() => value = ThemeMode.system;
  void setLight() => value = ThemeMode.light;
  void setDark() => value = ThemeMode.dark;
}
