import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';

/// This is used to style TextFields globally. Set this in `EqThemeData.defaultTextFieldTheme`.
class EqTextFieldThemeData {
  /// Controls text field's border radius
  final WidgetShape shape;

  /// Controls text field's color
  final WidgetStatus status;

  /// Controls the position of the icon inside the text field
  final Positioning iconPosition;

  /// Merges two [EqTextFieldThemeData]'s.
  EqTextFieldThemeData copyWith({
    WidgetShape shape,
    WidgetStatus status,
    Positioning iconPosition,
  }) {
    return EqTextFieldThemeData(
      shape: shape ?? this.shape,
      status: status ?? this.status,
      iconPosition: iconPosition ?? this.iconPosition,
    );
  }

  /// Merges two [EqTextFieldThemeData]'s, giving the prevalence to the second one.
  EqTextFieldThemeData merge(EqTextFieldThemeData other) {
    if (other == null) return this;
    return EqTextFieldThemeData(
      shape: other.shape ?? this.shape,
      status: other.status ?? this.status,
      iconPosition: other.iconPosition ?? this.iconPosition,
    );
  }

  const EqTextFieldThemeData({
    this.shape,
    this.status,
    this.iconPosition,
  });

  Color getBorderColor({EqThemeData theme, bool errored}) {
    if (errored) {
      return theme.danger.shade500;
    } else {
      return (status != null)
          ? theme.getColorsForStatus(status: status).shade500
          : theme.borderBasicColors.color3;
    }
  }

  Color getFocusedBorderColor({EqThemeData theme, bool errored}) {
    if (errored) {
      return theme.danger.shade500;
    } else {
      return (status != null)
          ? theme.getColorsForStatus(status: status).shade500
          : theme.primary.shade500;
    }
  }

  Color getErroredBorderColor({EqThemeData theme}) {
    return theme.danger.shade500;
  }

  Color getDisabledBorderColor({EqThemeData theme}) {
    return theme.borderBasicColors.color3;
  }

  BorderRadius getBorderRadius({EqThemeData theme}) {
    var defaultShape = this.shape ?? theme.defaultWidgetShape;
    return BorderRadius.circular(theme.borderRadius *
        WidgetShapeUtils.getMultiplier(shape: defaultShape));
  }

  EdgeInsets getPadding({EqThemeData theme}) {
    return EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0);
  }

  Color getBackgroundColor({EqThemeData theme}) {
    return theme.backgroundBasicColors.color2;
  }
}
