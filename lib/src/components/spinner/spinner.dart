import 'dart:math';
import 'package:equinox/equinox.dart';
import 'package:equinox/src/equinox_internal.dart';
export 'package:equinox/src/components/spinner/spinner_style.dart';
import 'package:flutter/widgets.dart';
import 'package:equinox/src/components/spinner/spinner_painter.dart';

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
    this.status = EqWidgetStatus.primary,
    this.size = EqWidgetSize.medium,
  }) : super(key: key);
  @override
  _EqSpinnerState createState() => _EqSpinnerState();
}

class _EqSpinnerState extends State<EqSpinner>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

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
    final style = StaticStyle.of(context);
    final size = style.get(generateSelector(['spinner', widget.size, 'size']));
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
                color: style.get(generateSelector(
                    ['spinner', widget.status, 'color'])),
                strokeWidth: style.get(
                    generateSelector(['spinner', widget.size, 'stroke-width'])),
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
