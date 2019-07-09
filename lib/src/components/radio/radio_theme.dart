import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';

/// A class that contains the customizations for [EqRadio], and provides methods to access color, etc.
/// Can be used in [EqThemeData], or in [EqRadioTheme] widget.
class EqRadioThemeData {
  /// Status of the widget. Controls the background color (ignored if [backgroundColor] is non-null).
  /// Also controls the disabled background color (ignored if [backgroundDisabledColor] is non-null).
  final WidgetStatus status;

  /// Controls the border's color. Will overwrite the color set by [status].
  final Color borderColor;

  /// Controls the border's color when radio is selected. Will overwrite the color set by [status].
  final Color borderSelectedColor;

  /// Controls the border's color when radio is disabled. Will overwrite the color set by [status].
  final Color borderDisabledColor;

  /// Controls the background color. Will overwrite the color set by [status].
  final Color backgroundColor;

  /// Controls the background color when the radio is selected. Will overwrite the color set by [status].
  final Color backgroundSelectedColor;

  /// Controls the background color when radio is disabled. Will overwrite the color set by [status].
  final Color backgroundDisabledColor;

  /// Controls the color of the knob. [EqThemeData.control] if none is present.
  final Color knobColor;

  /// Controls the color of the knob when the radio is disabled. [EqThemeData.textDisabledColor] if none is present.
  final Color knobDisabledColor;

  /// Controls the styling of the description. Will be merged with the
  /// text style provided by application's theme.
  final TextStyle descriptionTextStyle;

  /// Controls the position of the description.
  final Positioning descriptionPosition;

  const EqRadioThemeData({
    this.status,
    this.borderColor,
    this.borderSelectedColor,
    this.borderDisabledColor,
    this.backgroundColor,
    this.backgroundDisabledColor,
    this.backgroundSelectedColor,
    this.descriptionTextStyle,
    this.knobColor,
    this.knobDisabledColor,
    this.descriptionPosition,
  });

  /// Merges two [EqRadioThemeData]'s.
  EqRadioThemeData copyWith({
    WidgetStatus status,
    Color borderColor,
    Color borderSelectedColor,
    Color borderDisabledColor,
    Color backgroundColor,
    Color backgroundSelectedColor,
    Color backgroundDisabledColor,
    TextStyle descriptionTextStyle,
    Positioning descriptionPosition,
    Color knobColor,
    Color knobDisabledColor,
  }) {
    return EqRadioThemeData(
      status: status ?? this.status,
      borderColor: borderColor ?? this.borderColor,
      borderDisabledColor: borderDisabledColor ?? this.borderDisabledColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      backgroundSelectedColor:
          backgroundSelectedColor ?? this.backgroundSelectedColor,
      backgroundDisabledColor:
          backgroundDisabledColor ?? this.backgroundDisabledColor,
      descriptionTextStyle: descriptionTextStyle ?? this.descriptionTextStyle,
      knobColor: knobColor,
      descriptionPosition: descriptionPosition ?? this.descriptionPosition,
      knobDisabledColor: knobDisabledColor ?? this.knobDisabledColor,
      borderSelectedColor: borderSelectedColor ?? this.borderSelectedColor,
    );
  }

  /// Merges two [EqRadioThemeData]'s, giving the prevalence to the second one.
  EqRadioThemeData merge(EqRadioThemeData other) {
    if (other == null) return this;
    return EqRadioThemeData(
      backgroundColor: other.backgroundColor ?? backgroundColor,
      backgroundDisabledColor:
          other.backgroundDisabledColor ?? backgroundDisabledColor,
      borderColor: other.borderColor ?? borderColor,
      borderDisabledColor: other.borderDisabledColor ?? borderDisabledColor,
      backgroundSelectedColor:
          other.backgroundSelectedColor ?? backgroundSelectedColor,
      status: other.status ?? status,
      descriptionTextStyle: other.descriptionTextStyle ?? descriptionTextStyle,
      knobColor: other.knobColor ?? knobColor,
      descriptionPosition: other.descriptionPosition ?? descriptionPosition,
      knobDisabledColor: other.knobDisabledColor ?? knobDisabledColor,
      borderSelectedColor: other.borderSelectedColor ?? borderSelectedColor,
    );
  }

  TextStyle getDescriptionTextStyle({EqThemeData theme}) {
    return theme.subtitle2.textStyle
        .copyWith(color: theme.textBasicColor, height: 1.0)
        .merge(this.descriptionTextStyle);
  }

  Color getFillColor(
      {EqThemeData theme, bool selected = false, bool disabled = false}) {
    if (disabled)
      return backgroundDisabledColor ?? theme.backgroundBasicColors.color2;
    if (selected && this.backgroundSelectedColor != null) {
      return this.backgroundSelectedColor;
    }

    return (status != null)
        ? theme.getColorsForStatus(status: status).shade500.withOpacity(0.125)
        : this.backgroundColor ?? theme.backgroundBasicColors.color3;
  }

  Color getKnobColor(
      {EqThemeData theme, bool selected = false, bool disabled = false}) {
    var statusColor = !disabled
        ? knobColor ?? theme.getColorsForStatus(status: status).shade500
        : knobDisabledColor ?? theme.textDisabledColor;

    return selected ? statusColor : Colors.transparent;
  }

  Color getBorderColor(
      {EqThemeData theme, bool selected = false, bool disabled = false}) {
    if (disabled)
      return this.borderDisabledColor ?? theme.borderBasicColors.color3;

    if (selected) {
      return this.borderSelectedColor ??
          theme.getColorsForStatus(status: status).shade500 ??
          theme.primary.shade500;
    } else {
      return this.borderColor ??
          theme.getColorsForStatus(status: status).shade500 ??
          theme.borderBasicColors.color4;
    }
  }
}
