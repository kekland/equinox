import 'package:flutter/widgets.dart';

class EqControlElementsThemeData {
  final double descriptionPadding;
  final EdgeInsets padding;

  EqControlElementsThemeData({this.descriptionPadding, this.padding});

  EqControlElementsThemeData copyWith({
    double descriptionPadding,
    EdgeInsets padding,
  }) {
    return EqControlElementsThemeData(
      descriptionPadding: descriptionPadding ?? this.descriptionPadding,
      padding: padding ?? this.padding,
    );
  }

  EqControlElementsThemeData merge(EqControlElementsThemeData other) {
    if (other == null) return this;

    return copyWith(
      descriptionPadding: other.descriptionPadding,
      padding: other.padding,
    );
  }
}
