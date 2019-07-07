import 'package:flutter/widgets.dart';

class ToastRevealAnimationWidget extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;
  final outlineWidth;

  const ToastRevealAnimationWidget({
    Key key,
    this.animation,
    this.child,
    this.outlineWidth,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      clipper: ToastRevealAnimationClipper(
        animation.value,
        outlineWidth,
      ),
      child: Align(
        alignment: Alignment.bottomRight,
        widthFactor: animation.value,
        heightFactor: animation.value,
        child: child,
      ),
    );
  }
}

class ToastRevealAnimationClipper extends CustomClipper<Rect> {
  final double sizeMultiplier;
  final double outlineWidth;

  ToastRevealAnimationClipper(
    this.sizeMultiplier,
    this.outlineWidth,
  );
  @override
  Rect getClip(Size size) {
    var sizeMultiplied = size * sizeMultiplier;
    Rect rect = Rect.fromLTRB(
      size.width - sizeMultiplied.width - outlineWidth,
      size.height - sizeMultiplied.height - outlineWidth,
      size.width + outlineWidth,
      size.height + outlineWidth,
    );
    return rect;
  }

  @override
  bool shouldReclip(ToastRevealAnimationClipper oldClipper) =>
      oldClipper.sizeMultiplier != sizeMultiplier ||
      oldClipper.outlineWidth != outlineWidth;
}
