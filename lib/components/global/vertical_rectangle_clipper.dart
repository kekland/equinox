import 'package:flutter/widgets.dart';

class VerticalRectangleClipper extends CustomClipper<Rect> {
  double verticalMultiplier;
  double shadowSize;

  VerticalRectangleClipper({this.verticalMultiplier, this.shadowSize});

  @override
  Rect getClip(Size size) {
    var rect = new Rect.fromLTWH(
      -shadowSize,
      -shadowSize,
      size.width + shadowSize * 2,
      (size.height + shadowSize * 2) * (verticalMultiplier ?? 1.0),
    );
    return rect;
  }

  @override
  bool shouldReclip(VerticalRectangleClipper oldClipper) =>
      (oldClipper.verticalMultiplier != verticalMultiplier ||
          oldClipper.shadowSize != shadowSize);
}
