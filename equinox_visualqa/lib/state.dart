import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';

class AppState {
  static StyleData theme = EqThemes.defaultLightTheme;
  static bool isDark = false;
  static VoidCallback _subscriber;

  static toggleTheme() {
    if (!AppState.isDark) {
      AppState.theme = EqThemes.defaultDarkTheme;
    } else {
      AppState.theme = EqThemes.defaultLightTheme;
    }
    AppState.isDark = !AppState.isDark;
    _subscriber();
  }

  static subscribe(VoidCallback method) {
    _subscriber = method;
  }
}
