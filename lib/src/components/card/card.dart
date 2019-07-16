import 'package:equinox/src/equinox_internal.dart';
import 'package:flutter/widgets.dart';

import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart' as MaterialDesign;

export 'package:equinox/src/components/card/card_style.dart';
export 'package:equinox/src/components/card/card_status_apperance.dart';

/// A widget that is used to display a block of content or information.
class EqCard extends StatelessWidget {
  /// A widget to use as card's body. Gets padded by [padding].
  final Widget child;

  /// A widget to use as card's header. Gets padded by [headerPadding] or [padding].
  /// Set [headerPadding] to `EdgeInsets.zero` if you want no padding.
  final Widget header;

  /// A widget to use as card's header. Gets padded by [footerPadding] or [padding].
  /// Set [footerPadding] to `EdgeInsets.zero` if you want no padding.
  final Widget footer;

  /// A card's status. It will be dispalyed according to [statusAppearance].
  /// - If [statusAppearance] is [CardStatusAppearance.body], entire card will be painted in
  /// the status's color.
  /// - If [statusAppearance] is [CardStatusAppearance.header], only the header will be painted in
  /// the status's color.
  /// - If [statusAppearance] is [CardStatusAppearance.strip], the status will be displayed as
  /// tiny line on top of the card.
  /// - Otherwise, no status will be displayed.
  final EqWidgetStatus status;

  /// Controls the card's border radius. If none is passed, uses [EqThemeData.defaultWidgetShape].
  final EqWidgetShape shape;

  /// Controls the card's status appearance. See [status] for more details.
  final EqCardStatusAppearance statusAppearance;

  /// Controls the padding of the child. Also sets the [headerPadding] and [footerPadding] if they're null.
  final EdgeInsets padding;

  /// Controls the padding for the header. Gets set by [padding] if it's `null`. See [header].
  final EdgeInsets headerPadding;

  /// Controls the padding for the footer. Gets set by [padding] if it's `null`. See [footer].
  final EdgeInsets footerPadding;

  /// Use this to overwrite the borderRadius set by the theme.
  final BorderRadius borderRadius;

  const EqCard({
    Key key,
    @required this.child,
    this.header,
    this.footer,
    this.status,
    this.shape,
    this.statusAppearance,
    this.padding,
    this.headerPadding,
    this.footerPadding,
    this.borderRadius,
  }) : super(key: key);

  Widget _buildBody(StyleData style) {
    var widgets = <Widget>[];
    final padding = this.padding ?? style.get('card-padding');

    if (header != null) {
      if (status != null &&
          this.statusAppearance == EqCardStatusAppearance.strip) {
        widgets.add(_CardStatusStripWidget(shape: shape, status: status));
      }
      widgets.add(_CardHeader(
        child: header,
        padding: headerPadding ?? padding,
        shape: shape,
        status: status,
        statusAppearance: statusAppearance,
      ));
      if (!(status != null &&
          this.statusAppearance == EqCardStatusAppearance.header)) {
        widgets.add(EqDivider(
          color: style.get('card-divider-color'),
          width: style.get('card-divider-width'),
        ));
      }
    }
    widgets.add(Padding(padding: padding, child: child));

    if (footer != null) {
      widgets.add(EqDivider(
        color: style.get('card-divider-color'),
        width: style.get('card-divider-width'),
      ));
      widgets.add(_CardFooter(
        child: footer,
        padding: footerPadding ?? padding,
        shape: shape,
        status: status,
        statusAppearance: statusAppearance,
      ));
    }

    var column = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
    return MaterialDesign.DefaultTextStyle(
      child: column,
      style: TextStyle(
        color: style.get('card-text-color'),
        fontFamily: style.get('card-text-font-family'),
        fontSize: style.get('card-text-font-size'),
        fontWeight: style.get('card-text-font-weight'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final style = StaticStyle.of(context);

    return AnimatedContainer(
      duration: style.get('minor-animation-duration'),
      curve: style.get('minor-animation-curve'),
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.all(
          EqWidgetShapeUtils.getRadius(style: style.style, shape: shape),
        ),
        boxShadow: [style.get('card-shadow')],
        color: style.get('card-background-color'),
        border: Border.all(
          width: style.get('card-border-width'),
          color: style.get('card-border-color'),
        ),
      ),
      child: MaterialDesign.Material(
        type: MaterialDesign.MaterialType.transparency,
        child: _buildBody(style.style),
      ),
    );
  }
}

class _CardHeader extends StatelessWidget {
  final EqWidgetStatus status;
  final EqWidgetShape shape;
  final EqCardStatusAppearance statusAppearance;
  final EdgeInsets padding;
  final Widget child;

  const _CardHeader({
    Key key,
    this.status,
    this.shape,
    this.statusAppearance,
    this.padding,
    @required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final style = StaticStyle.of(context);

    final selectorBase = ['card-header', status];
    print(selectorBase);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          EqWidgetShapeUtils.getRadius(style: style.style, shape: shape),
        ),
        color: (statusAppearance == EqCardStatusAppearance.header)
            ? style.get(generateSelector([...selectorBase, 'background-color']))
            : Colors.transparent,
      ),
      child: MaterialDesign.Material(
        type: MaterialDesign.MaterialType.transparency,
        child: Padding(
          padding: padding,
          child: MaterialDesign.DefaultTextStyle(
            style: TextStyle(
              fontFamily: style.get('card-header-text-font-family'),
              fontSize: style.get('card-header-text-font-size'),
              fontWeight: style.get('card-header-text-font-weight'),
              color: (statusAppearance == EqCardStatusAppearance.header)
                  ? style.get(generateSelector([...selectorBase, 'text-color']))
                  : style.get('card-header-text-color'),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

class _CardFooter extends StatelessWidget {
  final EqWidgetStatus status;
  final EqWidgetShape shape;
  final EqCardStatusAppearance statusAppearance;
  final EdgeInsets padding;
  final Widget child;

  const _CardFooter(
      {MaterialDesign.Key key,
      this.status,
      this.shape,
      this.statusAppearance,
      this.padding,
      @required this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = StaticStyle.of(context);

    return Container(
      width: double.infinity,
      child: MaterialDesign.Material(
        type: MaterialDesign.MaterialType.transparency,
        child: Padding(
          padding: padding,
          child: MaterialDesign.DefaultTextStyle(
            style: TextStyle(
              fontFamily: theme.get('card-text-font-family'),
              fontSize: theme.get('card-text-font-size'),
              fontWeight: theme.get('card-text-font-weight'),
              color: theme.get('card-text-color'),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

class _CardStatusStripWidget extends StatelessWidget {
  final EqWidgetStatus status;
  final EqWidgetShape shape;

  const _CardStatusStripWidget(
      {MaterialDesign.Key key, this.status, this.shape})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final style = StaticStyle.of(context).style;

    return Container(
      width: double.infinity,
      height: 4.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: EqWidgetShapeUtils.getRadius(style: style, shape: shape),
          bottom: Radius.zero,
        ),
        color: style
            .get(generateSelector(['card-header', status, 'background-color'])),
      ),
    );
  }
}
