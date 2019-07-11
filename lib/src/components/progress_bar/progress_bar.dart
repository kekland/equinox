import 'package:equinox/equinox.dart';
export 'package:equinox/src/components/progress_bar/progress_bar_theme.dart';
import 'package:equinox/src/model/params.dart';
import 'package:flutter/widgets.dart';

/// EqProgressBar is used to show a progress of some event. Use [EqProgressBarThemeData] to style this globally.
class EqProgressBar extends StatefulWidget {
  /// Current value of the progress. Change this to animate the widget.
  final double value;

  /// Status changes the color.
  final EqWidgetStatus status;

  /// Size controls the size of the progress.
  final EqWidgetSize size;

  /// Size controls the borderRadius of the progress.
  final EqWidgetShape shape;

  /// Text is displayed inside of the progress. Not visible at all times. Optional.
  final String text;

  /// Color overwrites the color set by [status]. Use it if you, for example, want to animate the color.
  final Color color;

  const EqProgressBar({
    Key key,
    @required this.value,
    this.status,
    this.color,
    this.text,
    this.shape,
    this.size,
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

  EqProgressBarThemeData getThemeData(BuildContext context) {
    final theme = EqTheme.of(context);
    EqProgressBarThemeData themeData =
        theme.defaultProgressBarTheme ?? EqProgressBarThemeData();

    return themeData.copyWith(
      status: widget.status,
      shape: widget.shape,
      size: widget.size,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = EqTheme.of(context);
    final themeData = getThemeData(context);

    final height = themeData.getHeight();
    final borderRadius = themeData.getBorderRadius(theme: theme);
    final backgroundColor = themeData.getBackgroundColor(theme: theme);
    final progressColor =
        widget.color ?? themeData.getProgressColor(theme: theme);
    final textStyle =
        themeData.getTextStyle(theme: theme).copyWith(color: Colors.white);

    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: backgroundColor,
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
              height: height,
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                color: progressColor,
              ),
              child: widget.text != null
                  ? Center(
                      child: Text(
                        widget.text,
                        style: textStyle,
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
