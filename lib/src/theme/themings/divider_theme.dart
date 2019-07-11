import 'package:flutter/widgets.dart';

class EqDividerThemeData {
  final double width;
  final Color color;

  EqDividerThemeData({this.width, this.color});

  EqDividerThemeData copyWith({double width, Color color}) {
    return EqDividerThemeData(
      color: color ?? this.color,
      width: width ?? this.width,
    );
  }

  EqDividerThemeData merge(EqDividerThemeData other) {
    if(other == null) return this;
    return copyWith(color: other.color, width: other.width);
  }
}
