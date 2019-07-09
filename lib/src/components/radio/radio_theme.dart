import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';

/// A class that contains the customizations for [EqRadio], and provides methods to access color, etc.
/// Can be used in [EqThemeData.defaultRadioTheme].
class EqRadioThemeData {
  /// Status of the widget. Controls the background color.
  /// Also controls the disabled background color.
  final WidgetStatus status;

  /// Controls the position of the description.
  final Positioning descriptionPosition;

  const EqRadioThemeData({
    this.status,
    this.descriptionPosition,
  });

  /// Merges two [EqRadioThemeData]'s.
  EqRadioThemeData copyWith({
    WidgetStatus status,
    Positioning descriptionPosition,
  }) {
    return EqRadioThemeData(
      status: status ?? this.status,
      descriptionPosition: descriptionPosition ?? this.descriptionPosition,
    );
  }

  /// Merges two [EqRadioThemeData]'s, giving the prevalence to the second one.
  EqRadioThemeData merge(EqRadioThemeData other) {
    if (other == null) return this;
    return EqRadioThemeData(
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

    return (status != null)
        ? theme.getColorsForStatus(status: status).shade500.withOpacity(0.125)
        : theme.backgroundBasicColors.color3;
  }

  Color getKnobColor(
      {EqThemeData theme, bool selected = false, bool disabled = false}) {
    var statusColor = !disabled
        ? theme.getColorsForStatus(status: status).shade500
        : theme.textDisabledColor;

    return selected ? statusColor : Colors.transparent;
  }

  Color getBorderColor(
      {EqThemeData theme, bool selected = false, bool disabled = false}) {
    if (disabled) return theme.borderBasicColors.color3;

    if (selected) {
      return theme.getColorsForStatus(status: status).shade500 ??
          theme.primary.shade500;
    } else {
      return theme.getColorsForStatus(status: status).shade500 ??
          theme.borderBasicColors.color4;
    }
  }
}
