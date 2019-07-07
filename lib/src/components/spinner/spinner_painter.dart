import 'dart:math';

import 'package:flutter/widgets.dart';

class SpinnerPainter extends CustomPainter {
  SpinnerPainter({this.color, this.strokeWidth});

  final Color color;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(Offset.zero & size, 0.0, 1.5 * pi, false, paint);
  }

  @override
  bool shouldRepaint(SpinnerPainter oldPainter) {
    return oldPainter.color != color || oldPainter.strokeWidth != strokeWidth;
  }
}
