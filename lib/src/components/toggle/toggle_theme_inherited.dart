import 'package:equinox/equinox.dart';
import 'package:equinox/src/components/button/button_theme.dart';
import 'package:flutter/widgets.dart';

/// Controls the [EqChecboxThemeData]. Uses `InheritedWidget`, so changes will propogate
/// down the tree automatically.
class EqToggleTheme extends StatelessWidget {
  /// A theme to apply to the Togglees. See [EqToggleThemeData] for more info.
  final EqToggleThemeData theme;

  /// A child
  final Widget child;

  static EqToggleThemeData of(BuildContext context) {
    final InheritedEqToggleTheme inheritedTheme =
        context.inheritFromWidgetOfExactType(InheritedEqToggleTheme);
    return inheritedTheme?.theme;
  }

  const EqToggleTheme({Key key, this.theme, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InheritedEqToggleTheme(
      theme: theme,
      child: child,
    );
  }
}

class InheritedEqToggleTheme extends InheritedWidget {
  final EqToggleThemeData theme;
  final Widget child;

  InheritedEqToggleTheme({Key key, this.theme, this.child})
      : assert(theme != null),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedEqToggleTheme oldWidget) =>
      this.theme != oldWidget.theme;
}
