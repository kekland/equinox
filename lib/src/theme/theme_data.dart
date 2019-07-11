import 'dart:convert';

import 'package:equinox/equinox.dart';
import 'package:equinox/src/components/icon/icon_theme.dart';
import 'package:equinox/src/theme/themings/animation_theme.dart';
import 'package:equinox/src/theme/themings/border_radius_theme.dart';
import 'package:equinox/src/theme/themings/divider_theme.dart';
import 'package:equinox/src/theme/themings/text_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class EqThemeData {
  final ColorGroup primary;
  final ColorGroup success;
  final ColorGroup info;
  final ColorGroup warning;
  final ColorGroup danger;
  final ColorGroup basic;

  final BoxShadow shadow;
  final EqWidgetShape widgetShape;

  final EqTextThemeData textTheme;
  final EqBackgroundThemeData backgroundTheme;
  final EqBorderThemeData borderTheme;
  final EqBorderRadiusThemeData borderRadiusTheme;
  final EqAnimationThemeData majorAnimationTheme;
  final EqAnimationThemeData minorAnimationTheme;

  factory EqThemeData({
    @required String primaryFontFamily,
    @required String secondaryFontFamily,
    @required ColorGroup primary,
    @required ColorGroup success,
    @required ColorGroup info,
    @required ColorGroup warning,
    @required ColorGroup danger,
    @required ColorGroup basic,
    EqAnimationThemeData majorAnimationTheme,
    EqAnimationThemeData minorAnimationTheme,
    EqWidgetShape widgetShape,
    EqTextThemeData textTheme,
  }) {
    return EqThemeData.configure(
      primaryFontFamily: primaryFontFamily,
      secondaryFontFamily: secondaryFontFamily,
      primary: primary,
      success: success,
      info: info,
      warning: warning,
      danger: danger,
      basic: basic,
      majorAnimationTheme: majorAnimationTheme,
      minorAnimationTheme: minorAnimationTheme,
      textTheme: textTheme,
      widgetShape: widgetShape,
    );
  }
  factory EqThemeData.configure({
    @required String primaryFontFamily,
    @required String secondaryFontFamily,
    @required ColorGroup primary,
    @required ColorGroup success,
    @required ColorGroup info,
    @required ColorGroup warning,
    @required ColorGroup danger,
    @required ColorGroup basic,
    EqTextThemeData textTheme,
    EqWidgetShape widgetShape = EqWidgetShape.rectangle,
    EqAnimationThemeData majorAnimationTheme,
    EqAnimationThemeData minorAnimationTheme,
    EqBorderThemeData borderTheme,
    EqBorderRadiusThemeData borderRadiusTheme,
    BoxShadow shadow = const BoxShadow(
      offset: Offset(0.0, 8.0),
      blurRadius: 16.0,
      spreadRadius: 0.0,
      color: Color.fromRGBO(44, 51, 73, 0.1),
    ),
  }) {
    final defaultTextTheme = EqTextThemeData(
      textBasicColor: basic.shade900,
      textAlternateColor: basic.shade100,
      textControlColor: basic.shade100,
      textDisabledColor: basic.shade500,
      textHintColor: basic.shade600,
      heading1: TextStyle(
        fontSize: 36.0,
        fontWeight: FontWeight.w800,
        fontFamily: secondaryFontFamily,
      ),
      heading2: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.w800,
        fontFamily: secondaryFontFamily,
      ),
      heading3: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.w800,
        fontFamily: secondaryFontFamily,
      ),
      heading4: TextStyle(
        fontSize: 26.0,
        fontWeight: FontWeight.w800,
        fontFamily: secondaryFontFamily,
      ),
      heading5: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.w800,
        fontFamily: secondaryFontFamily,
      ),
      heading6: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w800,
        fontFamily: secondaryFontFamily,
      ),
      subtitle1: TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.w600,
        fontFamily: primaryFontFamily,
      ),
      subtitle2: TextStyle(
        fontSize: 13.0,
        fontWeight: FontWeight.w600,
        fontFamily: primaryFontFamily,
      ),
      paragraph1: TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.w400,
        fontFamily: primaryFontFamily,
      ),
      paragraph2: TextStyle(
        fontSize: 13.0,
        fontWeight: FontWeight.w400,
        fontFamily: primaryFontFamily,
      ),
      label: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w800,
        fontFamily: primaryFontFamily,
      ),
      caption1: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
        fontFamily: primaryFontFamily,
      ),
      caption2: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w600,
        fontFamily: primaryFontFamily,
      ),
    );
    final defaultMajorAnimationTheme = EqAnimationThemeData(
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 250),
    );
    final defaultMinorAnimationTheme = const EqAnimationThemeData(
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 150),
    );
    final defaultBorderTheme = EqBorderThemeData(
      width: 1.0,
      color: basic.shade300,
      colorDisabled: basic.shade400,
    );
    final defaultBorderRadiusTheme = EqBorderRadiusThemeData(
      rectangleRadius: 4.0,
      semiRoundRadius: 12.0,
    );

    return EqThemeData.raw(
      primary: primary,
      success: success,
      info: info,
      warning: warning,
      danger: danger,
      basic: basic,
      shadow: shadow,
      widgetShape: widgetShape,
      backgroundTheme: EqBackgroundThemeData(
        color: basic.shade300,
        colorDisabled: basic.shade200,
      ),
      textTheme: defaultTextTheme.merge(textTheme),
      borderRadiusTheme: defaultBorderRadiusTheme.merge(borderRadiusTheme),
      borderTheme: defaultBorderTheme.merge(borderTheme),
      majorAnimationTheme:
          defaultMajorAnimationTheme.merge(majorAnimationTheme),
      minorAnimationTheme:
          defaultMinorAnimationTheme.merge(minorAnimationTheme),
    );
  }

  EqThemeData.raw({
    this.primary,
    this.success,
    this.info,
    this.warning,
    this.danger,
    this.basic,
    this.shadow,
    this.widgetShape,
    this.textTheme,
    this.backgroundTheme,
    this.borderTheme,
    this.borderRadiusTheme,
    this.majorAnimationTheme,
    this.minorAnimationTheme,
  });

  ColorGroup getColorsForStatus({EqWidgetStatus status}) {
    switch (status) {
      case EqWidgetStatus.primary:
        return primary;
      case EqWidgetStatus.success:
        return success;
      case EqWidgetStatus.info:
        return info;
      case EqWidgetStatus.warning:
        return warning;
      case EqWidgetStatus.danger:
        return danger;
      case EqWidgetStatus.basic:
        return basic;
      default:
        return null;
    }
  }

  Color getColorForStatus({EqWidgetStatus status, double opacity = 1.0}) {
    switch (status) {
      case EqWidgetStatus.primary:
        return primary.shade500.withOpacity(opacity);
      case EqWidgetStatus.success:
        return success.shade500.withOpacity(opacity);
      case EqWidgetStatus.info:
        return info.shade500.withOpacity(opacity);
      case EqWidgetStatus.warning:
        return warning.shade500.withOpacity(opacity);
      case EqWidgetStatus.danger:
        return danger.shade500.withOpacity(opacity);
      case EqWidgetStatus.basic:
        return basic.shade500.withOpacity(opacity);
      default:
        return null;
    }
  }

  EqThemeData extend({
    ColorGroup primary,
    ColorGroup success,
    ColorGroup info,
    ColorGroup warning,
    ColorGroup danger,
    ColorGroup basic,
    ColorStates primaryStates,
    ColorStates successStates,
    ColorStates infoStates,
    ColorStates warningStates,
    ColorStates dangerStates,
    ColorStates basicStates,
    BackgroundColors backgroundBasicColors,
    BorderColors borderBasicColors,
    BackgroundColors backgroundAlternativeColors,
    BorderColors borderAlternativeColors,
    BackgroundColors backgroundPrimaryColors,
    BorderColors borderPrimaryColors,
    Color textBasicColor,
    Color textAlternateColor,
    Color textControlColor,
    Color textDisabledColor,
    Color textHintColor,
    ColorStates textPrimaryStates,
    ColorStates textSuccessStates,
    ColorStates textInfoStates,
    ColorStates textWarningStates,
    ColorStates textDangerStates,
    TextTheme heading1,
    TextTheme heading2,
    TextTheme heading3,
    TextTheme heading4,
    TextTheme heading5,
    TextTheme heading6,
    TextTheme subtitle1,
    TextTheme subtitle2,
    TextTheme paragraph1,
    TextTheme paragraph2,
    TextTheme label,
    TextTheme caption1,
    TextTheme caption2,
    TextTheme buttonTiny,
    TextTheme buttonSmall,
    TextTheme buttonMedium,
    TextTheme buttonLarge,
    TextTheme buttonGiant,
    double borderRadius,
    double outlineWidth,
    Color outlineColor,
    Color dividerColor,
    double dividerWidth,
    BoxShadow shadow,
    BoxShadow heavyShadow,
    Duration minorAnimationDuration,
    Curve minorAnimationCurve,
    Duration majorAnimationDuration,
    Curve majorAnimationCurve,
    EqWidgetShape defaultWidgetShape,
    EqButtonThemeData defaultButtonTheme,
    EqCheckboxThemeData defaultCheckboxTheme,
    EqToggleThemeData defaultToggleTheme,
    EqRadioThemeData defaultRadioTheme,
    EqTextFieldThemeData defaultTextFieldTheme,
    EqSpinnerThemeData defaultSpinnerTheme,
    EqSelectThemeData defaultSelectTheme,
    EqProgressBarThemeData defaultProgressBarTheme,
    EqIconButtonThemeData defaultIconButtonTheme,
  }) {
    return new EqThemeData.raw(
      primary: primary ?? this.primary,
      success: success ?? this.success,
      info: info ?? this.info,
      warning: warning ?? this.warning,
      danger: danger ?? this.danger,
      basic: basic ?? this.basic,
      primaryStates: primaryStates ?? this.primaryStates,
      successStates: successStates ?? this.successStates,
      infoStates: infoStates ?? this.infoStates,
      warningStates: warningStates ?? this.warningStates,
      dangerStates: dangerStates ?? this.dangerStates,
      basicStates: basicStates ?? this.basicStates,
      backgroundBasicColors:
          backgroundBasicColors ?? this.backgroundBasicColors,
      borderBasicColors: borderBasicColors ?? this.borderBasicColors,
      backgroundAlternativeColors:
          backgroundAlternativeColors ?? this.backgroundAlternativeColors,
      borderAlternativeColors:
          borderAlternativeColors ?? this.borderAlternativeColors,
      backgroundPrimaryColors:
          backgroundPrimaryColors ?? this.backgroundPrimaryColors,
      borderPrimaryColors: borderPrimaryColors ?? this.borderPrimaryColors,
      textBasicColor: textBasicColor ?? this.textBasicColor,
      textAlternateColor: textAlternateColor ?? this.textAlternateColor,
      textControlColor: textControlColor ?? this.textControlColor,
      textDisabledColor: textDisabledColor ?? this.textDisabledColor,
      textHintColor: textHintColor ?? this.textHintColor,
      textPrimaryStates: textPrimaryStates ?? this.textPrimaryStates,
      textSuccessStates: textSuccessStates ?? this.textSuccessStates,
      textInfoStates: textInfoStates ?? this.textInfoStates,
      textWarningStates: textWarningStates ?? this.textWarningStates,
      textDangerStates: textDangerStates ?? this.textDangerStates,
      heading1: heading1 ?? this.heading1,
      heading2: heading2 ?? this.heading2,
      heading3: heading3 ?? this.heading3,
      heading4: heading4 ?? this.heading4,
      heading5: heading5 ?? this.heading5,
      heading6: heading6 ?? this.heading6,
      subtitle1: subtitle1 ?? this.subtitle1,
      subtitle2: subtitle2 ?? this.subtitle2,
      paragraph1: paragraph1 ?? this.paragraph1,
      paragraph2: paragraph2 ?? this.paragraph2,
      label: label ?? this.label,
      caption1: caption1 ?? this.caption1,
      caption2: caption2 ?? this.caption2,
      buttonTiny: buttonTiny ?? this.buttonTiny,
      buttonSmall: buttonSmall ?? this.buttonSmall,
      buttonMedium: buttonMedium ?? this.buttonMedium,
      buttonLarge: buttonLarge ?? this.buttonLarge,
      buttonGiant: buttonGiant ?? this.buttonGiant,
      borderRadius: borderRadius ?? this.borderRadius,
      outlineWidth: outlineWidth ?? this.outlineWidth,
      outlineColor: outlineColor ?? this.outlineColor,
      dividerColor: dividerColor ?? this.dividerColor,
      dividerWidth: dividerWidth ?? this.dividerWidth,
      shadow: shadow ?? this.shadow,
      majorAnimationCurve: majorAnimationCurve ?? this.majorAnimationCurve,
      minorAnimationCurve: majorAnimationCurve ?? this.majorAnimationCurve,
      majorAnimationDuration:
          majorAnimationDuration ?? this.majorAnimationDuration,
      minorAnimationDuration:
          minorAnimationDuration ?? this.minorAnimationDuration,
      heavyShadow: heavyShadow ?? this.heavyShadow,
      defaultWidgetShape: defaultWidgetShape ?? this.defaultWidgetShape,
      defaultButtonTheme: (this.defaultButtonTheme == null)
          ? defaultButtonTheme
          : this.defaultButtonTheme.merge(defaultButtonTheme),
      defaultCheckboxTheme: (this.defaultCheckboxTheme == null)
          ? defaultCheckboxTheme
          : this.defaultCheckboxTheme.merge(defaultCheckboxTheme),
      defaultToggleTheme: (this.defaultToggleTheme == null)
          ? defaultToggleTheme
          : this.defaultToggleTheme.merge(defaultToggleTheme),
      defaultRadioTheme: (this.defaultRadioTheme == null)
          ? defaultRadioTheme
          : this.defaultRadioTheme.merge(defaultRadioTheme),
      defaultTextFieldTheme: (this.defaultTextFieldTheme == null)
          ? defaultTextFieldTheme
          : this.defaultTextFieldTheme.merge(defaultTextFieldTheme),
      defaultIconButtonTheme: (this.defaultIconButtonTheme == null)
          ? defaultIconButtonTheme
          : this.defaultIconButtonTheme.merge(defaultIconButtonTheme),
      defaultProgressBarTheme: (this.defaultProgressBarTheme == null)
          ? defaultProgressBarTheme
          : this.defaultProgressBarTheme.merge(defaultProgressBarTheme),
      defaultSelectTheme: (this.defaultSelectTheme == null)
          ? defaultSelectTheme
          : this.defaultSelectTheme.merge(defaultSelectTheme),
      defaultSpinnerTheme: (this.defaultSpinnerTheme == null)
          ? defaultSpinnerTheme
          : this.defaultSpinnerTheme.merge(defaultSpinnerTheme),
    );
  }

  static Future<EqThemeData> loadFromAsset(
      {@required String assetName, bool light = true}) async {
    final contents = await rootBundle.loadString(assetName);
    final value = json.decode(contents);

    return EqThemeData.loadFromJson(data: value, light: light);
  }

  factory EqThemeData.loadFromJson({@required Map data, bool light = true}) {
    Map<EqWidgetStatus, String> widgetStatusAsString = {
      EqWidgetStatus.primary: 'primary',
      EqWidgetStatus.info: 'info',
      EqWidgetStatus.warning: 'warning',
      EqWidgetStatus.danger: 'danger',
      EqWidgetStatus.success: 'success',
    };

    Map<EqWidgetStatus, List<String>> widgetStatusColors = {
      EqWidgetStatus.primary: [],
      EqWidgetStatus.info: [],
      EqWidgetStatus.warning: [],
      EqWidgetStatus.danger: [],
      EqWidgetStatus.success: [],
    };

    for (final widgetStatus in widgetStatusAsString.keys) {
      final name = widgetStatusAsString[widgetStatus];
      for (int i = 1; i <= 9; i++) {
        widgetStatusColors[widgetStatus].add(data['color-$name-${i * 100}']);
      }
    }

    if (light) {
      return EqThemes.defaultLightTheme.extend(
        primary:
            ColorGroup.fromJson(widgetStatusColors[EqWidgetStatus.primary]),
        success:
            ColorGroup.fromJson(widgetStatusColors[EqWidgetStatus.success]),
        info: ColorGroup.fromJson(widgetStatusColors[EqWidgetStatus.info]),
        warning:
            ColorGroup.fromJson(widgetStatusColors[EqWidgetStatus.warning]),
        danger: ColorGroup.fromJson(widgetStatusColors[EqWidgetStatus.danger]),
      );
    } else {
      return EqThemes.defaultDarkTheme.extend(
        primary:
            ColorGroup.fromJson(widgetStatusColors[EqWidgetStatus.primary]),
        success:
            ColorGroup.fromJson(widgetStatusColors[EqWidgetStatus.success]),
        info: ColorGroup.fromJson(widgetStatusColors[EqWidgetStatus.info]),
        warning:
            ColorGroup.fromJson(widgetStatusColors[EqWidgetStatus.warning]),
        danger: ColorGroup.fromJson(widgetStatusColors[EqWidgetStatus.danger]),
      );
    }
  }
}
