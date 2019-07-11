import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';

/// A class that contains the customizations for [EqRadio].
/// 
/// Can be used in [EqThemeData.defaultRadioTheme].
class EqRadioThemeData {
  /// Controls the position of the description.
  /// 
  /// If null, defaults to [EqPositioning.right]
  final EqPositioning descriptionPosition;

  /// Controls the amount of padding of the container.
  /// 
  /// If null, defaults to [const EdgeInsets.all(8.0)]
  final EdgeInsets padding;

  /// Controls the radius of the radio.
  /// 
  /// If null, defaults to [EqRadioThemeData.size / 2.0]
  final BorderRadius borderRadius;

  /// Controls the size of the widget.
  /// 
  /// If null, defaults to [EqThemeData.defaultIconTheme]
  final double size;
  
  /// Controls the size of the knob.
  /// 
  /// If null, defaults to [size * (2/3)]
  final double knobSize;

  final double descriptionPadding;
  final TextStyle descriptionStyle;

  /// Controls the border colors.
  /// 
  /// If null, defaults to [EqThemeData.defaultBorderTheme]
  final EqBorderThemeData borderTheme;

  /// Controls the border colors.
  /// 
  /// If null, defaults to [EqThemeData.defaultBackgroundTheme]
  final EqBackgroundThemeData backgroundTheme;

  /// Controls the border colors.
  /// 
  /// If null, defaults to [EqThemeData.defaultBorderTheme]
  final EqBackgroundThemeData knobTheme;

  const EqRadioThemeData({
    this.descriptionPosition,
    this.padding,
    this.borderRadius,
    this.borderWidth,
    this.size,
    this.knobSize,
    this.descriptionPadding,
    this.descriptionStyle,
    this.backgroundColor,
    this.backgroundDisabledColor,
    this.knobColor,
    this.knobDisabledColor,
    this.borderColor,
    this.borderSelectedColor,
    this.borderDisabledColor,
  });

  /// Merges two [EqRadioThemeData]'s.
  EqRadioThemeData copyWith({
    EqPositioning descriptionPosition,
    EdgeInsets padding,
    BorderRadius borderRadius,
    double borderWidth,
    double size,
    double knobSize,
    double descriptionPadding,
    TextStyle descriptionStyle,
    Color backgroundColor,
    Color backgroundDisabledColor,
    Color knobColor,
    Color knobDisabledColor,
    Color borderColor,
    Color borderSelectedColor,
    Color borderDisabledColor,
  }) {
    return EqRadioThemeData(
      borderRadius: borderRadius ?? this.borderRadius,
      borderWidth: borderWidth ?? this.borderWidth,
      descriptionPadding: descriptionPadding ?? this.descriptionPadding,
      descriptionPosition: descriptionPosition ?? this.descriptionPosition,
      descriptionStyle: descriptionStyle ?? this.descriptionStyle,
      knobSize: knobSize ?? this.knobSize,
      padding: padding ?? this.padding,
      size: size ?? this.size,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      backgroundDisabledColor:
          backgroundDisabledColor ?? this.backgroundDisabledColor,
      borderColor: borderColor ?? this.borderColor,
      borderDisabledColor: borderDisabledColor ?? this.borderDisabledColor,
      borderSelectedColor: borderSelectedColor ?? this.borderSelectedColor,
      knobColor: knobColor ?? this.knobColor,
      knobDisabledColor: knobDisabledColor ?? this.knobDisabledColor,
    );
  }

  /// Merges two [EqRadioThemeData]'s, giving the prevalence to the second one.
  EqRadioThemeData merge(EqRadioThemeData other) {
    if (other == null) return this;
    return copyWith(
      borderRadius: other.borderRadius,
      borderWidth: other.borderWidth,
      descriptionPadding: other.descriptionPadding,
      descriptionPosition: other.descriptionPosition,
      descriptionStyle: other.descriptionStyle,
      knobSize: other.knobSize,
      padding: other.padding,
      size: other.size,
      backgroundColor: other.backgroundColor,
      backgroundDisabledColor: other.backgroundDisabledColor,
      borderColor: other.borderColor,
      borderDisabledColor: other.borderDisabledColor,
      borderSelectedColor: other.borderSelectedColor,
      knobColor: other.knobColor,
      knobDisabledColor: other.knobDisabledColor,
    );
  }

  static EqRadioThemeData of(BuildContext context) {
    return EqTheme.of(context).defaultRadioTheme;
  }
}
