import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';

enum EqTextState {
  basic,
  alternate,
  disabled,
  hint,
  control,
}

enum EqTextStyle {
  caption1,
  caption2,
  heading1,
  heading2,
  heading3,
  heading4,
  heading5,
  heading6,
  label,
  paragraph1,
  paragraph2,
  subtitle1,
  subtitle2,
}

class EqTextUtils {
  static String getStyleName({EqTextStyle style}) {
    switch(style) {
      case EqTextStyle.caption1: return 'caption-1';
      case EqTextStyle.caption2: return 'caption-2';
      case EqTextStyle.heading1: return 'heading-1';
      case EqTextStyle.heading2: return 'heading-2';
      case EqTextStyle.heading3: return 'heading-3';
      case EqTextStyle.heading4: return 'heading-4';
      case EqTextStyle.heading5: return 'heading-5';
      case EqTextStyle.heading6: return 'heading-6';
      case EqTextStyle.label: return 'label';
      case EqTextStyle.paragraph1: return 'paragraph-1';
      case EqTextStyle.paragraph2: return 'paragraph-2';
      case EqTextStyle.subtitle1: return 'subtitle-1';
      case EqTextStyle.subtitle2: return 'subtitle-2';
      default: return 'subtitle-2';
    }
  }

  static TextStyle getTextStyle({EqTextStyle style, StaticStyleState styleData}) {
    final styleName = 'text-${getStyleName(style: style)}';
    final fontFamily = styleData.get('$styleName-font-family');
    final fontSize = styleData.get('$styleName-font-size');
    final fontWeight = styleData.get('$styleName-font-weight');

    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }
}