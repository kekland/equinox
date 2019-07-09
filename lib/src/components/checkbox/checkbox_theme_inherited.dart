import 'package:equinox/equinox.dart';
import 'package:equinox/src/components/button/button_theme.dart';
import 'package:flutter/widgets.dart';

/// Controls the [EqCheckboxThemeData]. Uses `InheritedWidget`, so changes will propogate
/// down the tree automatically.
class EqCheckboxTheme extends StatelessWidget {
  /// A theme to apply to the checkboxes. See [EqCheckboxThemeData] for more info.
  final EqCheckboxThemeData theme;

  /// A child
  final Widget child;

  static EqCheckboxThemeData of(BuildContext context) {
    final InheritedEqCheckboxTheme inheritedTheme =
        context.inheritFromWidgetOfExactType(InheritedEqCheckboxTheme);
    return inheritedTheme?.theme;
  }

  const EqCheckboxTheme({Key key, this.theme, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InheritedEqCheckboxTheme(
      theme: theme,
      child: child,
    );
  }
}

class InheritedEqCheckboxTheme extends InheritedWidget {
  final EqCheckboxThemeData theme;
  final Widget child;

  InheritedEqCheckboxTheme({Key key, this.theme, this.child})
      : assert(theme != null),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedEqCheckboxTheme oldWidget) =>
      this.theme != oldWidget.theme;
}
