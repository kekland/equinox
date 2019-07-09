import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';

/// A class that contains the customizations for [EqButton], and provides methods to access color, etc.
/// Can be used in [EqThemeData.defaultButtonTheme].
class EqButtonThemeData {
  /// The size of the widget. Sets the paddings and the font size.
  final WidgetSize size;

  /// Status of the widget. Controls the background color.
  /// Also controls the disabled background color.
  final WidgetStatus status;

  /// Appearance of the widget. Has three states (`.filled`, `.outline`, `.ghost`).
  /// Filled has no borders, and displays color set by [status] as its background.
  /// Outline has transparent background, and displays border that has color set by [status].
  /// Ghost has no border and background.
  final WidgetAppearance appearance;

  /// Controls the border radius. Can be either `.rectangle`, `.semiRound`, `.round`.
  final WidgetShape shape;

  /// Controls the position of the icon. Can be either `.left`, `.right` or `.none`, which displays no icon.
  final Positioning iconPosition;

  const EqButtonThemeData({
    this.size,
    this.status,
    this.appearance,
    this.shape,
    this.iconPosition,
  });

  /// Merges two [EqButtonThemeData]'s.
  EqButtonThemeData copyWith({
    WidgetSize size,
    WidgetStatus status,
    WidgetAppearance appearance,
    WidgetShape shape,
    Positioning iconPosition,
  }) {
    return EqButtonThemeData(
      size: size ?? this.size,
      status: status ?? this.status,
      appearance: appearance ?? this.appearance,
      shape: shape ?? this.shape,
      iconPosition: iconPosition ?? this.iconPosition,
    );
  }

  /// Merges two [EqButtonThemeData]'s, giving the prevalence to the second one.
  EqButtonThemeData merge(EqButtonThemeData other) {
    if (other == null) return this;
    return EqButtonThemeData(
      size: other.size ?? size,
      iconPosition: other.iconPosition ?? iconPosition,
      shape: other.shape ?? shape,
      status: other.status ?? status,
      appearance: other.appearance ?? appearance,
    );
  }

  TextStyle _getTextStyleBasedOnSize({EqThemeData theme}) {
    switch (this.size) {
      case WidgetSize.giant:
        return theme.buttonGiant.textStyle;
      case WidgetSize.large:
        return theme.buttonLarge.textStyle;
      case WidgetSize.medium:
        return theme.buttonMedium.textStyle;
      case WidgetSize.small:
        return theme.buttonSmall.textStyle;
      case WidgetSize.tiny:
        return theme.buttonTiny.textStyle;
      default:
        return theme.buttonMedium.textStyle;
    }
  }

  Color _getTextColorWithoutStyling({EqThemeData theme, bool disabled}) {
    if (disabled) return theme.textDisabledColor;
    if (this.appearance == WidgetAppearance.filled)
      return theme.textControlColor;
    else
      return theme.getColorsForStatus(status: this.status).shade500;
  }

  TextStyle getTextStyle({EqThemeData theme, bool disabled = false}) {
    var style = _getTextStyleBasedOnSize(theme: theme);
    style = style.copyWith(
        color: _getTextColorWithoutStyling(theme: theme, disabled: disabled));

    return style;
  }

  Color getTextColor({EqThemeData theme, bool disabled = false}) {
    return getTextStyle(theme: theme, disabled: disabled).color;
  }

  Color getFillColor({EqThemeData theme, bool disabled = false}) {
    if (disabled) return theme.backgroundBasicColors.color3;

    return (this.appearance == WidgetAppearance.filled)
        ? theme.getColorsForStatus(status: this.status).shade500
        : Colors.transparent;
  }

  Color getBorderColor({EqThemeData theme, bool disabled = false}) {
    if (disabled) return theme.backgroundBasicColors.color4;

    return theme.getColorsForStatus(status: this.status).shade500;
  }

  double getIconSize({EqThemeData theme, bool disabled = false}) {
    var textStyle = getTextStyle(theme: theme, disabled: disabled);
    return textStyle.fontSize * textStyle.height + 2.0;
  }

  BorderRadius getBorderRadius({EqThemeData theme}) {
    var defaultShape = this.shape ?? theme.defaultWidgetShape;
    return BorderRadius.circular(theme.borderRadius *
        WidgetShapeUtils.getMultiplier(shape: defaultShape));
  }

  EdgeInsets getPadding({EqThemeData theme}) {
    return WidgetSizeUtils.getPadding(size: size);
  }

  Border getBorder({EqThemeData theme, bool disabled}) {
    if (appearance == WidgetAppearance.outline) {
      return Border.all(
        color: getBorderColor(theme: theme, disabled: disabled),
        width: 2.0,
      );
    }
    return null;
  }
}
