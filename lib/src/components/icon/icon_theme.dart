import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';

class EqIconThemeData {
  final double size;
  final Color color;

  EqIconThemeData({this.size, this.color});

  static EqIconThemeData of(BuildContext context) {
    final theme = EqTheme.of(context);
    return theme.iconTheme;
  }

  EqIconThemeData copyWith({double size, Color color}) {
    return EqIconThemeData(
      color: color ?? this.color,
      size: size ?? this.size,
    );
  }

  EqIconThemeData merge(EqIconThemeData other) {
    if (other == null) return this;
    return copyWith(
      size: other.size,
      color: other.color,
    );
  }
}
