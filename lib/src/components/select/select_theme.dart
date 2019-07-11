import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';

/// This is used to style Selects globally. Set this in [EqThemeData.defaultSelectTheme].
class EqSelectThemeData {
  /// Controls select's border radius
  final EqWidgetShape shape;

  /// Controls select's color
  final EqWidgetStatus status;

  /// Merges two [EqSelectThemeData]'s.
  EqSelectThemeData copyWith({
    EqWidgetShape shape,
    EqWidgetStatus status,
  }) {
    return EqSelectThemeData(
      shape: shape ?? this.shape,
      status: status ?? this.status,
    );
  }

  /// Merges two [EqSelectThemeData]'s, giving the prevalence to the second one.
  EqSelectThemeData merge(EqSelectThemeData other) {
    if (other == null) return this;
    return EqSelectThemeData(
      shape: other.shape ?? this.shape,
      status: other.status ?? this.status,
    );
  }

  const EqSelectThemeData({
    this.shape,
    this.status,
  });

  Color getBorderColor({EqThemeData theme, bool disabled}) {
    if (disabled) {
      return theme.borderBasicColors.color4;
    } else {
      return (status != null)
          ? theme.getColorsForStatus(status: status).shade500
          : theme.borderBasicColors.color3;
    }
  }

  Color getFocusedBorderColor({EqThemeData theme}) {
    return (status != null)
        ? theme.getColorsForStatus(status: status).shade500
        : theme.primary.shade500;
  }

  BorderRadius getBorderRadius({EqThemeData theme}) {
    var defaultShape = this.shape ?? theme.defaultWidgetShape;
    return BorderRadius.circular(theme.borderRadius *
        WidgetShapeUtils.getMultiplier(shape: defaultShape));
  }

  EdgeInsets getPadding({EqThemeData theme}) {
    return EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0);
  }

  Color getBackgroundColor({EqThemeData theme, bool disabled}) {
    if (disabled) return theme.backgroundBasicColors.color3;

    return theme.backgroundBasicColors.color2;
  }

  Color getTextColor({EqThemeData theme, bool disabled}) {
    if (disabled) return theme.textDisabledColor;
    return theme.textHintColor;
  }
}
