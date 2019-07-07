import 'package:equinox/equinox.dart';
import 'package:equinox/src/equinox_internal.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart' as MaterialDesign;

class EqTheme extends StatelessWidget {
  final EqThemeData theme;
  final Widget child;

  static EqThemeData of(BuildContext context) {
    final InheritedEqTheme inheritedTheme =
        context.inheritFromWidgetOfExactType(InheritedEqTheme);
    return inheritedTheme.theme;
  }

  const EqTheme({Key key, this.theme, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialDesign.Theme(
        data: MaterialDesign.ThemeData(
          splashFactory: const NoSplashFactory(),
        ),
        child: ScrollConfiguration(
          behavior: EquinoxScrollBehavior(),
          child: InheritedEqTheme(
            theme: theme,
            child: AnimatedDefaultTextStyle(
              duration: theme.majorAnimationDuration,
              curve: theme.majorAnimationCurve,
              style: TextStyle(color: theme.textBasicColor),
              child: child,
            ),
          ),
        ));
  }
}

class InheritedEqTheme extends InheritedWidget {
  final EqThemeData theme;
  final Widget child;

  InheritedEqTheme({Key key, this.theme, this.child})
      : assert(theme != null),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedEqTheme oldWidget) =>
      this.theme != oldWidget.theme;
}
