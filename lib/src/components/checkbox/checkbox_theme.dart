import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';

/// A class that contains the customizations for [EqCheckbox], and provides methods to access color, etc.
/// Can be used in [EqThemeData], or in [EqCheckboxTheme] widget.
class EqCheckboxThemeData {
  /// Status of the widget. Controls the background color (ignored if [backgroundColor] is non-null).
  /// Also controls the disabled background color (ignored if [backgroundDisabledColor] is non-null).
  final WidgetStatus status;

  /// Controls the border radius. Can be either `.rectangle`, `.semiRound`, `.round`. Will be overwritten
  /// if [borderRadius] is present.
  final WidgetShape shape;

  /// Controls the border's color. Will overwrite the color set by [status].
  final Color borderColor;

  /// Controls the border's color when checkbox is disabled. Will overwrite the color set by [status].
  final Color borderDisabledColor;

  /// Controls the background color. Will overwrite the color set by [status].
  final Color backgroundColor;

  /// Controls the background color when the checkbox is selected. Will overwrite the color set by [status].
  final Color backgroundSelectedColor;

  /// Controls the background color when checkbox is disabled. Will overwrite the color set by [status].
  final Color backgroundDisabledColor;
  
  /// Controls the color of the checkmark. [Colors.white] if none is present.
  final Color checkmarkColor;
  
  /// Controls the color of the checkmark when checkbox is disabled. [EqThemeData.textDisabledColor] if none is present.
  final Color checkmarkDisabledColor;

  /// Controls the styling of the description. Will be merged with the
  /// text style provided by application's theme.
  final TextStyle descriptionTextStyle;

  /// Controls the border radius of the checkbox. Overwrites the value set by [shape].
  final BorderRadius borderRadius;

  /// Controls the position of the description.
  final Positioning descriptionPosition;

  const EqCheckboxThemeData({
    this.checkmarkColor,
    this.status,
    this.shape,
    this.borderColor,
    this.borderDisabledColor,
    this.backgroundColor,
    this.backgroundDisabledColor,
    this.backgroundSelectedColor,
    this.borderRadius,
    this.descriptionTextStyle,
    this.checkmarkDisabledColor,
    this.descriptionPosition,
  });

  /// Merges two [EqCheckboxThemeData]'s.
  EqCheckboxThemeData copyWith({
    WidgetStatus status,
    WidgetShape shape,
    Color outlineColor,
    Color outlineDisabledColor,
    Color backgroundColor,
    Color backgroundSelectedColor,
    Color backgroundDisabledColor,
    TextStyle descriptionTextStyle,
    BorderRadius borderRadius,
    Color checkmarkColor,
    Color checkmarkDisabledColor,
    Positioning descriptionPosition,
  }) {
    return EqCheckboxThemeData(
      status: status ?? this.status,
      shape: shape ?? this.shape,
      borderColor: outlineColor ?? this.borderColor,
      borderDisabledColor: outlineDisabledColor ?? this.borderDisabledColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      backgroundSelectedColor:
          backgroundSelectedColor ?? this.backgroundSelectedColor,
      backgroundDisabledColor:
          backgroundDisabledColor ?? this.backgroundDisabledColor,
      descriptionTextStyle: descriptionTextStyle ?? this.descriptionTextStyle,
      borderRadius: borderRadius ?? this.borderRadius,
      checkmarkColor: checkmarkColor ?? this.checkmarkColor,
      checkmarkDisabledColor: checkmarkDisabledColor ?? this.checkmarkDisabledColor,
      descriptionPosition: descriptionPosition ?? this.descriptionPosition,
    );
  }

  /// Merges two [EqCheckboxThemeData]'s, giving the prevalence to the second one.
  EqCheckboxThemeData merge(EqCheckboxThemeData other) {
    if (other == null) return this;
    return EqCheckboxThemeData(
      backgroundColor: other.backgroundColor ?? backgroundColor,
      backgroundDisabledColor:
          other.backgroundDisabledColor ?? backgroundDisabledColor,
      borderColor: other.borderColor ?? borderColor,
      borderDisabledColor: other.borderDisabledColor ?? borderDisabledColor,
      backgroundSelectedColor:
          other.backgroundSelectedColor ?? backgroundSelectedColor,
      shape: other.shape ?? shape,
      status: other.status ?? status,
      borderRadius: other.borderRadius ?? borderRadius,
      descriptionTextStyle: other.descriptionTextStyle ?? descriptionTextStyle,
      checkmarkColor: other.checkmarkColor ?? checkmarkColor,
      checkmarkDisabledColor: other.checkmarkDisabledColor ?? checkmarkDisabledColor,
      descriptionPosition: other.descriptionPosition ?? descriptionPosition,
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
      return this.backgroundDisabledColor ?? theme.backgroundBasicColors.color2;

    var filledColor = this.backgroundSelectedColor ?? (this.status != null)
        ? theme.getColorsForStatus(status: this.status).shade500
        : theme.primary.shade500;

    if (selected) {
      return filledColor;
    } else {
      return this.backgroundColor ?? (status != null)
          ? theme.getColorsForStatus(status: status).shade500.withOpacity(0.125)
          : theme.backgroundBasicColors.color3;
    }
  }

  Color getIconColor({EqThemeData theme, bool disabled = false}) {
    if (disabled) return this.checkmarkDisabledColor ?? theme.textDisabledColor;
    return this.checkmarkColor ?? Colors.white;
  }

  Color getBorderColor({EqThemeData theme, bool disabled = false}) {
    if (disabled) return this.borderDisabledColor ?? theme.borderBasicColors.color3;

    return this.borderColor ?? (this.status != null)
        ? theme.getColorsForStatus(status: this.status).shade500
        : theme.borderBasicColors.color4;
  }

  BorderRadius getBorderRadius({EqThemeData theme}) {
    if (this.borderRadius != null) return this.borderRadius;

    var defaultShape = this.shape ?? theme.defaultWidgetShape;
    return BorderRadius.circular(theme.borderRadius *
        WidgetShapeUtils.getMultiplier(shape: defaultShape));
  }
}
