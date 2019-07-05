import 'package:eva_design_flutter/eva_design_flutter.dart';
import 'package:flutter/material.dart' as MaterialDesign;
import 'package:flutter/widgets.dart';

class EqInternalCard extends StatelessWidget {
  final Widget child;
  final BorderRadius borderRadius;

  const EqInternalCard({
    Key key,
    @required this.child,
    this.borderRadius = BorderRadius.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = EqTheme.of(context);

    var backgroundColor = theme.backgroundBasicColors.color1;

    return AnimatedContainer(
      duration: theme.minorAnimationDuration,
      curve: theme.minorAnimationCurve,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: [theme.shadow],
        color: backgroundColor,
      ),
      child: MaterialDesign.Material(
        type: MaterialDesign.MaterialType.transparency,
        child: child,
      ),
    );
  }
}
