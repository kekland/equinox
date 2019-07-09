
import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';

class AppState {
  static EqThemeData theme = EqThemes.defaultTheme;
  static VoidCallback _subscriber;

  static toggleTheme() {
    if(theme == EqThemes.defaultTheme) theme = EqThemes.darkTheme;
    else theme = EqThemes.defaultTheme;
    _subscriber();
  }

  static subscribe(VoidCallback method) {
    _subscriber = method;
  }
}