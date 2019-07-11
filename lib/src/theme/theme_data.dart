import 'dart:convert';

import 'package:equinox/equinox.dart';
export 'package:equinox/src/theme/themings/control_elements_theme.dart';
export 'package:equinox/src/components/icon/icon_theme.dart';
export 'package:equinox/src/theme/themings/animation_theme.dart';
export 'package:equinox/src/theme/themings/border_radius_theme.dart';
export 'package:equinox/src/theme/themings/divider_theme.dart';
export 'package:equinox/src/theme/themings/outline_theme.dart';
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

  EqThemeData.raw({
    @required this.primary,
    @required this.success,
    @required this.info,
    @required this.warning,
    @required this.danger,
    @required this.basic,
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
  });

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
    EqBackgroundThemeData backgroundTheme,
    EqBorderThemeData borderTheme,
    EqBorderRadiusThemeData borderRadiusTheme,
    EqOutlineThemeData outlineTheme,
    EqIconThemeData iconTheme,
    EqControlElementsThemeData controlElementsTheme,
    BoxShadow shadow = const BoxShadow(
      offset: Offset(0.0, 8.0),
      blurRadius: 16.0,
      spreadRadius: 0.0,
      color: Color.fromRGBO(44, 51, 73, 0.1),
    ),
  }) {
    final defaultControlElementsTheme = EqControlElementsThemeData(
      descriptionPadding: 8.0,
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
    );
    final defaultTextTheme = EqTextThemeData(
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
    final defaultOutlineTheme = EqOutlineThemeData(
      color: basic.shade300.withOpacity(0.125),
      width: 6.0,
    );
    final defaultBackgroundTheme = EqBackgroundThemeData(
      color: basic.shade300,
      colorDisabled: basic.shade200,
    );
    final defaultIconTheme = EqIconThemeData(
      color: basic.shade900,
      size: 24.0,
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
      backgroundTheme: defaultBackgroundTheme.merge(backgroundTheme),
      textTheme: defaultTextTheme.merge(textTheme),
      borderRadiusTheme: defaultBorderRadiusTheme.merge(borderRadiusTheme),
      borderTheme: defaultBorderTheme.merge(borderTheme),
      majorAnimationTheme:
          defaultMajorAnimationTheme.merge(majorAnimationTheme),
      minorAnimationTheme:
          defaultMinorAnimationTheme.merge(minorAnimationTheme),
      outlineTheme: defaultOutlineTheme.merge(outlineTheme),
      iconTheme: defaultIconTheme.merge(iconTheme),
      controlElementsTheme: defaultControlElementsTheme
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
  }) {
    return new EqThemeData.configure(
      primary: primary ?? this.primary,
      success: success ?? this.success,
      info: info ?? this.info,
      warning: warning ?? this.warning,
      danger: danger ?? this.danger,
      basic: basic ?? this.basic,
      shadow: shadow ?? this.shadow,
      primaryFontFamily: primaryFontFamily ?? this.textTheme.primaryFontFamily,
      secondaryFontFamily:
          secondaryFontFamily ?? this.textTheme.secondaryFontFamily,
      widgetShape: widgetShape ?? this.widgetShape,
      textTheme: this.textTheme.merge(textTheme),
      backgroundTheme: this.backgroundTheme.merge(backgroundTheme),
      borderRadiusTheme: this.borderRadiusTheme.merge(borderRadiusTheme),
      borderTheme: this.borderTheme.merge(borderTheme),
      majorAnimationTheme: this.majorAnimationTheme.merge(majorAnimationTheme),
      minorAnimationTheme: this.minorAnimationTheme.merge(minorAnimationTheme),
      outlineTheme: this.outlineTheme.merge(outlineTheme),
      iconTheme: this.iconTheme.merge(iconTheme),
      controlElementsTheme: this.controlElementsTheme.merge(controlElementsTheme),
    );
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
