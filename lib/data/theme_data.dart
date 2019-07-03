import 'package:eva_design_flutter/eva_design_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';

class EqThemeData {
  final ColorGroup primary;
  final ColorGroup success;
  final ColorGroup info;
  final ColorGroup warning;
  final ColorGroup danger;
  final ColorGroup basic;

  final ColorStates primaryStates;
  final ColorStates successStates;
  final ColorStates infoStates;
  final ColorStates warningStates;
  final ColorStates dangerStates;
  final ColorStates basicStates;

  final BackgroundColors backgroundBasicColors;
  final BorderColors borderBasicColors;

  final BackgroundColors backgroundAlternativeColors;
  final BorderColors borderAlternativeColors;

  final BackgroundColors backgroundPrimaryColors;
  final BorderColors borderPrimaryColors;

  final Color textBasicColor;
  final Color textAlternateColor;
  final Color textControlColor;
  final Color textDisabledColor;
  final Color textHintColor;

  final ColorStates textPrimaryStates;
  final ColorStates textSuccessStates;
  final ColorStates textInfoStates;
  final ColorStates textWarningStates;
  final ColorStates textDangerStates;

  final TextTheme heading1;
  final TextTheme heading2;
  final TextTheme heading3;
  final TextTheme heading4;
  final TextTheme heading5;
  final TextTheme heading6;

  final TextTheme subtitle1;
  final TextTheme subtitle2;

  final TextTheme paragraph1;
  final TextTheme paragraph2;

  final TextTheme label;

  final TextTheme caption1;
  final TextTheme caption2;

  final TextTheme buttonTiny;
  final TextTheme buttonSmall;
  final TextTheme buttonMedium;
  final TextTheme buttonLarge;
  final TextTheme buttonGiant;

  final double borderRadius;
  final double outlineWidth;
  final Color outlineColor;

  final Color dividerColor;
  final double dividerWidth;

  final BoxShadow shadow;

  factory EqThemeData({
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
    double outlineWidth = 1.0,
    double dividerWidth = 1.0,
    BoxShadow shadow = const BoxShadow(
      offset: Offset(0.0, 8.0),
      blurRadius: 20.0,
      spreadRadius: 0.0,
      color: Color.fromRGBO(218, 224, 235, 0.6),
    ),
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
      outlineColor: basic.shade400,
      outlineWidth: outlineWidth,
      shadow: shadow,
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
  });

  ColorGroup getColorsForStatus({WidgetStatus status}) {
    switch(status) {
      case WidgetStatus.primary: return primary;
      case WidgetStatus.success: return success;
      case WidgetStatus.info: return info;
      case WidgetStatus.warning: return warning;
      case WidgetStatus.danger: return danger;
      case WidgetStatus.basic: return basic;
      default: return primary;
    }
  }
}
