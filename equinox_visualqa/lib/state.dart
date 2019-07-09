
import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';

class AppState {
  static EqThemeData theme = EqThemes.defaultLightTheme;
  static VoidCallback _subscriber;

  static toggleTheme() {
    if(theme == EqThemes.defaultLightTheme) theme = EqThemes.defaultDarkTheme;
    else theme = EqThemes.defaultLightTheme;
    _subscriber();
  }

  static subscribe(VoidCallback method) {
    _subscriber = method;
  }
}