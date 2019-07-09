import 'package:equinox/equinox.dart';
import 'package:equinox/src/components/button/button_theme.dart';
import 'package:flutter/widgets.dart';

/// Controls the [EqButtonThemeData]. Uses `InheritedWidget`, so changes will propogate
/// down the tree automatically.
class EqButtonTheme extends StatelessWidget {
  /// A theme to apply to the buttons. See [EqButtonThemeData] for more info.
  final EqButtonThemeData theme;

  /// A child
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
