import 'package:flutter/widgets.dart';

class InvertedClipRRect extends CustomClipper<Path> {
  final BorderRadius borderRadius;

  InvertedClipRRect({this.borderRadius});

  @override
  Path getClip(Size size) {
    var rect = new Rect.fromLTWH(0.0, 0.0, size.width, size.height);
    return new Path()
      ..addRRect(borderRadius.toRRect(rect))
      ..addRect(rect)
      ..fillType = PathFillType.evenOdd;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
