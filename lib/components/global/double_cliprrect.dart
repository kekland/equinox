import 'package:flutter/widgets.dart';

class DoubleClipRRect extends CustomClipper<Path> {
  final BorderRadius borderRadius;
  final double outilneVerticalWidth;
  final double outlineHorizontalWidth;

  DoubleClipRRect({
    this.outilneVerticalWidth,
    this.outlineHorizontalWidth,
    this.borderRadius,
  });

  @override
  Path getClip(Size size) {
    var rect = new Rect.fromLTWH(0.0, 0.0, size.width, size.height);
    var innerRect = new Rect.fromLTRB(
      outlineHorizontalWidth,
      outilneVerticalWidth,
      size.width - outlineHorizontalWidth,
      size.height - outilneVerticalWidth,
    );

    print(rect);
    print(innerRect);
    return new Path()
      ..addRRect(borderRadius.toRRect(rect))
      ..addRRect(borderRadius.toRRect(innerRect))
      ..fillType = PathFillType.evenOdd;
  }

  @override
  bool shouldReclip(DoubleClipRRect oldClipper) =>
      this.borderRadius != oldClipper.borderRadius ||
      this.outilneVerticalWidth != oldClipper.outilneVerticalWidth ||
      this.outlineHorizontalWidth != oldClipper.outlineHorizontalWidth;
}
