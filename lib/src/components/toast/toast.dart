import 'package:equinox/equinox.dart';
import 'package:equinox/src/theme/utils.dart';
import 'package:flutter/widgets.dart';

export 'package:equinox/src/components/toast/toast_data.dart';
import 'package:equinox/src/components/toast/toast_reveal.dart';
export 'package:equinox/src/components/toast/toast_style.dart';

class EqToastWidget extends StatefulWidget {
  final EqToast data;
  final VoidCallback serviceRemoveToastCallback;
  final EdgeInsets padding;

  const EqToastWidget({
    Key key,
    this.data,
    this.serviceRemoveToastCallback,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  _EqToastWidgetState createState() => _EqToastWidgetState();
}

class _EqToastWidgetState extends State<EqToastWidget>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  bool revealing = true;

  @override
  void didChangeDependencies() {
    final style = StaticStyle.of(context);
    if (controller == null) {
      controller = AnimationController(
        vsync: this,
        duration: style.get('minor-animation-duration'),
      );
      animation = CurvedAnimation(
        curve: style.get('minor-animation-curve'),
        parent: controller,
      );
      controller.addListener(() {
        if (!mounted) return;
        setState(() {});
      });
      controller.forward();

      Future.delayed(widget.data.duration, hide);
    } else {
      controller.duration = style.get('minor-animation-duration');
    }

    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(EqToastWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  void hide() {
    if (mounted && revealing) {
      revealing = false;
      controller.reverse(from: 1.0);
      Future.delayed(controller.duration, widget.serviceRemoveToastCallback);
      setState(() {});
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  void onTap(BuildContext context) {
    if (widget.data.onTap != null) widget.data.onTap();
    hide();
  }

  @override
  Widget build(BuildContext context) {
    final style = StaticStyle.of(context);

    final statusSelector = [
      'toast',
      widget.data.status,
    ];
    final borderRadius = BorderRadius.all(EqWidgetShapeUtils.getRadius(
      style: style.style,
    ));

    return Opacity(
      opacity: (!revealing) ? animation.value : 1.0,
      child: Align(
        heightFactor: (!revealing) ? animation.value : 1.0,
        widthFactor: 1.0,
        child: Padding(
          padding: widget.padding,
          child: AnimatedContainer(
            duration: style.get('minor-animation-duration'),
            curve: style.get('minor-animation-curve'),
            decoration: BoxDecoration(
              color: style.get(
                  generateSelector([...statusSelector, 'background-color'])),
              boxShadow: [style.get('toast-shadow')],
              borderRadius: borderRadius,
            ),
            child: (revealing)
                ? ToastRevealAnimationWidget(
                    animation: animation,
                    outlineWidth: style.get('outline-width'),
                    child: _EqToastBody(
                      data: widget.data,
                      onTap: () => onTap(context),
                    ),
                  )
                : _EqToastBody(
                    data: widget.data,
                    onTap: () => onTap(context),
                  ),
          ),
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
    final style = StaticStyle.of(context);
    final foregroundColor = style.get(
        generateSelector(['toast', widget.data.status, 'foreground-color']));

    final borderRadius = BorderRadius.all(EqWidgetShapeUtils.getRadius(
      style: style.style,
    ));

    var screenSize = MediaQuery.of(context).size;
    return OutlinedWidget(
      outlined: outlined,
      borderRadius: borderRadius,
      child: OutlinedGestureDetector(
        onOutlineChange: (v) {
          if (!mounted) return;
          setState(() => outlined = v);
        },
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
                  decoration: BoxDecoration(
                    borderRadius: borderRadius,
                    color: Colors.white,
                  ),
                  padding: style.get('toast-icon-padding'),
                  child: EqIcon(
                    icon: widget.data.icon,
                    color: foregroundColor,
                    size: style.get('toast-icon-size'),
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
                      style: TextStyle(
                        fontFamily: style.get('toast-title-font-family'),
                        fontSize: style.get('toast-title-font-size'),
                        fontWeight: style.get('toast-title-font-weight'),
                        color: foregroundColor,
                      ),
                    ),
                    if (widget.data.subtitle != null)
                      Text(
                        widget.data.subtitle,
                        style: TextStyle(
                          fontFamily: style.get('toast-subtitle-font-family'),
                          fontSize: style.get('toast-subtitle-font-size'),
                          fontWeight: style.get('toast-subtitle-font-weight'),
                          color: foregroundColor,
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
