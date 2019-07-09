import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';

/// A class that contains all the customizations for [EqButton], and provides methods to access color, etc.
/// Can be used in [EqThemeData], or in [EqButtonTheme] widget.
class EqButtonThemeData {
  /// The size of the widget. Sets the paddings (ignored if [padding] is non-null), also the font size.
  final WidgetSize size;

  /// Status of the widget. Controls the background color (ignored if [backgroundColor] is non-null).
  /// Also controls the disabled background color (ignored if [backgroundDisabledColor] is non-null).
  final WidgetStatus status;

  /// Appearance of the widget. Has three states (`.filled`, `.outline`, `.ghost`).
  /// Filled has no borders, and displays color set by [backgroundColor] or [status] as its background.
  /// Outline has transparent background, and displays border that has color set by [borderColor] or [status].
  /// Ghost has no border and background.
  final WidgetAppearance appearance;

  /// Controls the border radius. Can be either `.rectangle`, `.semiRound`, `.round`. Will be overwritten
  /// if [borderRadius] is present.
  final WidgetShape shape;

  /// Controls the border's color. Will overwrite the color set by [status].
  final Color borderColor;
  
  /// Controls the border's color when button is disabled. Will overwrite the color set by [status].
  final Color borderDisabledColor;
  
  /// Controls the background color. Will overwrite the color set by [status].
  final Color backgroundColor;
  
  /// Controls the background color when button is disabled. Will overwrite the color set by [status].
  final Color backgroundDisabledColor;

  /// Controls the styling of the label. Will be merged with [activeTextStyle] or [disabledTextStyle] and the
  /// text style provided by application's theme.
  final TextStyle textStyle;

  /// Controls the styling of the label when the button is not disabled. See [textStyle].
  final TextStyle activeTextStyle;
  
  /// Controls the styling of the label when the button is disabled. See [textStyle].
  final TextStyle disabledTextStyle;

  /// Controls the position of the icon. Can be either `.left`, `.right` or `.none`, which displays no icon.
  final Positioning iconPosition;

  /// Controls the border radius of the button. Overwrites the value set by [shape].
  final BorderRadius borderRadius;
  
  /// Controls the padding of the button. Overwrites the value set by [size].
  final EdgeInsets padding;

  const EqButtonThemeData({
    this.size,
    this.status,
    this.appearance,
    this.shape,
    this.borderColor,
    this.borderDisabledColor,
    this.backgroundColor,
    this.backgroundDisabledColor,
    this.textStyle,
    this.activeTextStyle,
    this.disabledTextStyle,
    this.iconPosition,
    this.borderRadius,
    this.padding,
  });

  /// Merges two [EqButtonThemeData]'s.
  EqButtonThemeData copyWith({
    WidgetSize size,
    WidgetStatus status,
    WidgetAppearance appearance,
    WidgetShape shape,
    Color outlineColor,
    Color outlineDisabledColor,
    Color backgroundColor,
    Color backgroundDisabledColor,
    TextStyle textStyle,
    TextStyle activeTextStyle,
    TextStyle disabledTextStyle,
    Positioning iconPosition,
  }) {
    return EqButtonThemeData(
      size: size ?? this.size,
      status: status ?? this.status,
      appearance: appearance ?? this.appearance,
      shape: shape ?? this.shape,
      borderColor: outlineColor ?? this.borderColor,
      borderDisabledColor: outlineDisabledColor ?? this.borderDisabledColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      backgroundDisabledColor:
          backgroundDisabledColor ?? this.backgroundDisabledColor,
      textStyle: textStyle ?? this.textStyle,
      activeTextStyle: activeTextStyle ?? this.activeTextStyle,
      disabledTextStyle: disabledTextStyle ?? this.disabledTextStyle,
      iconPosition: iconPosition ?? this.iconPosition,
    );
  }

  /// Merges two [EqButtonThemeData]'s, giving the prevalence to the second one.
  EqButtonThemeData merge(EqButtonThemeData other) {
    if(other == null) return this;
    return EqButtonThemeData(
      size: other.size ?? size,
      activeTextStyle: other.activeTextStyle ?? activeTextStyle,
      appearance: other.appearance ?? appearance,
      backgroundColor: other.backgroundColor ?? backgroundColor,
      backgroundDisabledColor:
          other.backgroundDisabledColor ?? backgroundDisabledColor,
      disabledTextStyle: other.disabledTextStyle ?? disabledTextStyle,
      iconPosition: other.iconPosition ?? iconPosition,
      borderColor: other.borderColor ?? borderColor,
      borderDisabledColor: other.borderDisabledColor ?? borderDisabledColor,
      shape: other.shape ?? shape,
      status: other.status ?? status,
      textStyle: other.textStyle ?? textStyle,
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

    style = style.merge(this.textStyle);

    if (!disabled) {
      style = style.merge(this.activeTextStyle);
    } else if (disabled) {
      style = style.merge(this.disabledTextStyle);
    }

    return style;
  }

  Color getTextColor({EqThemeData theme, bool disabled = false}) {
    return getTextStyle(theme: theme, disabled: disabled).color;
  }

  Color getFillColor({EqThemeData theme, bool disabled = false}) {
    if (disabled)
      return this.backgroundDisabledColor ?? theme.backgroundBasicColors.color3;

    return (this.appearance == WidgetAppearance.filled)
        ? this.backgroundColor ??
            theme.getColorsForStatus(status: this.status).shade500
        : Colors.transparent;
  }

  Color getBorderColor({EqThemeData theme, bool disabled = false}) {
    if (disabled)
      return this.borderDisabledColor ?? theme.backgroundBasicColors.color4;

    return this.borderColor ??
        theme.getColorsForStatus(status: this.status).shade500;
  }

  double getIconSize({EqThemeData theme, bool disabled = false}) {
    var textStyle = getTextStyle(theme: theme, disabled: disabled);
    return textStyle.fontSize * textStyle.height + 2.0;
  }

  BorderRadius getBorderRadius({EqThemeData theme}) {
    if (this.borderRadius != null) return this.borderRadius;

    var defaultShape = this.shape ?? theme.defaultWidgetShape;
    return BorderRadius.circular(theme.borderRadius *
        WidgetShapeUtils.getMultiplier(shape: defaultShape));
  }

  EdgeInsets getPadding({EqThemeData theme}) {
    if (this.padding != null) return this.padding;

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
