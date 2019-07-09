import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';

/// A class that contains the customizations for [EqProgressBar], and provides methods to access color, etc.
/// Can be used in [EqThemeData.defaultProgressBarTheme].
class EqProgressBarThemeData {
  /// Controls the color of progress bar.
  final WidgetStatus status;

  /// Controls the size of progress bar.
  final WidgetSize size;

  /// Controls the shape of progress bar.
  final WidgetShape shape;

  const EqProgressBarThemeData({
    this.status,
    this.size,
    this.shape,
  });

  /// Merges two [EqProgressBarThemeData]'s.
  EqProgressBarThemeData copyWith({
    WidgetStatus status,
    WidgetSize size,
    WidgetShape shape,
  }) {
    return EqProgressBarThemeData(
      status: status ?? this.status,
      size: size ?? this.size,
      shape: shape ?? this.shape,
    );
  }

  /// Merges two [EqTextFieldThemeData]'s, giving the prevalence to the second one.
  EqProgressBarThemeData merge(EqProgressBarThemeData other) {
    if (other == null) return this;
    return EqProgressBarThemeData(
      shape: other.shape ?? this.shape,
      status: other.status ?? this.status,
      size: other.size ?? this.size,
    );
  }

  double getHeight() {
    switch (size) {
      case WidgetSize.giant:
        return 28.0;
      case WidgetSize.large:
        return 24.0;
      case WidgetSize.medium:
        return 22.0;
      case WidgetSize.small:
        return 20.0;
      case WidgetSize.tiny:
        return 16.0;
      default:
        return 22.0;
    }
  }

  TextStyle getTextStyle({EqThemeData theme}) {
    switch (size) {
      case WidgetSize.giant:
        return theme.subtitle1.textStyle.copyWith(height: 1.0);
      case WidgetSize.large:
        return theme.subtitle1.textStyle.copyWith(height: 1.0);
      case WidgetSize.medium:
        return theme.subtitle1.textStyle.copyWith(height: 1.0);
      case WidgetSize.small:
        return theme.subtitle2.textStyle.copyWith(height: 1.0);
      case WidgetSize.tiny:
        return theme.subtitle2.textStyle.copyWith(height: 1.0);
      default:
        return theme.subtitle1.textStyle.copyWith(height: 1.0);
    }
  }

  Color getBackgroundColor({EqThemeData theme}) {
    return theme.backgroundBasicColors.color3;
  }

  Color getProgressColor({EqThemeData theme}) {
    return theme.getColorsForStatus(status: status).shade500;
  }

  BorderRadius getBorderRadius({EqThemeData theme}) {
    var defaultShape = this.shape ?? theme.defaultWidgetShape;
    return BorderRadius.circular(theme.borderRadius *
        WidgetShapeUtils.getMultiplier(shape: defaultShape));
  }
}
