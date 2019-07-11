import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';

/// A class that contains the customizations for [EqSpinner], and provides methods to access color, etc.
/// Can be used in [EqThemeData.defaultSpinnerTheme].
class EqSpinnerThemeData {
  /// Status of the widget. Controls the background color.
  final EqWidgetStatus status;

  /// Controls the size of the spinner.
  final EqWidgetSize size;

  const EqSpinnerThemeData({
    this.status,
    this.size,
  });

  /// Merges two [EqSpinnerThemeData]'s.
  EqSpinnerThemeData copyWith({
    EqWidgetStatus status,
    EqWidgetSize size,
  }) {
    return EqSpinnerThemeData(
      status: status ?? this.status,
      size: size ?? this.size,
    );
  }

  /// Merges two [EqSpinnerThemeData]'s.
  EqSpinnerThemeData merge(EqSpinnerThemeData other) {
    if (other == null) return this;
    return EqSpinnerThemeData(
      status: other.status ?? this.status,
      size: other.size ?? this.size,
    );
  }

  Color getColor({EqThemeData theme}) {
    return theme.getColorsForStatus(status: status).shade500;
  }

  double getSize() {
    switch (size) {
      case EqWidgetSize.giant:
        return 40.0;
      case EqWidgetSize.large:
        return 36.0;
      case EqWidgetSize.medium:
        return 32.0;
      case EqWidgetSize.small:
        return 28.0;
      case EqWidgetSize.tiny:
        return 24.0;
      default:
        return 24.0;
    }
  }

  double getStrokeWidth() {
    switch (size) {
      case EqWidgetSize.giant:
        return 7.0;
      case EqWidgetSize.large:
        return 6.0;
      case EqWidgetSize.medium:
        return 5.0;
      case EqWidgetSize.small:
        return 4.0;
      case EqWidgetSize.tiny:
        return 3.0;
      default:
        return 5.0;
    }
  }
}
