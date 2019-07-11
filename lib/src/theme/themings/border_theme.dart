import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';

/// This is a theming class for borders.
///
/// [getColor] generates a [Border] object to use from current colors.
class EqBorderThemeData {
  /// Width of the border.
  ///
  /// Must not be null.
  final double width;

  /// Color to use in border's default state.
  ///
  /// Must not be null.
  final Color color;

  /// Color to use when border is selected.
  ///
  /// If null, uses [EqBorderThemeData.color]
  final Color colorSelected;

  /// Color to use when border is disabled.
  ///
  /// If null, uses [EqBorderThemeData.color]
  final Color colorDisabled;

  EqBorderThemeData({
    @required this.width,
    @required this.color,
    this.colorSelected,
    this.colorDisabled,
  });

  EqBorderThemeData copyWith({
    double width,
    Color color,
    Color colorSelected,
    Color colorDisabled,
  }) {
    return EqBorderThemeData(
      color: color ?? this.color,
      colorDisabled: colorDisabled ?? this.colorDisabled,
      colorSelected: colorSelected ?? this.colorSelected,
      width: width ?? this.width,
    );
  }

  EqBorderThemeData merge(EqBorderThemeData other) {
    if (other == null) return this;
    return copyWith(
      color: other.color,
      colorDisabled: other.colorDisabled,
      colorSelected: other.colorSelected,
      width: other.width,
    );
  }

  /// Creates [Border] from this object.
  ///
  /// [selected] and [enabled] must not be null.
  Border getBorder(
      {bool selected = false, bool enabled = true, WidgetStatus status}) {
    return Border.all(
      color: (enabled)
          ? (selected) ? colorSelected ?? color : color
          : colorDisabled ?? color,
      width: width,
    );
  }
}
