import 'package:flutter/widgets.dart';

class EqOutlineThemeData {
  final Color color;
  final double width;

  EqOutlineThemeData({
    @required this.color,
    @required this.width,
  });

  EqOutlineThemeData copyWith({Color color, double width}) {
    return EqOutlineThemeData(
      color: color ?? this.color,
      width: width ?? this.width,
    );
  }

  EqOutlineThemeData merge(EqOutlineThemeData other) {
    if (other == null) return this;
    return copyWith(
      color: other.color,
      width: other.width,
    );
  }
}
