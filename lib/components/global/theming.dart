import 'package:eva_design_flutter/data/color_group.dart';
import 'package:eva_design_flutter/data/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class EqTheme extends StatelessWidget {
  final EqThemeData theme;
  final Widget child;

  static EqThemeData of(BuildContext context) {
    final InheritedEqTheme inheritedTheme = context.inheritFromWidgetOfExactType(InheritedEqTheme);
    return inheritedTheme.theme;
  }


  const EqTheme({Key key, this.theme, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InheritedEqTheme(child: child, theme: theme);
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
