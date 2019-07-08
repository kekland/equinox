import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';

class EqText extends StatelessWidget {
  final TextTheme eqStyle;
  /// The text to display.
  ///
  /// This will be null if a [textSpan] is provided instead.
  final String data;

  /// If non-null, the style to use for this text.
  ///
  /// If the style's "inherit" property is true, the style will be merged with
  /// the closest enclosing [DefaultTextStyle]. Otherwise, the style will
  /// replace the closest enclosing [DefaultTextStyle].
  final TextStyle style;

  /// {@macro flutter.painting.textPainter.strutStyle}
  final StrutStyle strutStyle;

  /// How the text should be aligned horizontally.
  final TextAlign textAlign;

  /// The directionality of the text.
  ///
  /// This decides how [textAlign] values like [TextAlign.start] and
  /// [TextAlign.end] are interpreted.
  ///
  /// This is also used to disambiguate how to render bidirectional text. For
  /// example, if the [data] is an English phrase followed by a Hebrew phrase,
  /// in a [TextDirection.ltr] context the English phrase will be on the left
  /// and the Hebrew phrase to its right, while in a [TextDirection.rtl]
  /// context, the English phrase will be on the right and the Hebrew phrase on
  /// its left.
  ///
  /// Defaults to the ambient [Directionality], if any.
  final TextDirection textDirection;

  /// Used to select a font when the same Unicode character can
  /// be rendered differently, depending on the locale.
  ///
  /// It's rarely necessary to set this property. By default its value
  /// is inherited from the enclosing app with `Localizations.localeOf(context)`.
  ///
  /// See [RenderParagraph.locale] for more information.
  final Locale locale;

  /// Whether the text should break at soft line breaks.
  ///
  /// If false, the glyphs in the text will be positioned as if there was unlimited horizontal space.
  final bool softWrap;

  /// How visual overflow should be handled.
  final TextOverflow overflow;

  /// The number of font pixels for each logical pixel.
  ///
  /// For example, if the text scale factor is 1.5, text will be 50% larger than
  /// the specified font size.
  ///
  /// The value given to the constructor as textScaleFactor. If null, will
  /// use the [MediaQueryData.textScaleFactor] obtained from the ambient
  /// [MediaQuery], or 1.0 if there is no [MediaQuery] in scope.
  final double textScaleFactor;

  /// An optional maximum number of lines for the text to span, wrapping if necessary.
  /// If the text exceeds the given number of lines, it will be truncated according
  /// to [overflow].
  ///
  /// If this is 1, text will not wrap. Otherwise, text will be wrapped at the
  /// edge of the box.
  ///
  /// If this is null, but there is an ambient [DefaultTextStyle] that specifies
  /// an explicit number for its [DefaultTextStyle.maxLines], then the
  /// [DefaultTextStyle] value will take precedence. You can use a [RichText]
  /// widget directly to entirely override the [DefaultTextStyle].
  final int maxLines;

  /// An alternative semantics label for this text.
  ///
  /// If present, the semantics of this widget will contain this value instead
  /// of the actual text. This will overwrite any of the semantics labels applied
  /// directly to the [TextSpan]s.
  ///
  /// This is useful for replacing abbreviations or shorthands with the full
  /// text value:
  ///
  /// ```dart
  /// Text(r'$$', semanticsLabel: 'Double dollars')
  /// ```
  final String semanticsLabel;

  const EqText(
    this.data, {
    this.style,
    @required this.eqStyle,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.overflow,
  });

  EqText.heading1(
    this.data, {
    Key key,
    @required BuildContext context,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.overflow,
  })  : this.eqStyle = EqTheme.of(context).heading1,
        super(key: key);

  EqText.heading2(
    this.data, {
    Key key,
    @required BuildContext context,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.overflow,
  })  : this.eqStyle = EqTheme.of(context).heading2,
        super(key: key);

  EqText.heading3(
    this.data, {
    Key key,
    @required BuildContext context,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.overflow,
  })  : this.eqStyle = EqTheme.of(context).heading3,
        super(key: key);

  EqText.heading4(
    this.data, {
    Key key,
    @required BuildContext context,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.overflow,
  })  : this.eqStyle = EqTheme.of(context).heading4,
        super(key: key);

  EqText.heading5(
    this.data, {
    Key key,
    @required BuildContext context,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel, this.overflow,
  })  : this.eqStyle = EqTheme.of(context).heading5,
        super(key: key);

  EqText.heading6(
    this.data, {
    Key key,
    @required BuildContext context,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.overflow,
  })  : this.eqStyle = EqTheme.of(context).heading6,
        super(key: key);

  EqText.subtitle1(
    this.data, {
    Key key,
    @required BuildContext context,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.overflow,
  })  : this.eqStyle = EqTheme.of(context).subtitle1,
        super(key: key);

  EqText.subtitle2(
    this.data, {
    Key key,
    @required BuildContext context,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.overflow,
  })  : this.eqStyle = EqTheme.of(context).subtitle2,
        super(key: key);

  EqText.paragraph1(
    this.data, {
    Key key,
    @required BuildContext context,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.overflow,
  })  : this.eqStyle = EqTheme.of(context).paragraph1,
        super(key: key);

  EqText.paragraph2(
    this.data, {
    Key key,
    @required BuildContext context,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.overflow,
  })  : this.eqStyle = EqTheme.of(context).paragraph2,
        super(key: key);

  EqText.label(
    this.data, {
    Key key,
    @required BuildContext context,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.overflow,
  })  : this.eqStyle = EqTheme.of(context).label,
        super(key: key);

  EqText.caption1(
    this.data, {
    Key key,
    @required BuildContext context,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.overflow,
  })  : this.eqStyle = EqTheme.of(context).caption1,
        super(key: key);

  EqText.caption2(
    this.data, {
    Key key,
    @required BuildContext context,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.overflow,
  })  : this.eqStyle = EqTheme.of(context).caption2,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var style;
    if(this.style != null) {
      style = this.style.copyWith(
        fontSize: this.eqStyle.fontSize,
        fontWeight: this.eqStyle.fontWeight,
        fontFamily: this.eqStyle.fontFamily,
        height: this.eqStyle.lineHeight / this.eqStyle.fontSize,
      );
    }
    else {
      style = this.eqStyle.textStyle;
    }

    return Text(
      data,
      key: key,
      locale: locale,
      maxLines: maxLines,
      overflow: overflow,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap,
      strutStyle: strutStyle,
      style: style,
      textAlign: textAlign,
      textDirection: textDirection,
      textScaleFactor: textScaleFactor,
    );
  }
}
