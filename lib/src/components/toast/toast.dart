import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';

export 'package:equinox/src/components/toast/toast_data.dart';
export 'package:equinox/src/components/toast/toast_reveal.dart';

class EqToastWidget extends StatefulWidget {
  final EqToast data;

  const EqToastWidget({Key key, this.data}) : super(key: key);

  @override
  _EqToastWidgetState createState() => _EqToastWidgetState();
}

class _EqToastWidgetState extends State<EqToastWidget>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void didChangeDependencies() {
    var theme = EqTheme.of(context);
    if (controller == null) {
      controller = AnimationController(
        vsync: this,
        duration: theme.majorAnimationDuration,
      );
      animation = CurvedAnimation(
        curve: theme.majorAnimationCurve,
        parent: controller,
      );
      controller.addListener(() => setState(() {}));
      controller.forward();
    } else {
      controller.duration = theme.majorAnimationDuration;
    }

    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = EqTheme.of(context);
    var backgroundColor =
        theme.getColorsForStatus(status: widget.data.status).shade500;
    var borderRadius =
        WidgetShapeUtils.getMultiplier(shape: widget.data.shape) *
            theme.borderRadius;

    return AnimatedContainer(
      duration: theme.minorAnimationDuration,
      curve: theme.minorAnimationCurve,
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: [theme.shadow],
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ToastRevealAnimationWidget(
        animation: animation,
        outlineWidth: theme.outlineWidth,
        child: _EqToastBody(
          data: widget.data,
          onTap: widget.data.onTap,
        ),
      ),
    );
  }
}

class _EqToastBody extends StatefulWidget {
  final EqToast data;
  final VoidCallback onTap;

  const _EqToastBody({
    Key key,
    this.data,
    this.onTap,
  }) : super(key: key);

  @override
  __EqToastBodyState createState() => __EqToastBodyState();
}

class __EqToastBodyState extends State<_EqToastBody> {
  bool outlined = false;
  @override
  Widget build(BuildContext context) {
    var theme = EqTheme.of(context);
    var textColor = theme.textControlColor;
    var subtitleColor = theme.textControlColor;
    var borderRadius =
        WidgetShapeUtils.getMultiplier(shape: widget.data.shape) *
            theme.borderRadius;

    var iconContainerColor =
        theme.getColorsForStatus(status: widget.data.status).shade700;

    var screenSize = MediaQuery.of(context).size;
    return OutlinedWidget(
      outlined: outlined,
      borderRadius: BorderRadius.circular(borderRadius),
      child: OutlinedGestureDetector(
        onOutlineChange: (v) => setState(() => outlined = v),
        onTap: widget.onTap,
        child: Container(
          constraints: BoxConstraints(
            minWidth: screenSize.width * 0.5,
            maxWidth: screenSize.width * 0.8,
          ),
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (widget.data.icon != null) ...[
                Container(
                  width: 36.0,
                  height: 36.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius),
                    color: iconContainerColor,
                  ),
                  child: Icon(
                    widget.data.icon,
                    color: textColor,
                  ),
                ),
                SizedBox(width: 16.0),
              ],
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      widget.data.message,
                      style: theme.subtitle1.textStyle.copyWith(
                        color: textColor,
                        height: 1.0,
                      ),
                    ),
                    if (widget.data.subtitle != null)
                      Text(
                        widget.data.subtitle,
                        style: theme.paragraph1.textStyle.copyWith(
                          color: subtitleColor,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
