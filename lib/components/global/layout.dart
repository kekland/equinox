import 'package:eva_design_flutter/components/global/theming.dart';
import 'package:eva_design_flutter/data/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EqLayout extends StatefulWidget {
  final EqThemeData theme;
  final Widget child;
  final Widget appBar;

  const EqLayout({
    Key key,
    this.theme,
    @required this.child,
    this.appBar,
  }) : super(key: key);
  @override
  _EqLayoutState createState() => _EqLayoutState();
}

class _EqLayoutState extends State<EqLayout> {
  @override
  Widget build(BuildContext context) {
    return EqTheme(
      theme: widget.theme,
      child: AnimatedDefaultTextStyle(
        duration: widget.theme.majorAnimationDuration,
        curve: widget.theme.majorAnimationCurve,
        style: TextStyle(color: widget.theme.textBasicColor),
        child: AnimatedContainer(
          duration: widget.theme.majorAnimationDuration,
          curve: widget.theme.majorAnimationCurve,
          color: widget.theme.backgroundBasicColors.color3,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (widget.appBar != null) widget.appBar,
              Expanded(
                child: widget.child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
