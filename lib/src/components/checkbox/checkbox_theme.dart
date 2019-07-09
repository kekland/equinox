import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';

/// A class that contains the customizations for [EqCheckbox], and provides methods to access color, etc.
/// Can be used in [EqThemeData.defaultCheckboxTheme].
class EqCheckboxThemeData {
  /// Status of the widget. Controls the background color (ignored if [backgroundColor] is non-null).
  /// Also controls the disabled background color (ignored if [backgroundDisabledColor] is non-null).
  final WidgetStatus status;

  /// Controls the border radius. Can be either `.rectangle`, `.semiRound`, `.round`. Will be overwritten
  /// if [borderRadius] is present.
  final WidgetShape shape;

  /// Controls the position of the description.
  final Positioning descriptionPosition;

  const EqCheckboxThemeData({
    this.status,
    this.shape,
    this.descriptionPosition,
  });

  /// Merges two [EqCheckboxThemeData]'s.
  EqCheckboxThemeData copyWith({
    WidgetStatus status,
    WidgetShape shape,
    Positioning descriptionPosition,
  }) {
    return EqCheckboxThemeData(
      status: status ?? this.status,
      shape: shape ?? this.shape,
      descriptionPosition: descriptionPosition ?? this.descriptionPosition,
    );
  }

  /// Merges two [EqCheckboxThemeData]'s, giving the prevalence to the second one.
  EqCheckboxThemeData merge(EqCheckboxThemeData other) {
    if (other == null) return this;
    return EqCheckboxThemeData(
      shape: other.shape ?? shape,
      status: other.status ?? status,
      descriptionPosition: other.descriptionPosition ?? descriptionPosition,
    );
  }

  TextStyle getDescriptionTextStyle({EqThemeData theme}) {
    return theme.subtitle2.textStyle
        .copyWith(color: theme.textBasicColor, height: 1.0);
  }

  Color getFillColor(
      {EqThemeData theme, bool selected = false, bool disabled = false}) {
    if (disabled)
      return theme.backgroundBasicColors.color2;

    var filledColor = (this.status != null)
        ? theme.getColorsForStatus(status: this.status).shade500
        : theme.primary.shade500;

    if (selected) {
      return filledColor;
    } else {
      return (status != null)
          ? theme.getColorsForStatus(status: status).shade500.withOpacity(0.125)
          : theme.backgroundBasicColors.color3;
    }
  }

  Color getIconColor({EqThemeData theme, bool disabled = false}) {
    if (disabled) return theme.textDisabledColor;
    return Colors.white;
  }

  Color getBorderColor({EqThemeData theme, bool disabled = false}) {
    if (disabled) return theme.borderBasicColors.color3;

    return (this.status != null)
        ? theme.getColorsForStatus(status: this.status).shade500
        : theme.borderBasicColors.color4;
  }

  BorderRadius getBorderRadius({EqThemeData theme}) {
    var defaultShape = this.shape ?? theme.defaultWidgetShape;
    return BorderRadius.circular(theme.borderRadius *
        WidgetShapeUtils.getMultiplier(shape: defaultShape));
  }
}
