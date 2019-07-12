import 'package:equinox/equinox.dart';
import 'package:equinox/src/equinox_internal.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart' as MaterialDesign;

class EqTheme extends StatelessWidget {
  final StyleData theme;
  final Widget child;

  const EqTheme({Key key, this.theme, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialDesign.Theme(
        data: MaterialDesign.ThemeData(
          splashFactory: const NoSplashFactory(),
        ),
        child: ScrollConfiguration(
          behavior: EquinoxScrollBehavior(),
          child: StaticStyle(
            data: theme,
            child: AnimatedDefaultTextStyle(
              duration: theme.get('major-animation-duration'),
              curve: theme.get('major-animation-curve'),
              style: TextStyle(color: theme.get('text-basic-color')),
              child: child,
            ),
          ),
        ));
  }
}
