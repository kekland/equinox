import 'package:equinox/equinox.dart';
import 'package:equinox/src/equinox_internal.dart';
import 'package:flutter/widgets.dart';
import 'package:vector_math/vector_math_64.dart' as VectorMath;

class OutlinedWidget extends StatefulWidget {
  final bool outlined;
  final Widget child;
  final Size predefinedSize;
  final BorderRadius borderRadius;
  final bool clipInner;

  const OutlinedWidget({
    Key key,
    @required this.outlined,
    @required this.child,
    this.predefinedSize,
    this.borderRadius,
    this.clipInner = true,
  }) : super(key: key);

  @override
  _OutlinedWidgetState createState() => _OutlinedWidgetState();
}

class _OutlinedWidgetState extends State<OutlinedWidget>
    with SingleTickerProviderStateMixin {
  GlobalKey itemKey = GlobalKey();
  Size itemSize;
  BorderRadius borderRadius;

  bool isFirstCallback = true;

  AnimationController animationController;
  Animation<double> animation;

  @override
  void didUpdateWidget(OutlinedWidget oldWidget) {
    if (widget.outlined) {
      animationController.forward();
    } else {
      if (animationController.lastElapsedDuration == null) {
        animationController.reverse();
      } else {
        Future.delayed(
          animationController.duration -
              animationController.lastElapsedDuration,
          animationController.reverse,
        );
      }
    }
    if (oldWidget.predefinedSize != widget.predefinedSize) {
      this.itemSize = widget.predefinedSize;
    }
    if (oldWidget.borderRadius != widget.borderRadius) {
      borderRadius = widget.borderRadius ?? BorderRadius.zero;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var animationDuration =
        StaticStyle.of(context).get('minor-animation-duration');

    if (animationController != null) {
      animationController.duration = animationDuration;
    } else {
      animationController =
          AnimationController(vsync: this, duration: animationDuration);
    }
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.decelerate);
  }

  @override
  void initState() {
    super.initState();
    itemSize = widget.predefinedSize;
    borderRadius = widget.borderRadius ?? BorderRadius.zero;
  }

  VectorMath.Vector3 calculateScaleVector(double outlineWidth) {
    var value = VectorMath.Vector3(
      2 * outlineWidth / itemSize.width,
      2 * outlineWidth / itemSize.height,
      0.0,
    );
    if (widget.clipInner) {
      return value * animation.value + VectorMath.Vector3.all(1.0);
    } else {
      return (value + VectorMath.Vector3.all(1.0)) * animation.value;
    }
  }

  Border calculateBorder(
      double outlineWidth, Color outlineColor, VectorMath.Vector3 scaleFactor) {
    var verticalBorderSide =
        BorderSide(color: outlineColor, width: outlineWidth / (scaleFactor.y));
    var horizontalBorderSide =
        BorderSide(color: outlineColor, width: outlineWidth / (scaleFactor.x));
    return Border(
      top: verticalBorderSide,
      bottom: verticalBorderSide,
      left: horizontalBorderSide,
      right: horizontalBorderSide,
    );
  }

  Widget _build(BuildContext context) {
    final theme = StaticStyle.of(context);
    final outlineWidth = theme.get('outline-width');
    final outlineColor = theme.get('outline-color');

    return Stack(
      fit: StackFit.passthrough,
      children: [
        if (itemSize != null)
          AnimatedBuilder(
              animation: animation,
              builder: (context, _) {
                final scaleFactor = calculateScaleVector(outlineWidth);
                return Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Opacity(
                      opacity: 1.0,
                      child: Transform(
                        transform: Matrix4.compose(
                          VectorMath.Vector3.zero(),
                          VectorMath.Quaternion.identity(),
                          scaleFactor,
                        ),
                        origin:
                            Offset(itemSize.width / 2.0, itemSize.height / 2.0),
                        child: (widget.clipInner)
                            ? ClipPath(
                                clipper: DoubleClipRRect(
                                  borderRadius: borderRadius,
                                  outilneVerticalWidth:
                                      (outlineWidth * animation.value) /
                                          scaleFactor.y,
                                  outlineHorizontalWidth:
                                      (outlineWidth * animation.value) /
                                          (scaleFactor.x),
                                ),
                                child: Container(
                                  width: itemSize.width,
                                  height: itemSize.height,
                                  decoration: BoxDecoration(
                                    color: outlineColor,
                                    borderRadius: borderRadius,
                                  ),
                                ),
                              )
                            : Container(
                                width: itemSize.width,
                                height: itemSize.height,
                                decoration: BoxDecoration(
                                  color: outlineColor,
                                  borderRadius: borderRadius,
                                ),
                              ),
                      ),
                    ),
                  ],
                );
              }),
        SizedBox(
          key: itemKey,
          child: widget.child,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.predefinedSize == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (isFirstCallback) {
          isFirstCallback = false;
          setState(() {});
        }
        if (itemKey.currentContext?.size != itemSize) {
          setState(() {});
        }
        itemSize = itemKey.currentContext?.size;
      });
    }
    return _build(context);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
