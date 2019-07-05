import 'package:flutter/rendering.dart';

class TextThemeData {
  final double fontSize;
  final FontWeight fontWeight;
  final double lineHeight;

  const TextThemeData({this.fontSize, this.fontWeight, this.lineHeight});

  TextTheme toTextTheme({String fontFamily}) {
    return TextTheme(
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: fontWeight,
        lineHeight: lineHeight);
  }
}

class TextTheme {
  final String fontFamily;
  final double fontSize;
  final FontWeight fontWeight;
  final double lineHeight;

  const TextTheme(
      {this.fontFamily, this.fontSize, this.fontWeight, this.lineHeight});

  TextStyle get textStyle => TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: lineHeight / fontSize);
}
