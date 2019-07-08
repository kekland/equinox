import 'package:equinox/equinox.dart';
import 'package:equinox/src/model/params.dart';
import 'package:flutter/widgets.dart';

class EqProgressBar extends StatefulWidget {
  final double value;
  final WidgetStatus status;
  final WidgetSize size;
  final WidgetShape shape;
  final String text;
  final Color color;

  const EqProgressBar({
    Key key,
    @required this.value,
    this.status = WidgetStatus.primary,
    this.color,
    this.text,
    this.shape = WidgetShape.rectangle,
    this.size = WidgetSize.medium,
  }) : super(key: key);
  @override
  _EqProgressBarState createState() => _EqProgressBarState();
}

class _EqProgressBarState extends State<EqProgressBar>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  double value;

  didUpdateWidget(EqProgressBar oldWidget) {
    if (oldWidget.value != widget.value) {
      value = widget.value;
      double diff = (controller.value - value).abs();
      controller.animateTo(widget.value, duration: controller.duration * diff);
    }
    super.didUpdateWidget(oldWidget);
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }

  didChangeDependencies() {
    var theme = EqTheme.of(context);
    if (controller == null) {
      controller = AnimationController(
          vsync: this, duration: theme.minorAnimationDuration);

      controller.value = widget.value;
      animation = CurvedAnimation(parent: controller, curve: Curves.linear);
    } else {
      controller.duration = theme.minorAnimationDuration;
    }

    super.didChangeDependencies();
  }

  double _getHeight() {
    switch (widget.size) {
      case WidgetSize.giant:
        return 28.0;
      case WidgetSize.large:
        return 24.0;
      case WidgetSize.medium:
        return 22.0;
      case WidgetSize.small:
        return 20.0;
      case WidgetSize.tiny:
        return 16.0;
      default:
        return 22.0;
    }
  }

  TextStyle _getTextStyle(EqThemeData theme) {
    switch (widget.size) {
      case WidgetSize.giant:
        return theme.subtitle1.textStyle.copyWith(height: 1.0);
      case WidgetSize.large:
        return theme.subtitle1.textStyle.copyWith(height: 1.0);
      case WidgetSize.medium:
        return theme.subtitle1.textStyle.copyWith(height: 1.0);
      case WidgetSize.small:
        return theme.subtitle2.textStyle.copyWith(height: 1.0);
      case WidgetSize.tiny:
        return theme.subtitle2.textStyle.copyWith(height: 1.0);
      default:
        return theme.subtitle1.textStyle.copyWith(height: 1.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = EqTheme.of(context);
    var borderRadius = theme.borderRadius *
        WidgetShapeUtils.getMultiplier(shape: widget.shape);
    return Container(
      width: double.infinity,
      height: _getHeight(),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: theme.backgroundBasicColors.color3,
      ),
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, _) {
          return FractionallySizedBox(
            widthFactor: animation.value,
            heightFactor: 1.0,
            alignment: Alignment.centerLeft,
            child: AnimatedContainer(
              duration: theme.minorAnimationDuration,
              curve: theme.minorAnimationCurve,
              height: _getHeight(),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                color: (widget.color == null)
                    ? theme.getColorsForStatus(status: widget.status).shade500
                    : widget.color,
              ),
              child: widget.text != null
                  ? Center(
                      child: Text(
                        widget.text,
                        style: _getTextStyle(theme).copyWith(color: Colors.white),
                      ),
                    )
                  : null,
            ),
          );
        },
      ),
    );
  }
}
