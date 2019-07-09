import 'package:equinox/equinox.dart';
import 'package:equinox/src/components/button/button_theme.dart';
import 'package:flutter/widgets.dart';

/// Controls the [EqTextFieldThemeData]. Uses `InheritedWidget`, so changes will propogate
/// down the tree automatically.
class EqTextFieldTheme extends StatelessWidget {
  /// A theme to apply to the TextFieldes. See [EqTextFieldThemeData] for more info.
  final EqTextFieldThemeData theme;

  /// A child
  final Widget child;

  static EqTextFieldThemeData of(BuildContext context) {
    final InheritedEqTextFieldTheme inheritedTheme =
        context.inheritFromWidgetOfExactType(InheritedEqTextFieldTheme);
    return inheritedTheme?.theme;
  }

  const EqTextFieldTheme({Key key, this.theme, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InheritedEqTextFieldTheme(
      theme: theme,
      child: child,
    );
  }
}

class InheritedEqTextFieldTheme extends InheritedWidget {
  final EqTextFieldThemeData theme;
  final Widget child;

  InheritedEqTextFieldTheme({Key key, this.theme, this.child})
      : assert(theme != null),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedEqTextFieldTheme oldWidget) =>
      this.theme != oldWidget.theme;
}
