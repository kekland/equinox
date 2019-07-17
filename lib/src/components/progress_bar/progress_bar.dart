import 'package:equinox/equinox.dart';
import 'package:equinox/src/theme/utils.dart';
export 'package:equinox/src/components/progress_bar/progress_bar_style.dart';
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
    this.size = EqWidgetSize.medium,
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
    var style = StaticStyle.of(context);
    if (controller == null) {
      controller = AnimationController(
          vsync: this, duration: style.get('minor-animation-duration'));

      controller.value = widget.value;
      animation = CurvedAnimation(parent: controller, curve: Curves.linear);
    } else {
      controller.duration = style.get('minor-animatino-duration');
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final style = StaticStyle.of(context);

    final selectorBase = [
      'progress-bar',
      widget.status,
    ];

    final selectorSizeBase = [
      'progress-bar',
      widget.size,
    ];

    final height = style.get(generateSelector([...selectorSizeBase, 'height']));
    final borderRadius = BorderRadius.all(EqWidgetShapeUtils.getRadius(
      style: style.style,
      shape: widget.shape,
    ));

    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color:
            style.get(generateSelector([...selectorBase, 'background-color'])),
      ),
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, _) {
          return FractionallySizedBox(
            widthFactor: animation.value,
            heightFactor: 1.0,
            alignment: Alignment.centerLeft,
            child: AnimatedContainer(
              duration: style.get('minor-animation-duration'),
              curve: style.get('minor-animation-curve'),
              height: height,
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                color: style
                    .get(generateSelector([...selectorBase, 'progress-color'])),
              ),
              child: widget.text != null
                  ? Center(
                      child: Text(
                        widget.text,
                        style: TextStyle(
                          fontFamily: style.get(generateSelector(
                              [...selectorSizeBase, 'text-font-family'])),
                          fontSize: style.get(generateSelector(
                              [...selectorSizeBase, 'text-font-size'])),
                          fontWeight: style.get(generateSelector(
                              [...selectorSizeBase, 'text-font-weight'])),
                          color: style.get(generateSelector(
                              [...selectorBase, 'text-color'])),
                        ),
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
