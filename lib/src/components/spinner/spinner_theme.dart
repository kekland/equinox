import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';

/// A class that contains the customizations for [EqSpinner], and provides methods to access color, etc.
/// Can be used in [EqThemeData.defaultSpinnerTheme].
class EqSpinnerThemeData {
  /// Status of the widget. Controls the background color.
  final WidgetStatus status;

  /// Controls the size of the spinner.
  final WidgetSize size;

  const EqSpinnerThemeData({
    this.status,
    this.size,
  });

  /// Merges two [EqSpinnerThemeData]'s.
  EqSpinnerThemeData copyWith({
    WidgetStatus status,
    WidgetSize size,
  }) {
    return EqSpinnerThemeData(
      status: status ?? this.status,
      size: size ?? this.size,
    );
  }

  Color getColor({EqThemeData theme}) {
    return theme.getColorsForStatus(status: status).shade500;
  }
  double getSize() {
    switch (size) {
      case WidgetSize.giant:
        return 40.0;
      case WidgetSize.large:
        return 36.0;
      case WidgetSize.medium:
        return 32.0;
      case WidgetSize.small:
        return 28.0;
      case WidgetSize.tiny:
        return 24.0;
      default:
        return 24.0;
    }
  }
  
  double getStrokeWidth() {
    switch (size) {
      case WidgetSize.giant:
        return 7.0;
      case WidgetSize.large:
        return 6.0;
      case WidgetSize.medium:
        return 5.0;
      case WidgetSize.small:
        return 4.0;
      case WidgetSize.tiny:
        return 3.0;
      default:
        return 5.0;
    }
  }
}
