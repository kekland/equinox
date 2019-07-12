
import 'package:equinox/equinox.dart';
import 'package:equinox_visualqa/theme.dart';
import 'package:flutter/widgets.dart';

class AppState {
  static StyleData theme = Theme.lightTheme;
  static bool isDark = false;
  static VoidCallback _subscriber;

  static toggleTheme() {
    if(!AppState.isDark) AppState.theme = Theme.darkTheme;
    else theme = Theme.lightTheme;
    AppState.isDark = !AppState.isDark;
    _subscriber();
  }

  static subscribe(VoidCallback method) {
    _subscriber = method;
  }
}