import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';

/// A class that can be used to decorate the [EqTextField]. Usually used in conjunction with [EqTextFieldTheme]
/// or in the theme's [EqThemeData.defaultTextFieldTheme] field.
class EqTextFieldThemeData {
  /// Controls text field's border radius
  final WidgetShape shape;

  /// Controls text field's color
  final WidgetStatus status;

  /// Controls the position of the icon inside the text field
  final Positioning iconPosition;

  /// Merges the default label style with one provided.
  final TextStyle labelStyle;
  /// Merges the default hint style with one provided.
  final TextStyle hintStyle;
  /// Merges the default text style with one provided.
  final TextStyle textStyle;
  /// Merges the default description style with one provided.
  final TextStyle descriptionStyle;
  /// Merges the default error style with one provided.
  final TextStyle errorStyle;

  /// Overwrites the border's error color.
  final Color borderErrorColor;
  
  /// Overwrites the border's default color.
  final Color borderColor;
  
  /// Overwrites the border's disabled color.
  final Color borderDisabledColor;
  
  /// Overwrites the border's focused color color.
  final Color borderFocusedColor;

  /// Overwrites the text field's default background color.
  final Color backgroundColor;
  
  /// Overwrites the text field's padding.
  final EdgeInsets padding;
  
  /// Overwrites the [shape] parameter.
  final BorderRadius borderRadius;

  /// Merges two [EqTextFieldThemeData]'s.
  EqTextFieldThemeData copyWith({
    WidgetShape shape,
    WidgetStatus status,
    Positioning iconPosition,
    TextStyle labelStyle,
    TextStyle hintStyle,
    TextStyle textStyle,
    TextStyle descriptionStyle,
    TextStyle errorStyle,
    Color borderErrorColor,
    Color borderColor,
    Color borderDisabledColor,
    Color borderFocusedColor,
    Color backgroundColor,
    EdgeInsets padding,
    BorderRadius borderRadius,
  }) {
    return EqTextFieldThemeData(
      shape: shape ?? this.shape,
      status: status ?? this.status,
      iconPosition: iconPosition ?? this.iconPosition,
      labelStyle: labelStyle ?? this.labelStyle,
      hintStyle: hintStyle ?? this.hintStyle,
      textStyle: textStyle ?? this.textStyle,
      descriptionStyle: descriptionStyle ?? this.descriptionStyle,
      errorStyle: errorStyle ?? this.errorStyle,
      borderErrorColor: borderErrorColor ?? this.borderErrorColor,
      borderColor: borderColor ?? this.borderColor,
      borderDisabledColor: borderDisabledColor ?? this.borderDisabledColor,
      borderFocusedColor: borderFocusedColor ?? this.borderFocusedColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      padding: padding ?? this.padding,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  /// Merges two [EqTextFieldThemeData]'s, giving the prevalence to the second one.
  EqTextFieldThemeData merge(EqTextFieldThemeData other) {
    if (other == null) return this;
    return EqTextFieldThemeData(
      shape: other.shape ?? this.shape,
      status: other.status ?? this.status,
      iconPosition: other.iconPosition ?? this.iconPosition,
      labelStyle: other.labelStyle ?? this.labelStyle,
      hintStyle: other.hintStyle ?? this.hintStyle,
      textStyle: other.textStyle ?? this.textStyle,
      descriptionStyle: other.descriptionStyle ?? this.descriptionStyle,
      errorStyle: other.errorStyle ?? this.errorStyle,
      borderErrorColor: other.borderErrorColor ?? this.borderErrorColor,
      borderColor: other.borderColor ?? this.borderColor,
      borderDisabledColor:
          other.borderDisabledColor ?? this.borderDisabledColor,
      borderFocusedColor: other.borderFocusedColor ?? this.borderFocusedColor,
      backgroundColor: other.backgroundColor ?? this.backgroundColor,
      padding: other.padding ?? this.padding,
      borderRadius: other.borderRadius ?? this.borderRadius,
    );
  }

  const EqTextFieldThemeData({
    this.shape,
    this.status,
    this.iconPosition,
    this.labelStyle,
    this.hintStyle,
    this.textStyle,
    this.descriptionStyle,
    this.errorStyle,
    this.borderErrorColor,
    this.borderColor,
    this.borderFocusedColor,
    this.borderDisabledColor,
    this.padding,
    this.borderRadius,
    this.backgroundColor,
  });

  Color getBorderColor({EqThemeData theme, bool errored}) {
    if (errored) {
      return this.borderErrorColor ?? theme.danger.shade500;
    } else {
      return this.borderColor ?? (status != null)
          ? theme.getColorsForStatus(status: status).shade500
          : theme.borderBasicColors.color3;
    }
  }

  Color getFocusedBorderColor({EqThemeData theme, bool errored}) {
    if (errored) {
      return this.borderErrorColor ?? theme.danger.shade500;
    } else {
      return this.borderColor ?? (status != null)
          ? theme.getColorsForStatus(status: status).shade500
          : theme.primary.shade500;
    }
  }

  Color getErroredBorderColor({EqThemeData theme}) {
    return this.borderErrorColor ?? theme.danger.shade500;
  }

  Color getDisabledBorderColor({EqThemeData theme}) {
    return this.borderDisabledColor ?? theme.borderBasicColors.color3;
  }

  BorderRadius getBorderRadius({EqThemeData theme}) {
    if (this.borderRadius != null) return this.borderRadius;
    var defaultShape = this.shape ?? theme.defaultWidgetShape;
    return BorderRadius.circular(theme.borderRadius *
        WidgetShapeUtils.getMultiplier(shape: defaultShape));
  }

  EdgeInsets getPadding({EqThemeData theme}) {
    if (this.padding != null) return this.padding;
    return EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0);
  }

  Color getBackgroundColor({EqThemeData theme}) {
    return this.backgroundColor ?? theme.backgroundBasicColors.color2;
  }
}
