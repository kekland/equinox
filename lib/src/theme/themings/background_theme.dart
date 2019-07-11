import 'package:flutter/widgets.dart';

/// This is a theming class for backgrounds.
/// 
/// [getColor] generates a [Border] object to use from current colors.
class EqBackgroundThemeData {
  /// Color to use in background's default state.
  ///
  /// Must not be null.
  final Color color;

  /// Color to use when the widget is selected.
  ///
  /// If null, uses [EqBackgroundThemeData.color]
  final Color colorSelected;

  /// Color to use when the widget is disabled.
  ///
  /// If null, uses [EqBackgroundThemeData.color]
  final Color colorDisabled;

  EqBackgroundThemeData({
    @required this.color,
    this.colorSelected,
    this.colorDisabled,
  });

  EqBackgroundThemeData copyWith({
    Color color,
    Color colorSelected,
    Color colorDisabled,
  }) {
    return EqBackgroundThemeData(
      color: color ?? this.color,
      colorDisabled: colorDisabled ?? this.colorDisabled,
      colorSelected: colorSelected ?? this.colorSelected,
    );
  }

  EqBackgroundThemeData merge(EqBackgroundThemeData other) {
    if (other == null) return this;
    return copyWith(
      color: other.color,
      colorDisabled: other.colorDisabled,
      colorSelected: other.colorSelected,
    );
  }

  /// Creates [Border] from this object.
  /// 
  /// [selected] and [enabled] must not be null.
  Color getBackgroundColor({bool selected = false, bool enabled = true}) {
    if(selected) {
      return colorSelected ?? color;
    }
    else if(enabled) {
      return color;
    }
    else {
      return colorDisabled ?? color;
    }
  }
}
