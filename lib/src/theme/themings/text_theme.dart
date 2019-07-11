import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';

class EqTextThemeData {
  final TextStyle caption1;
  final TextStyle caption2;

  final TextStyle heading1;
  final TextStyle heading2;
  final TextStyle heading3;
  final TextStyle heading4;
  final TextStyle heading5;
  final TextStyle heading6;

  final TextStyle label;

  final TextStyle paragraph1;
  final TextStyle paragraph2;

  final TextStyle subtitle1;
  final TextStyle subtitle2;

  final Color textBasicColor;
  final Color textAlternateColor;
  final Color textControlColor;
  final Color textDisabledColor;
  final Color textHintColor;

  final String primaryFontFamily;
  final String secondaryFontFamily;

  EqTextThemeData({
    this.caption1,
    this.caption2,
    this.heading1,
    this.heading2,
    this.heading3,
    this.heading4,
    this.heading5,
    this.heading6,
    this.label,
    this.paragraph1,
    this.paragraph2,
    this.subtitle1,
    this.subtitle2,
    this.textBasicColor,
    this.textAlternateColor,
    this.textControlColor,
    this.textDisabledColor,
    this.textHintColor,
    this.primaryFontFamily,
    this.secondaryFontFamily,
  });

  EqTextThemeData copyWith({
    TextStyle heading1,
    TextStyle heading2,
    TextStyle heading3,
    TextStyle heading4,
    TextStyle heading5,
    TextStyle heading6,
    TextStyle subtitle1,
    TextStyle subtitle2,
    TextStyle paragraph1,
    TextStyle paragraph2,
    TextStyle label,
    TextStyle caption1,
    TextStyle caption2,
    Color textBasicColor,
    Color textAlternateColor,
    Color textControlColor,
    Color textDisabledColor,
    Color textHintColor,
    String primaryFontFamily,
    String secondaryFontFamily,
  }) {
    return EqTextThemeData(
      caption1: caption1 ?? this.caption1,
      caption2: caption2 ?? this.caption2,
      heading1: heading1 ?? this.heading1,
      heading2: heading2 ?? this.heading2,
      heading3: heading3 ?? this.heading3,
      heading4: heading4 ?? this.heading4,
      heading5: heading5 ?? this.heading5,
      heading6: heading6 ?? this.heading6,
      label: label ?? this.label,
      paragraph1: paragraph1 ?? this.paragraph1,
      paragraph2: paragraph2 ?? this.paragraph2,
      subtitle1: subtitle1 ?? this.subtitle1,
      subtitle2: subtitle2 ?? this.subtitle2,
      textAlternateColor: textAlternateColor ?? this.textAlternateColor,
      textBasicColor: textBasicColor ?? this.textBasicColor,
      textControlColor: textControlColor ?? this.textControlColor,
      textDisabledColor: textDisabledColor ?? this.textDisabledColor,
      textHintColor: textHintColor ?? this.textHintColor,
      primaryFontFamily: primaryFontFamily ?? this.primaryFontFamily,
      secondaryFontFamily: secondaryFontFamily ?? this.secondaryFontFamily,
    );
  }

  EqTextThemeData merge(EqTextThemeData other) {
    if (other == null) return this;
    return copyWith(
      caption1: other.caption1,
      caption2: other.caption2,
      heading1: other.heading1,
      heading2: other.heading2,
      heading3: other.heading3,
      heading4: other.heading4,
      heading5: other.heading5,
      heading6: other.heading6,
      label: other.label,
      paragraph1: other.paragraph1,
      paragraph2: other.paragraph2,
      subtitle1: other.subtitle1,
      subtitle2: other.subtitle2,
      textAlternateColor: other.textAlternateColor,
      textBasicColor: other.textBasicColor,
      textControlColor: other.textControlColor,
      textDisabledColor: other.textDisabledColor,
      textHintColor: other.textHintColor,
      primaryFontFamily: other.primaryFontFamily,
      secondaryFontFamily: other.secondaryFontFamily,
    );
  }

  Color _getColorForTextStyleWithStatus({
    EqThemeData theme,
    EqTextState state,
    EqWidgetStatus status,
  }) {
    switch (status) {
      case EqWidgetStatus.primary:
        return (state == EqTextState.disabled)
            ? theme.primary.shade300
            : theme.primary.shade500;
      case EqWidgetStatus.success:
        return (state == EqTextState.disabled)
            ? theme.success.shade300
            : theme.success.shade500;
      case EqWidgetStatus.info:
        return (state == EqTextState.disabled)
            ? theme.info.shade300
            : theme.info.shade500;
      case EqWidgetStatus.warning:
        return (state == EqTextState.disabled)
            ? theme.warning.shade300
            : theme.warning.shade500;
      case EqWidgetStatus.danger:
        return (state == EqTextState.disabled)
            ? theme.danger.shade300
            : theme.danger.shade500;
      case EqWidgetStatus.basic:
        return (state == EqTextState.disabled)
            ? theme.basic.shade300
            : theme.basic.shade500;
      default:
        return (state == EqTextState.disabled)
            ? theme.primary.shade300
            : theme.primary.shade500;
    }
  }

  Color _getColorForTextStyleWithoutStatus({
    EqTextState state,
  }) {
    switch (state) {
      case EqTextState.basic:
        return textBasicColor;

      case EqTextState.alternate:
        return textAlternateColor;

      case EqTextState.disabled:
        return textDisabledColor;

      case EqTextState.hint:
        return textHintColor;

      case EqTextState.control:
        return textControlColor;
      default:
        return textBasicColor;
    }
  }

  TextStyle _getBaseTextStyle({EqTextStyle style}) {
    switch (style) {
      case EqTextStyle.caption1:
        return caption1;
      case EqTextStyle.caption2:
        return caption2;
      case EqTextStyle.heading1:
        return heading1;
      case EqTextStyle.heading2:
        return heading2;
      case EqTextStyle.heading3:
        return heading3;
      case EqTextStyle.heading4:
        return heading4;
      case EqTextStyle.heading5:
        return heading5;
      case EqTextStyle.heading6:
        return heading6;
      case EqTextStyle.label:
        return label;
      case EqTextStyle.paragraph1:
        return paragraph1;
      case EqTextStyle.paragraph2:
        return paragraph2;
      case EqTextStyle.subtitle1:
        return subtitle1;
      case EqTextStyle.subtitle2:
        return subtitle2;
      default:
        return subtitle2;
    }
  }

  TextStyle getTextStyle(
      {BuildContext context,
      EqTextState state,
      EqTextStyle style,
      EqWidgetStatus status,
      TextStyle mergeWith}) {
    final theme = EqTheme.of(context);
    Color color;

    if (status != null) {
      color = _getColorForTextStyleWithStatus(
        state: state,
        status: status,
        theme: theme,
      );
    } else {
      color = _getColorForTextStyleWithoutStatus(state: state);
    }

    TextStyle baseTextStyle = _getBaseTextStyle(style: style);

    return baseTextStyle.copyWith(color: color).merge(mergeWith);
  }
}
