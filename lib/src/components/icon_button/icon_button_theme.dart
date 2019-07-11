import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';

/// A class that contains the customizations for [EqIconButton], and provides methods to access color, etc.
/// Can be used in [EqThemeData.defaultIconButtonTheme].
class EqIconButtonThemeData {
  /// The size of the widget. Sets the paddings and the font size.
  final EqWidgetSize size;

  /// Status of the widget. Controls the background color.
  /// Also controls the disabled background color.
  final EqWidgetStatus status;

  /// Appearance of the widget. Has three states (`.filled`, `.outline`, `.ghost`).
  /// Filled has no borders, and displays color set by [status] as its background.
  /// Outline has transparent background, and displays border that has color set by [status].
  /// Ghost has no border and background.
  final EqWidgetAppearance appearance;

  /// Controls the border radius. Can be either `.rectangle`, `.semiRound`, `.round`.
  final EqWidgetShape shape;

  /// Overwrites the color set by [status].
  final Color color;

  const EqIconButtonThemeData({
    this.size,
    this.status,
    this.appearance,
    this.shape,
    this.color,
  });

  /// Merges two [EqIconButtonThemeData]'s.
  EqIconButtonThemeData copyWith({
    EqWidgetSize size,
    EqWidgetStatus status,
    EqWidgetAppearance appearance,
    EqWidgetShape shape,
    Color color,
  }) {
    return EqIconButtonThemeData(
      size: size ?? this.size,
      status: status ?? this.status,
      appearance: appearance ?? this.appearance,
      shape: shape ?? this.shape,
      color: color ?? this.color,
    );
  }

  /// Merges two [EqTextFieldThemeData]'s, giving the prevalence to the second one.
  EqIconButtonThemeData merge(EqIconButtonThemeData other) {
    if (other == null) return this;
    return EqIconButtonThemeData(
      shape: other.shape ?? this.shape,
      status: other.status ?? this.status,
      size: other.size ?? this.size,
      appearance: other.appearance ?? this.appearance,
      color: other.color ?? this.color,
    );
  }

  TextStyle _getTextStyleBasedOnSize({EqThemeData theme}) {
    switch (this.size) {
      case EqWidgetSize.giant:
        return theme.buttonGiant.textStyle;
      case EqWidgetSize.large:
        return theme.buttonLarge.textStyle;
      case EqWidgetSize.medium:
        return theme.buttonMedium.textStyle;
      case EqWidgetSize.small:
        return theme.buttonSmall.textStyle;
      case EqWidgetSize.tiny:
        return theme.buttonTiny.textStyle;
      default:
        return theme.buttonMedium.textStyle;
    }
  }

  double getIconSize({EqThemeData theme}) {
    final textStyle = _getTextStyleBasedOnSize(theme: theme);
    return textStyle.fontSize * textStyle.height + 2.0;
  }

  Color getIconColor({EqThemeData theme, bool disabled}) {
    if (disabled) return theme.textDisabledColor;
    if (this.appearance == EqWidgetAppearance.filled)
      return theme.textControlColor;
    else
      return color ?? theme.getColorsForStatus(status: this.status).shade500;
  }

  BorderRadius getBorderRadius({EqThemeData theme}) {
    var defaultShape = this.shape ?? theme.defaultWidgetShape;
    return BorderRadius.circular(theme.borderRadius *
        WidgetShapeUtils.getMultiplier(shape: defaultShape));
  }

  EdgeInsets getPadding({EqThemeData theme}) {
    return EdgeInsets.all(
        WidgetSizeUtils.getPadding(size: size).vertical / 2.0);
  }

  Color getFillColor({EqThemeData theme, bool disabled}) {
    if (disabled) return theme.backgroundBasicColors.color3;
    return (appearance == EqWidgetAppearance.filled)
        ? theme.getColorsForStatus(status: status).shade500
        : Colors.transparent;
  }

  Color getBorderColor({EqThemeData theme, bool disabled}) {
    if (disabled) return theme.backgroundBasicColors.color4;
    return theme.getColorsForStatus(status: status).shade500;
  }

  Border getBorder({EqThemeData theme, bool disabled}) {
    return (appearance == EqWidgetAppearance.outline)
        ? Border.all(
            color: getBorderColor(theme: theme, disabled: disabled),
            width: 2.0,
          )
        : null;
  }
}
