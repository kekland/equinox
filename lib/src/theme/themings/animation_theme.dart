import 'package:flutter/widgets.dart';

class EqAnimationThemeData {
  final Curve curve;
  final Duration duration;

  const EqAnimationThemeData({
    @required this.curve,
    @required this.duration,
  });

  EqAnimationThemeData copyWith({Curve curve, Duration duration}) {
    return EqAnimationThemeData(
      curve: curve ?? this.curve,
      duration: duration ?? this.duration,
    );
  }

  EqAnimationThemeData merge(EqAnimationThemeData other) {
    if (other == null) return this;
    return copyWith(
      curve: other.curve,
      duration: other.duration,
    );
  }
}
