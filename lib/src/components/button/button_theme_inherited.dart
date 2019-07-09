import 'package:equinox/equinox.dart';
import 'package:equinox/src/components/button/button_theme.dart';
import 'package:flutter/widgets.dart';

class EqButtonTheme extends StatelessWidget {
  final EqButtonThemeData theme;
  final Widget child;

  static EqButtonThemeData of(BuildContext context) {
    final InheritedEqButtonTheme inheritedTheme =
        context.inheritFromWidgetOfExactType(InheritedEqButtonTheme);
    return inheritedTheme?.theme;
  }

  const EqButtonTheme({Key key, this.theme, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InheritedEqButtonTheme(
      theme: theme,
      child: child,
    );
  }
}

class InheritedEqButtonTheme extends InheritedWidget {
  final EqButtonThemeData theme;
  final Widget child;

  InheritedEqButtonTheme({Key key, this.theme, this.child})
      : assert(theme != null),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedEqButtonTheme oldWidget) =>
      this.theme != oldWidget.theme;
}
