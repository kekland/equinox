import 'dart:convert';

import 'package:equinox/equinox.dart';
export 'package:equinox/src/theme/themings/control_elements_theme.dart';
export 'package:equinox/src/components/icon/icon_theme.dart';
export 'package:equinox/src/theme/themings/animation_theme.dart';
export 'package:equinox/src/theme/themings/border_radius_theme.dart';
export 'package:equinox/src/theme/themings/divider_theme.dart';
export 'package:equinox/src/theme/themings/outline_theme.dart';
export 'package:equinox/src/theme/themings/status_styled_widget_theme.dart';
export 'package:equinox/src/components/text/text_theme.dart';
export 'package:equinox/src/components/icon/icon_theme.dart';
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

  final EqBackgroundColors basicBackgroundColors;
  final EqBorderColors basicBorderColors;

  final BoxShadow shadow;
  final EqWidgetShape widgetShape;

  final EqTextThemeData textTheme;
  final EqIconThemeData iconTheme;
  final EqBackgroundThemeData backgroundTheme;
  final EqOutlineThemeData outlineTheme;
  final EqBorderThemeData borderTheme;
  final EqBorderRadiusThemeData borderRadiusTheme;
  final EqAnimationThemeData majorAnimationTheme;
  final EqAnimationThemeData minorAnimationTheme;
  final EqControlElementsThemeData controlElementsTheme;

  final StatusStyledWidgetThemeData<EqRadioThemeData> radioTheme;

  EqThemeData.raw({
    @required this.primary,
    @required this.success,
    @required this.info,
    @required this.warning,
    @required this.danger,
    @required this.basic,
    @required this.basicBackgroundColors,
    @required this.basicBorderColors,
    @required this.shadow,
    @required this.widgetShape,
    @required this.textTheme,
    @required this.backgroundTheme,
    @required this.borderTheme,
    @required this.borderRadiusTheme,
    @required this.majorAnimationTheme,
    @required this.minorAnimationTheme,
    @required this.outlineTheme,
    @required this.iconTheme,
    @required this.controlElementsTheme,
    @required this.radioTheme,
  });

  EqThemeData.withoutWidgetConfigs({
    @required this.primary,
    @required this.success,
    @required this.info,
    @required this.warning,
    @required this.danger,
    @required this.basic,
    @required this.basicBackgroundColors,
    @required this.basicBorderColors,
    @required this.shadow,
    @required this.widgetShape,
    @required this.textTheme,
    @required this.backgroundTheme,
    @required this.borderTheme,
    @required this.borderRadiusTheme,
    @required this.majorAnimationTheme,
    @required this.minorAnimationTheme,
    @required this.outlineTheme,
    @required this.iconTheme,
    @required this.controlElementsTheme,
  }) : radioTheme = null;

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
    EqBackgroundColors basicBackgroundColors,
    EqBorderColors basicBorderColors,
    EqTextThemeData textTheme,
    EqWidgetShape widgetShape = EqWidgetShape.rectangle,
    EqAnimationThemeData majorAnimationTheme,
    EqAnimationThemeData minorAnimationTheme,
    EqBackgroundThemeData backgroundTheme,
    EqBorderThemeData borderTheme,
    EqBorderRadiusThemeData borderRadiusTheme,
    EqOutlineThemeData outlineTheme,
    EqIconThemeData iconTheme,
    EqControlElementsThemeData controlElementsTheme,
    StatusStyledWidgetThemeData<EqRadioThemeData> radioTheme,
    BoxShadow shadow = const BoxShadow(
      offset: Offset(0.0, 8.0),
      blurRadius: 16.0,
      spreadRadius: 0.0,
      color: Color.fromRGBO(44, 51, 73, 0.1),
    ),
  }) {
    final finalBasicBackgroundColors = EqBackgroundColors(
      color1: basic.shade100,
      color2: basic.shade200,
      color3: basic.shade300,
      color4: basic.shade400,
    ).merge(basicBackgroundColors);
    final finalBasicBorderColors = EqBorderColors(
      color1: basic.shade100,
      color2: basic.shade200,
      color3: basic.shade300,
      color4: basic.shade400,
      color5: basic.shade500,
    ).merge(basicBorderColors);
    final finalControlElementsTheme = EqControlElementsThemeData(
      descriptionPadding: 8.0,
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
    ).merge(controlElementsTheme);
    final finalTextTheme = EqTextThemeData(
      primaryFontFamily: primaryFontFamily,
      secondaryFontFamily: secondaryFontFamily,
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
    ).merge(textTheme);
    final finalMajorAnimationTheme = EqAnimationThemeData(
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 250),
    ).merge(majorAnimationTheme);
    final finalMinorAnimationTheme = const EqAnimationThemeData(
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 150),
    ).merge(minorAnimationTheme);
    final finalBorderTheme = EqBorderThemeData(
      width: 1.0,
      color: basic.shade300,
      colorDisabled: basic.shade400,
      colorSelected: primary.shade500,
    ).merge(borderTheme);
    final finalBorderRadiusTheme = EqBorderRadiusThemeData(
      rectangleRadius: 4.0,
      semiRoundRadius: 12.0,
    ).merge(borderRadiusTheme);
    final finalOutlineTheme = EqOutlineThemeData(
      color: basic.shade300.withOpacity(0.125),
      width: 6.0,
    ).merge(outlineTheme);
    final finalBackgroundTheme = EqBackgroundThemeData(
      color: basic.shade300,
      colorDisabled: basic.shade200,
      colorSelected: primary.shade500,
    ).merge(backgroundTheme);
    final finalIconTheme = EqIconThemeData(
      color: basic.shade900,
      size: 24.0,
    ).merge(iconTheme);
    final baseRadioTheme = EqRadioThemeData(
      backgroundTheme: finalBackgroundTheme.copyWith(
          colorSelected: finalBackgroundTheme.color),
      size: finalIconTheme.size,
      descriptionStyle: finalTextTheme.subtitle2,
      borderTheme: finalBorderTheme,
      knobTheme: EqBackgroundThemeData(
        color: primary.shade500,
        colorDisabled: finalBasicBackgroundColors.color4,
        colorSelected: primary.shade500,
      ),
    ).merge(radioTheme?.base);

    final theme = EqThemeData.withoutWidgetConfigs(
      primary: primary,
      success: success,
      info: info,
      warning: warning,
      danger: danger,
      basic: basic,
      shadow: shadow,
      widgetShape: widgetShape,
      backgroundTheme: finalBackgroundTheme,
      basicBackgroundColors: finalBasicBackgroundColors,
      basicBorderColors: finalBasicBorderColors,
      borderRadiusTheme: finalBorderRadiusTheme,
      borderTheme: finalBorderTheme,
      controlElementsTheme: finalControlElementsTheme,
      iconTheme: finalIconTheme,
      majorAnimationTheme: finalMajorAnimationTheme,
      minorAnimationTheme: finalMinorAnimationTheme,
      outlineTheme: finalOutlineTheme,
      textTheme: finalTextTheme,
    );

    final finalRadioTheme = StatusStyledWidgetThemeData.autoFillRest(
        theme: theme, base: baseRadioTheme);
    //return theme;
    return theme.extend(
      radioTheme: finalRadioTheme,
      useConfigure: false,
    );
  }

  EqThemeData extend({
    String primaryFontFamily,
    String secondaryFontFamily,
    ColorGroup primary,
    ColorGroup success,
    ColorGroup info,
    ColorGroup warning,
    ColorGroup danger,
    ColorGroup basic,
    BoxShadow shadow,
    EqBackgroundColors basicBackgroundColors,
    EqBorderColors basicBorderColors,
    EqWidgetShape widgetShape,
    EqTextThemeData textTheme,
    EqBackgroundThemeData backgroundTheme,
    EqBorderThemeData borderTheme,
    EqBorderRadiusThemeData borderRadiusTheme,
    EqAnimationThemeData majorAnimationTheme,
    EqAnimationThemeData minorAnimationTheme,
    EqOutlineThemeData outlineTheme,
    EqIconThemeData iconTheme,
    EqControlElementsThemeData controlElementsTheme,
    StatusStyledWidgetThemeData<EqRadioThemeData> radioTheme,
    bool useConfigure = true,
  }) {
    var a = 1;
    if (useConfigure) {
      return EqThemeData.configure(
        primary: primary ?? this.primary,
        success: success ?? this.success,
        info: info ?? this.info,
        warning: warning ?? this.warning,
        danger: danger ?? this.danger,
        basic: basic ?? this.basic,
        shadow: shadow ?? this.shadow,
        primaryFontFamily:
            primaryFontFamily ?? this.textTheme.primaryFontFamily,
        secondaryFontFamily:
            secondaryFontFamily ?? this.textTheme.secondaryFontFamily,
        widgetShape: widgetShape ?? this.widgetShape,
        basicBackgroundColors:
            this.basicBackgroundColors.merge(basicBackgroundColors),
        basicBorderColors: this.basicBorderColors.merge(basicBorderColors),
        textTheme: this.textTheme.merge(textTheme),
        backgroundTheme: this.backgroundTheme.merge(backgroundTheme),
        borderRadiusTheme: this.borderRadiusTheme.merge(borderRadiusTheme),
        borderTheme: this.borderTheme.merge(borderTheme),
        majorAnimationTheme:
            this.majorAnimationTheme.merge(majorAnimationTheme),
        minorAnimationTheme:
            this.minorAnimationTheme.merge(minorAnimationTheme),
        outlineTheme: this.outlineTheme.merge(outlineTheme),
        iconTheme: this.iconTheme.merge(iconTheme),
        controlElementsTheme:
            this.controlElementsTheme.merge(controlElementsTheme),
        radioTheme: (this.radioTheme) != null
            ? this.radioTheme.merge(radioTheme)
            : radioTheme,
      );
    } else {
      return EqThemeData.raw(
        primary: primary ?? this.primary,
        success: success ?? this.success,
        info: info ?? this.info,
        warning: warning ?? this.warning,
        danger: danger ?? this.danger,
        basic: basic ?? this.basic,
        shadow: shadow ?? this.shadow,
        widgetShape: widgetShape ?? this.widgetShape,
        basicBackgroundColors:
            this.basicBackgroundColors.merge(basicBackgroundColors),
        basicBorderColors: this.basicBorderColors.merge(basicBorderColors),
        textTheme: this.textTheme.merge(textTheme),
        backgroundTheme: this.backgroundTheme.merge(backgroundTheme),
        borderRadiusTheme: this.borderRadiusTheme.merge(borderRadiusTheme),
        borderTheme: this.borderTheme.merge(borderTheme),
        majorAnimationTheme:
            this.majorAnimationTheme.merge(majorAnimationTheme),
        minorAnimationTheme:
            this.minorAnimationTheme.merge(minorAnimationTheme),
        outlineTheme: this.outlineTheme.merge(outlineTheme),
        iconTheme: this.iconTheme.merge(iconTheme),
        controlElementsTheme:
            this.controlElementsTheme.merge(controlElementsTheme),
        radioTheme: (this.radioTheme) != null
            ? this.radioTheme.merge(radioTheme)
            : radioTheme,
      );
    }
  }

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
