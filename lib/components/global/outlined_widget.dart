import 'package:eva_design_flutter/components/global/inverted_cliprrect.dart';
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
    if(oldWidget.predefinedSize != widget.predefinedSize) {
      this.itemSize = widget.predefinedSize;
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

  VectorMath.Vector3 calculateScaleVector(EqThemeData theme) {
    var value = VectorMath.Vector3(
      2 * theme.outlineWidth / itemSize.width,
      2 * theme.outlineWidth / itemSize.height,
      0.0,
    );

    return value * outlineScaleAnimation.value + VectorMath.Vector3.all(1.0);
  }

  Border calculateBorder(EqThemeData theme, VectorMath.Vector3 scaleFactor) {
    var verticalBorderSide = BorderSide(
      color: theme.outlineColor,
      width:
          ((theme.outlineWidth / scaleFactor.y) * outlineScaleAnimation.value)
              .clamp(0.0, double.infinity),
    );
    var horizontalBorderSide = BorderSide(
      color: theme.outlineColor,
      width:
          ((theme.outlineWidth / scaleFactor.x) * outlineScaleAnimation.value)
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
              animation: outlineScaleAnimation,
              builder: (context, _) {
                var scaleFactor = calculateScaleVector(theme);
                return Stack(
                  children: <Widget>[
                    Opacity(
                      opacity: outlineScaleAnimation.value,
                      child: Transform(
                        transform: Matrix4.compose(
                          VectorMath.Vector3.zero(),
                          VectorMath.Quaternion.identity(),
                          scaleFactor,
                        ),
                        origin:
                            Offset(itemSize.width / 2.0, itemSize.height / 2.0),
                        child: ClipRRect(
                          borderRadius: widget.borderRadius,
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
                      opacity: outlineScaleAnimation.value,
                      child: ClipPath(
                        clipper: InvertedClipRRect(
                          borderRadius: widget.borderRadius,
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
    return _build(context);
  }

  @override
  void dispose() {
    outlineAnimation.dispose();
    super.dispose();
  }
}
