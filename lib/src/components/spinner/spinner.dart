import 'dart:math';
import 'package:equinox/equinox.dart';
export 'package:equinox/src/components/spinner/spinner_theme.dart';
import 'package:flutter/widgets.dart';
export 'package:equinox/src/components/spinner/spinner_painter.dart';

/// Spinners are used to show user that something is downloading or in progress.
/// To customize a spinner globally, you can use [EqThemeData.defaultSpinnerTheme] and
/// [EqSpinnerThemeData].
class EqSpinner extends StatefulWidget {
  /// Status of a spinner. Controls its color.
  final EqWidgetStatus status;

  /// Size of a spinner.
  final EqWidgetSize size;

  const EqSpinner({
    Key key,
    this.status,
    this.size,
  }) : super(key: key);
  @override
  _EqSpinnerState createState() => _EqSpinnerState();
}

class _EqSpinnerState extends State<EqSpinner>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  EqSpinnerThemeData getThemeData(BuildContext context) {
    final theme = EqTheme.of(context);
    EqSpinnerThemeData themeData =
        theme.defaultSpinnerTheme ?? EqSpinnerThemeData();

    return themeData.copyWith(
      status: widget.status,
      size: widget.size,
    );
  }

  initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));

    animation = CurvedAnimation(
        curve: Cubic(0.275, 0.725, 0.725, 0.275), parent: animationController);

    animationController.repeat(min: 0.0, max: 1.0);
  }

  dispose() {
    animationController.stop();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = EqTheme.of(context);
    final themeData = getThemeData(context);

    final size = themeData.getSize();
    final strokeWidth = themeData.getStrokeWidth();

    final color = themeData.getColor(theme: theme);

    return Center(
      widthFactor: 1.0,
      heightFactor: 1.0,
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, _) {
          return Transform.rotate(
            angle: animation.value * pi * 2.0,
            child: CustomPaint(
              painter: SpinnerPainter(
                color: color,
                strokeWidth: strokeWidth,
              ),
              isComplex: false,
              willChange: false,
              child: SizedBox(width: size, height: size),
            ),
          );
        },
      ),
    );
  }
}
