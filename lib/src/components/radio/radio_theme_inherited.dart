import 'package:equinox/equinox.dart';
import 'package:equinox/src/components/button/button_theme.dart';
import 'package:flutter/widgets.dart';

/// Controls the [EqRadioThemeData]. Uses `InheritedWidget`, so changes will propogate
/// down the tree automatically.
class EqRadioTheme extends StatelessWidget {
  /// A theme to apply to the Radioes. See [EqRadioThemeData] for more info.
  final EqRadioThemeData theme;

  /// A child
  final Widget child;

  static EqRadioThemeData of(BuildContext context) {
    final InheritedEqRadioTheme inheritedTheme =
        context.inheritFromWidgetOfExactType(InheritedEqRadioTheme);
    return inheritedTheme?.theme;
  }

  const EqRadioTheme({Key key, this.theme, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InheritedEqRadioTheme(
      theme: theme,
      child: child,
    );
  }
}

class InheritedEqRadioTheme extends InheritedWidget {
  final EqRadioThemeData theme;
  final Widget child;

  InheritedEqRadioTheme({Key key, this.theme, this.child})
      : assert(theme != null),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedEqRadioTheme oldWidget) =>
      this.theme != oldWidget.theme;
}
