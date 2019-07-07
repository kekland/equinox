import 'dart:math';
import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';
export 'package:equinox/components/spinner/spinner_painter.dart';

class EqSpinner extends StatefulWidget {
  final WidgetStatus status;
  final WidgetSize size;

  const EqSpinner({
    Key key,
    this.status = WidgetStatus.primary,
    this.size = WidgetSize.medium,
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

  double getSize() {
    switch (widget.size) {
      case WidgetSize.giant:
        return 40.0;
      case WidgetSize.large:
        return 36.0;
      case WidgetSize.medium:
        return 32.0;
      case WidgetSize.small:
        return 28.0;
      case WidgetSize.tiny:
        return 24.0;
      default:
        return 24.0;
    }
  }

  double getStrokeWidth() {
    switch (widget.size) {
      case WidgetSize.giant:
        return 7.0;
      case WidgetSize.large:
        return 6.0;
      case WidgetSize.medium:
        return 5.0;
      case WidgetSize.small:
        return 4.0;
      case WidgetSize.tiny:
        return 3.0;
      default:
        return 5.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = EqTheme.of(context);
    double size = getSize();
    var color = theme.getColorsForStatus(status: widget.status).shade500;

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
                strokeWidth: getStrokeWidth(),
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
