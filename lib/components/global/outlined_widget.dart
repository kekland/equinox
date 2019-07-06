import 'package:equinox/components/global/inverted_cliprrect.dart';
import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';
import 'package:vector_math/vector_math_64.dart' as VectorMath;

class OutlinedWidget extends StatefulWidget {
  final bool outlined;
  final Widget child;
  final Size predefinedSize;
  final BorderRadius borderRadius;

  const OutlinedWidget({
    Key key,
    @required this.outlined,
    @required this.child,
    this.predefinedSize,
    this.borderRadius,
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
    var theme = EqTheme.of(context);
    var animationDuration = EqTheme.of(context).minorAnimationDuration;

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

  VectorMath.Vector3 calculateScaleVector(EqThemeData theme) {
    var value = VectorMath.Vector3(
      2 * theme.outlineWidth / itemSize.width,
      2 * theme.outlineWidth / itemSize.height,
      0.0,
    );

    return value * animation.value + VectorMath.Vector3.all(1.0);
  }

  Border calculateBorder(EqThemeData theme, VectorMath.Vector3 scaleFactor) {
    var verticalBorderSide = BorderSide(
      color: theme.outlineColor,
      width: ((theme.outlineWidth / scaleFactor.y) * animation.value)
          .clamp(0.0, double.infinity),
    );
    var horizontalBorderSide = BorderSide(
      color: theme.outlineColor,
      width: ((theme.outlineWidth / scaleFactor.x) * animation.value)
          .clamp(0.0, double.infinity),
    );
    return Border(
      top: verticalBorderSide,
      bottom: verticalBorderSide,
      left: horizontalBorderSide,
      right: horizontalBorderSide,
    );
  }

  Widget _build(BuildContext context) {
    var theme = EqTheme.of(context);
    return Stack(
      children: [
        if (itemSize != null)
          AnimatedBuilder(
              animation: animation,
              builder: (context, _) {
                var scaleFactor = calculateScaleVector(theme);
                return Stack(
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
                        child: ClipRRect(
                          borderRadius: borderRadius,
                          child: Container(
                            width: itemSize.width,
                            height: itemSize.height,
                            decoration: BoxDecoration(
                              border: calculateBorder(theme, scaleFactor),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: animation.value,
                      child: ClipPath(
                        clipper: InvertedClipRRect(
                          borderRadius: borderRadius,
                        ),
                        child: Container(
                          width: itemSize.width,
                          height: itemSize.height,
                          color: theme.outlineColor,
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
        if (itemKey.currentContext.size != itemSize) {
          setState(() {});
        }
        itemSize = itemKey.currentContext.size;
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
