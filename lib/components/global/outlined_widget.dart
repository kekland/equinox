import 'package:eva_design_flutter/eva_design_flutter.dart';
import 'package:flutter/material.dart';
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

  bool isFirstCallback = true;

  AnimationController outlineAnimation;
  Animation<double> outlineScaleAnimation;

  @override
  void didUpdateWidget(OutlinedWidget oldWidget) {
    if (oldWidget.outlined != widget.outlined) {
      if (widget.outlined) {
        outlineAnimation.forward();
      } else {
        outlineAnimation.reverse();
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();
    itemSize = widget.predefinedSize;
    if (widget.predefinedSize == null) {
      WidgetsBinding.instance.addPersistentFrameCallback((_) {
        if (isFirstCallback) {
          isFirstCallback = false;
          setState(() {});
        }
        itemSize = itemKey.currentContext.size;
      });
    }

    outlineAnimation =
        AnimationController(vsync: this, duration: Duration(milliseconds: 150));
    outlineScaleAnimation =
        CurvedAnimation(parent: outlineAnimation, curve: Curves.decelerate);
  }

  VectorMath.Vector3 calculateTranslationVector(EqThemeData theme) {
    return VectorMath.Vector3(
      -theme.outlineWidth * outlineScaleAnimation.value,
      -theme.outlineWidth * outlineScaleAnimation.value,
      0.0,
    );
  }

  VectorMath.Vector3 calculateScaleVector(EqThemeData theme) {
    var min = VectorMath.Vector3(1.0, 1.0, 0.0);
    var max = VectorMath.Vector3(
      (itemSize.width + theme.outlineWidth * 2) / itemSize.width,
      (itemSize.height + theme.outlineWidth * 2) / itemSize.height,
      0.0,
    );

    return ((max - min) * outlineScaleAnimation.value) + min;
  }

  Widget _build(BuildContext context) {
    var theme = EqTheme.of(context);
    return Stack(
      children: [
        if (itemSize != null)
          AnimatedBuilder(
              animation: outlineScaleAnimation,
              builder: (context, _) {
                return Opacity(
                  opacity: outlineScaleAnimation.value,
                  child: Transform(
                    transform: Matrix4.compose(
                      calculateTranslationVector(theme),
                      VectorMath.Quaternion.identity(),
                      calculateScaleVector(theme),
                    ),
                    child: Container(
                      width: itemSize.width,
                      height: itemSize.height,
                      decoration: BoxDecoration(
                        borderRadius: widget.borderRadius,
                        color: Colors.white.withOpacity(0.05),
                      ),
                    ),
                  ),
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
    return _build(context);
  }

  @override
  void dispose() {
    outlineAnimation.dispose();
    super.dispose();
  }
}
