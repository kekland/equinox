import 'package:equinox/equinox.dart';
import 'package:equinox_visualqa/theme.dart';
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
    print('ayy');
    print(EqThemes.defaultLightTheme.get('background-basic-color-1'));
    print(EqThemes.defaultDarkTheme.get('background-basic-color-1'));
    print(AppState.theme.get('background-basic-color-1'));
    AppState.isDark = !AppState.isDark;
    _subscriber();
  }

  static subscribe(VoidCallback method) {
    _subscriber = method;
  }
}
