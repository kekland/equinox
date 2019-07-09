import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';

/// A class that contains the customizations for [EqToggle], and provides methods to access color, etc.
/// Can be used in [EqThemeData.defaultToggleTheme]
class EqToggleThemeData {
  /// Status of the widget. Controls the background color.
  /// Also controls the disabled background color.
  final WidgetStatus status;

  /// Controls the position of the description.
  final Positioning descriptionPosition;

  const EqToggleThemeData({
    this.status,
    this.descriptionPosition,
  });

  /// Merges two [EqToggleThemeData]'s.
  EqToggleThemeData copyWith({
    WidgetStatus status,
    Positioning descriptionPosition,
  }) {
    return EqToggleThemeData(
      status: status ?? this.status,
      descriptionPosition: descriptionPosition ?? this.descriptionPosition,
    );
  }

  /// Merges two [EqToggleThemeData]'s, giving the prevalence to the second one.
  EqToggleThemeData merge(EqToggleThemeData other) {
    if (other == null) return this;
    return EqToggleThemeData(
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
    if (disabled) return theme.backgroundBasicColors.color2;

    var filledColor = (this.status != null)
        ? theme.getColorsForStatus(status: status).shade500
        : theme.primary.shade500;

    if (selected) {
      return filledColor;
    } else {
      return (this.status != null)
          ? theme.getColorsForStatus(status: status).shade500.withOpacity(0.125)
          : theme.backgroundBasicColors.color3;
    }
  }

  Color getKnobColor({EqThemeData theme, bool disabled = false}) {
    if (disabled) return theme.textDisabledColor;
    return theme.textControlColor;
  }

  Color getBorderColor({EqThemeData theme, bool disabled = false}) {
    if (disabled) return theme.borderBasicColors.color3;

    return (this.status != null)
        ? theme.getColorsForStatus(status: this.status).shade500
        : theme.borderBasicColors.color4;
  }
}
