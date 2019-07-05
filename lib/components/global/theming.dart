import 'package:equinox/components/global/no_splash_factory.dart';
import 'package:equinox/components/global/scroll_behavior.dart';
import 'package:equinox/data/color_group.dart';
import 'package:equinox/data/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

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
    return Theme(
        data: ThemeData(
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
