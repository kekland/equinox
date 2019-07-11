import 'dart:convert';

import 'package:equinox/equinox.dart';
import 'package:equinox/src/components/icon/icon_theme.dart';
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

  final BackgroundColors backgroundBasicColors;
  final BorderColors borderBasicColors;

  final BackgroundColors backgroundAlternativeColors;
  final BorderColors borderAlternativeColors;

  final BackgroundColors backgroundPrimaryColors;
  final BorderColors borderPrimaryColors;

  final double borderRadius;

  final Color dividerColor;
  final double dividerWidth;

  final BoxShadow shadow;
  final BoxShadow heavyShadow;

  final Duration minorAnimationDuration;
  final Curve minorAnimationCurve;

  final Duration majorAnimationDuration;
  final Curve majorAnimationCurve;

  final EqWidgetShape defaultWidgetShape;
  final EqButtonThemeData defaultButtonTheme;
  final EqCheckboxThemeData defaultCheckboxTheme;
  final EqToggleThemeData defaultToggleTheme;
  final EqIconThemeData defaultIconTheme;
  final EqTextFieldThemeData defaultTextFieldTheme;
  final EqSpinnerThemeData defaultSpinnerTheme;
  final EqSelectThemeData defaultSelectTheme;
  final EqProgressBarThemeData defaultProgressBarTheme;
  final EqRadioTheme defaultRadioTheme;
  final EqIconButtonThemeData defaultIconButtonTheme;

  factory EqThemeData({
    @required String primaryFontFamily,
    @required String secondaryFontFamily,
    @required ColorGroup primary,
    @required ColorGroup success,
    @required ColorGroup info,
    @required ColorGroup warning,
    @required ColorGroup danger,
    @required ColorGroup basic,
    double borderRadius = 4.0,
    double outlineWidth = 6.0,
    double dividerWidth = 1.0,
    BoxShadow shadow = const BoxShadow(
      offset: Offset(0.0, 8.0),
      blurRadius: 16.0,
      spreadRadius: 0.0,
      color: Color.fromRGBO(44, 51, 73, 0.1),
    ),
    BoxShadow heavyShadow = const BoxShadow(
      offset: Offset(0.0, 8.0),
      blurRadius: 20.0,
      spreadRadius: 0.0,
      color: Color.fromRGBO(106, 111, 132, 0.16),
    ),
    Duration majorAnimationDuration = const Duration(milliseconds: 250),
    Duration minorAnimationDuration = const Duration(milliseconds: 150),
    Curve majorAnimationCurve: Curves.easeInOut,
    Curve minorAnimationCurve = Curves.easeInOut,
    EqWidgetShape defaultWidgetShape = EqWidgetShape.rectangle,
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
    return EqThemeData.configure(
      primaryFontFamily: primaryFontFamily,
      secondaryFontFamily: secondaryFontFamily,
      primary: primary,
      success: success,
      info: info,
      warning: warning,
      danger: danger,
      basic: basic,
      borderRadius: borderRadius,
      dividerWidth: dividerWidth,
      outlineWidth: outlineWidth,
      shadow: shadow,
      heavyShadow: heavyShadow,
      majorAnimationCurve: majorAnimationCurve,
      minorAnimationCurve: minorAnimationCurve,
      majorAnimationDuration: majorAnimationDuration,
      minorAnimationDuration: minorAnimationDuration,
      defaultWidgetShape: defaultWidgetShape,
      defaultButtonTheme: defaultButtonTheme,
      defaultCheckboxTheme: defaultCheckboxTheme,
      defaultToggleTheme: defaultToggleTheme,
      defaultRadioTheme: defaultRadioTheme,
      defaultTextFieldTheme: defaultTextFieldTheme,
      defaultIconButtonTheme: defaultIconButtonTheme,
      defaultProgressBarTheme: defaultProgressBarTheme,
      defaultSelectTheme: defaultSelectTheme,
      defaultSpinnerTheme: defaultSpinnerTheme,
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
    TextThemeData heading1 = const TextThemeData(
        fontSize: 36.0, fontWeight: FontWeight.w800, lineHeight: 48.0),
    TextThemeData heading2 = const TextThemeData(
        fontSize: 32.0, fontWeight: FontWeight.w800, lineHeight: 40.0),
    TextThemeData heading3 = const TextThemeData(
        fontSize: 30.0, fontWeight: FontWeight.w800, lineHeight: 40.0),
    TextThemeData heading4 = const TextThemeData(
        fontSize: 26.0, fontWeight: FontWeight.w800, lineHeight: 32.0),
    TextThemeData heading5 = const TextThemeData(
        fontSize: 22.0, fontWeight: FontWeight.w800, lineHeight: 32.0),
    TextThemeData heading6 = const TextThemeData(
        fontSize: 18.0, fontWeight: FontWeight.w800, lineHeight: 24.0),
    TextThemeData subtitle1 = const TextThemeData(
        fontSize: 15.0, fontWeight: FontWeight.w600, lineHeight: 24.0),
    TextThemeData subtitle2 = const TextThemeData(
        fontSize: 13.0, fontWeight: FontWeight.w600, lineHeight: 24.0),
    TextThemeData paragraph1 = const TextThemeData(
        fontSize: 15.0, fontWeight: FontWeight.w400, lineHeight: 20.0),
    TextThemeData paragraph2 = const TextThemeData(
        fontSize: 13.0, fontWeight: FontWeight.w400, lineHeight: 16.0),
    TextThemeData label = const TextThemeData(
        fontSize: 12.0, fontWeight: FontWeight.w800, lineHeight: 16.0),
    TextThemeData caption1 = const TextThemeData(
        fontSize: 12.0, fontWeight: FontWeight.w400, lineHeight: 16.0),
    TextThemeData caption2 = const TextThemeData(
        fontSize: 12.0, fontWeight: FontWeight.w600, lineHeight: 16.0),
    TextThemeData buttonTiny = const TextThemeData(
        fontSize: 10.0, fontWeight: FontWeight.w800, lineHeight: 12.0),
    TextThemeData buttonSmall = const TextThemeData(
        fontSize: 12.0, fontWeight: FontWeight.w800, lineHeight: 16.0),
    TextThemeData buttonMedium = const TextThemeData(
        fontSize: 14.0, fontWeight: FontWeight.w800, lineHeight: 16.0),
    TextThemeData buttonLarge = const TextThemeData(
        fontSize: 16.0, fontWeight: FontWeight.w800, lineHeight: 20.0),
    TextThemeData buttonGiant = const TextThemeData(
        fontSize: 18.0, fontWeight: FontWeight.w800, lineHeight: 24.0),
    double borderRadius = 4.0,
    double outlineWidth = 6.0,
    double dividerWidth = 1.0,
    BoxShadow shadow = const BoxShadow(
      offset: Offset(0.0, 8.0),
      blurRadius: 16.0,
      spreadRadius: 0.0,
      color: Color.fromRGBO(44, 51, 73, 0.1),
    ),
    BoxShadow heavyShadow = const BoxShadow(
      offset: Offset(0.0, 8.0),
      blurRadius: 20.0,
      spreadRadius: 0.0,
      color: Color.fromRGBO(106, 111, 132, 0.16),
    ),
    Duration majorAnimationDuration = const Duration(milliseconds: 250),
    Duration minorAnimationDuration = const Duration(milliseconds: 150),
    Curve majorAnimationCurve: Curves.easeInOut,
    Curve minorAnimationCurve = Curves.easeInOut,
    EqWidgetShape defaultWidgetShape = EqWidgetShape.rectangle,
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
    return EqThemeData.raw(
      primary: primary,
      success: success,
      info: info,
      warning: warning,
      danger: danger,
      basic: basic,
      primaryStates: ColorStates(
        focus: primary.shade700,
        hover: primary.shade400,
        normal: primary.shade500,
        active: primary.shade600,
        disabled: primary.shade300,
      ),
      successStates: ColorStates(
        focus: success.shade700,
        hover: success.shade400,
        normal: success.shade500,
        active: success.shade600,
        disabled: success.shade200,
      ),
      infoStates: ColorStates(
        focus: info.shade700,
        hover: info.shade400,
        normal: info.shade500,
        active: info.shade600,
        disabled: info.shade300,
      ),
      warningStates: ColorStates(
        focus: warning.shade700,
        hover: warning.shade400,
        normal: warning.shade500,
        active: warning.shade600,
        disabled: warning.shade300,
      ),
      dangerStates: ColorStates(
        focus: danger.shade700,
        hover: danger.shade400,
        normal: danger.shade500,
        active: danger.shade600,
        disabled: danger.shade300,
      ),
      basicStates: ColorStates(
        focus: basic.shade700,
        hover: basic.shade400,
        normal: basic.shade500,
        active: basic.shade600,
        disabled: basic.shade300,
      ),
      backgroundBasicColors: BackgroundColors(
        color1: basic.shade100,
        color2: basic.shade200,
        color3: basic.shade300,
        color4: basic.shade400,
      ),
      backgroundAlternativeColors: BackgroundColors(
        color1: basic.shade800,
        color2: basic.shade900,
        color3: basic.shade1000,
        color4: basic.shade1100,
      ),
      backgroundPrimaryColors: BackgroundColors(
        color1: primary.shade500,
        color2: primary.shade600,
        color3: primary.shade700,
        color4: primary.shade800,
      ),
      borderBasicColors: BorderColors(
        color1: basic.shade100,
        color2: basic.shade200,
        color3: basic.shade300,
        color4: basic.shade400,
        color5: basic.shade500,
      ),
      borderAlternativeColors: BorderColors(
        color1: basic.shade800,
        color2: basic.shade900,
        color3: basic.shade1000,
        color4: basic.shade1100,
        color5: basic.shade1100,
      ),
      borderPrimaryColors: BorderColors(
        color1: basic.shade500,
        color2: basic.shade600,
        color3: basic.shade700,
        color4: basic.shade800,
        color5: basic.shade900,
      ),
      textBasicColor: basic.shade900,
      textAlternateColor: basic.shade100,
      textControlColor: basic.shade100,
      textDisabledColor: basic.shade500,
      textHintColor: basic.shade600,
      textPrimaryStates: ColorStates(
        normal: primary.shade500,
        active: primary.shade600,
        disabled: primary.shade400,
        hover: primary.shade400,
        focus: primary.shade700,
      ),
      textSuccessStates: ColorStates(
        normal: success.shade500,
        active: success.shade600,
        disabled: success.shade400,
        hover: success.shade400,
        focus: success.shade700,
      ),
      textInfoStates: ColorStates(
        normal: info.shade500,
        active: info.shade600,
        disabled: info.shade400,
        hover: info.shade400,
        focus: info.shade700,
      ),
      textWarningStates: ColorStates(
        normal: warning.shade500,
        active: warning.shade600,
        disabled: warning.shade400,
        hover: warning.shade400,
        focus: warning.shade700,
      ),
      textDangerStates: ColorStates(
        normal: danger.shade500,
        active: danger.shade600,
        disabled: danger.shade400,
        hover: danger.shade400,
        focus: danger.shade700,
      ),
      heading1: heading1.toTextTheme(fontFamily: secondaryFontFamily),
      heading2: heading2.toTextTheme(fontFamily: secondaryFontFamily),
      heading3: heading3.toTextTheme(fontFamily: secondaryFontFamily),
      heading4: heading4.toTextTheme(fontFamily: secondaryFontFamily),
      heading5: heading5.toTextTheme(fontFamily: secondaryFontFamily),
      heading6: heading6.toTextTheme(fontFamily: secondaryFontFamily),
      subtitle1: subtitle1.toTextTheme(fontFamily: primaryFontFamily),
      subtitle2: subtitle2.toTextTheme(fontFamily: primaryFontFamily),
      caption1: caption1.toTextTheme(fontFamily: primaryFontFamily),
      caption2: caption2.toTextTheme(fontFamily: primaryFontFamily),
      paragraph1: paragraph1.toTextTheme(fontFamily: primaryFontFamily),
      paragraph2: paragraph2.toTextTheme(fontFamily: primaryFontFamily),
      label: label.toTextTheme(fontFamily: primaryFontFamily),
      buttonTiny: buttonTiny.toTextTheme(fontFamily: primaryFontFamily),
      buttonSmall: buttonSmall.toTextTheme(fontFamily: primaryFontFamily),
      buttonMedium: buttonMedium.toTextTheme(fontFamily: primaryFontFamily),
      buttonLarge: buttonLarge.toTextTheme(fontFamily: primaryFontFamily),
      buttonGiant: buttonGiant.toTextTheme(fontFamily: primaryFontFamily),
      borderRadius: borderRadius,
      dividerColor: basic.shade300,
      dividerWidth: dividerWidth,
      outlineColor: basic.shade600.withOpacity(0.35),
      outlineWidth: outlineWidth,
      shadow: shadow,
      heavyShadow: heavyShadow,
      majorAnimationCurve: majorAnimationCurve,
      minorAnimationCurve: minorAnimationCurve,
      majorAnimationDuration: majorAnimationDuration,
      minorAnimationDuration: minorAnimationDuration,
      defaultWidgetShape: defaultWidgetShape,
      defaultButtonTheme: defaultButtonTheme,
      defaultCheckboxTheme: defaultCheckboxTheme,
      defaultToggleTheme: defaultToggleTheme,
      defaultRadioTheme: defaultRadioTheme,
      defaultTextFieldTheme: defaultTextFieldTheme,
      defaultIconButtonTheme: defaultIconButtonTheme,
      defaultProgressBarTheme: defaultProgressBarTheme,
      defaultSelectTheme: defaultSelectTheme,
      defaultSpinnerTheme: defaultSpinnerTheme,
    );
  }

  EqThemeData.raw({
    this.primary,
    this.success,
    this.info,
    this.warning,
    this.danger,
    this.basic,
    this.primaryStates,
    this.successStates,
    this.infoStates,
    this.warningStates,
    this.dangerStates,
    this.basicStates,
    this.backgroundBasicColors,
    this.borderBasicColors,
    this.backgroundAlternativeColors,
    this.borderAlternativeColors,
    this.backgroundPrimaryColors,
    this.borderPrimaryColors,
    this.textBasicColor,
    this.textAlternateColor,
    this.textControlColor,
    this.textDisabledColor,
    this.textHintColor,
    this.textPrimaryStates,
    this.textSuccessStates,
    this.textInfoStates,
    this.textWarningStates,
    this.textDangerStates,
    this.heading1,
    this.heading2,
    this.heading3,
    this.heading4,
    this.heading5,
    this.heading6,
    this.subtitle1,
    this.subtitle2,
    this.paragraph1,
    this.paragraph2,
    this.label,
    this.caption1,
    this.caption2,
    this.buttonTiny,
    this.buttonSmall,
    this.buttonMedium,
    this.buttonLarge,
    this.buttonGiant,
    this.borderRadius,
    this.outlineWidth,
    this.outlineColor,
    this.dividerColor,
    this.dividerWidth,
    this.shadow,
    this.heavyShadow,
    this.majorAnimationCurve,
    this.minorAnimationCurve,
    this.majorAnimationDuration,
    this.minorAnimationDuration,
    this.defaultWidgetShape,
    this.defaultButtonTheme,
    this.defaultCheckboxTheme,
    this.defaultToggleTheme,
    this.defaultRadioTheme,
    this.defaultTextFieldTheme,
    this.defaultIconButtonTheme,
    this.defaultProgressBarTheme,
    this.defaultSelectTheme,
    this.defaultSpinnerTheme,
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

  ColorStates getStatesForStatus({EqWidgetStatus status}) {
    switch (status) {
      case EqWidgetStatus.primary:
        return textPrimaryStates;
      case EqWidgetStatus.success:
        return textSuccessStates;
      case EqWidgetStatus.info:
        return textInfoStates;
      case EqWidgetStatus.warning:
        return textWarningStates;
      case EqWidgetStatus.danger:
        return textDangerStates;
      case EqWidgetStatus.basic:
        return basicStates;
      default:
        return textPrimaryStates;
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
        primary: ColorGroup.fromJson(widgetStatusColors[EqWidgetStatus.primary]),
        success: ColorGroup.fromJson(widgetStatusColors[EqWidgetStatus.success]),
        info: ColorGroup.fromJson(widgetStatusColors[EqWidgetStatus.info]),
        warning: ColorGroup.fromJson(widgetStatusColors[EqWidgetStatus.warning]),
        danger: ColorGroup.fromJson(widgetStatusColors[EqWidgetStatus.danger]),
      );
    } else {
      return EqThemes.defaultDarkTheme.extend(
        primary: ColorGroup.fromJson(widgetStatusColors[EqWidgetStatus.primary]),
        success: ColorGroup.fromJson(widgetStatusColors[EqWidgetStatus.success]),
        info: ColorGroup.fromJson(widgetStatusColors[EqWidgetStatus.info]),
        warning: ColorGroup.fromJson(widgetStatusColors[EqWidgetStatus.warning]),
        danger: ColorGroup.fromJson(widgetStatusColors[EqWidgetStatus.danger]),
      );
    }
  }
}
