import 'package:flutter/widgets.dart';

enum WidgetSize {
  giant,
  large,
  medium,
  small,
  tiny,
}

enum WidgetState {
  normal,
  hover,
  active,
  focus,
  disabled,
}

enum WidgetStatus {
  primary,
  success,
  info,
  warning,
  danger,
  basic,
}

enum WidgetShape {
  rectangle,
  round,
  semiRound,
}

enum WidgetAppearance {
  filled,
  outline,
  ghost,
}

enum Positioning {
  left,
  right,
  none,
}

class WidgetSizeUtils {
  static double getSizeValue({WidgetSize size}) {
    switch (size) {
      case WidgetSize.giant:
        return 56.0;
      case WidgetSize.large:
        return 48.0;
      case WidgetSize.medium:
        return 40.0;
      case WidgetSize.small:
        return 32.0;
      case WidgetSize.tiny:
        return 24.0;
      default:
        return 40.0;
    }
  }

  static EdgeInsets getPadding({WidgetSize size}) {
    switch (size) {
      case WidgetSize.giant:
        return EdgeInsets.symmetric(vertical: 14.0, horizontal: 22.0);
      case WidgetSize.large:
        return EdgeInsets.symmetric(vertical: 12.0, horizontal: 18.0);
      case WidgetSize.medium:
        return EdgeInsets.symmetric(vertical: 10.0, horizontal: 18.0);
      case WidgetSize.small:
        return EdgeInsets.symmetric(vertical: 6.0, horizontal: 14.0);
      case WidgetSize.tiny:
        return EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0);
      default:
        return EdgeInsets.symmetric(vertical: 10.0, horizontal: 18.0);
    }
  }
}

class WidgetShapeUtils {
  static double getMultiplier({WidgetShape shape}) {
    switch (shape) {
      case WidgetShape.rectangle:
        return 1.0;
      case WidgetShape.round:
        return 360.0; // Fix this
      case WidgetShape.semiRound:
        return 3.0;
      default:
        return 1.0;
    }
  }
}
