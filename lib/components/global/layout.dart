import 'package:eva_design_flutter/components/global/theming.dart';
import 'package:eva_design_flutter/data/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EqLayout extends StatefulWidget {
  final EqThemeData theme;
  final Widget child;

  const EqLayout({Key key, this.theme, this.child}) : super(key: key);
  @override
  _EqLayoutState createState() => _EqLayoutState();
}

class _EqLayoutState extends State<EqLayout> {
  @override
  Widget build(BuildContext context) {
    return EqTheme(
      theme: widget.theme,
      child: Container(
        color: widget.theme.backgroundBasicColors.color1,
        child: widget.child,
      ),
    );
  }
}