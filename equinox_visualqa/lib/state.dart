
import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';

class AppState {
  static EqThemeData theme = Themes.defaultTheme;
  static VoidCallback _subscriber;

  static toggleTheme() {
    if(theme == Themes.defaultTheme) theme = Themes.darkTheme;
    else theme = Themes.defaultTheme;
    _subscriber();
  }

  static subscribe(VoidCallback method) {
    _subscriber = method;
  }
}