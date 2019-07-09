export 'package:equinox/src/components/card/card_status_appearance.dart';

import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart' as MaterialDesign;

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
  final WidgetStatus status;

  /// Controls the card's border radius. If none is passed, uses [EqThemeData.defaultWidgetShape].
  final WidgetShape shape;

  /// Controls the card's status appearance. See [status] for more details.
  final CardStatusAppearance statusAppearance;

  /// Controls the padding of the child. Also sets the [headerPadding] and [footerPadding] if they're null.
  final EdgeInsets padding;

  /// Controls the padding for the header. Gets set by [padding] if it's `null`. See [header].
  final EdgeInsets headerPadding;
  
  /// Controls the padding for the footer. Gets set by [padding] if it's `null`. See [footer].
  final EdgeInsets footerPadding;

  const EqCard({
    Key key,
    @required this.child,
    this.header,
    this.footer,
    this.status = WidgetStatus.primary,
    this.shape,
    this.statusAppearance = CardStatusAppearance.header,
    this.padding = const EdgeInsets.all(16.0),
    this.headerPadding,
    this.footerPadding,
  }) : super(key: key);

  Widget _buildBody(EqThemeData theme) {
    var widgets = <Widget>[];

    if (header != null) {
      if (status != null &&
          this.statusAppearance == CardStatusAppearance.strip) {
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
          this.statusAppearance == CardStatusAppearance.header)) {
        widgets.add(EqDivider());
      }
    }
    widgets.add(Padding(padding: padding, child: child));

    if (footer != null) {
      widgets.add(EqDivider());
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
    if (this.statusAppearance != CardStatusAppearance.body) {
      return MaterialDesign.DefaultTextStyle(
        child: column,
        style: TextStyle(
          color: theme.textBasicColor,
        ),
      );
    } else {
      return MaterialDesign.DefaultTextStyle(
        child: column,
        style: TextStyle(
          color: MaterialDesign.Colors.white,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = EqTheme.of(context);
    var borderRadius =
        WidgetShapeUtils.getMultiplier(shape: shape ?? theme.defaultWidgetShape) * theme.borderRadius;

    var backgroundColor = (this.statusAppearance != CardStatusAppearance.body)
        ? theme.backgroundBasicColors.color1
        : theme.getColorsForStatus(status: status).shade500;

    return AnimatedContainer(
      duration: theme.minorAnimationDuration,
      curve: theme.minorAnimationCurve,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [theme.shadow],
        color: backgroundColor,
      ),
      child: MaterialDesign.Material(
        type: MaterialDesign.MaterialType.transparency,
        child: _buildBody(theme),
      ),
    );
  }
}

class _CardHeader extends StatelessWidget {
  final WidgetStatus status;
  final WidgetShape shape;
  final CardStatusAppearance statusAppearance;
  final EdgeInsets padding;
  final Widget child;

  const _CardHeader(
      {MaterialDesign.Key key,
      this.status,
      this.shape,
      this.statusAppearance,
      this.padding,
      @required this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var theme = EqTheme.of(context);
    var statusColor = theme.getColorsForStatus(status: status).shade500;
    var borderRadius =
        WidgetShapeUtils.getMultiplier(shape: shape) * theme.borderRadius;

    var headerPainted = status != null &&
        (this.statusAppearance == CardStatusAppearance.header ||
            this.statusAppearance == CardStatusAppearance.body);

    var headerColor =
        (headerPainted) ? statusColor : MaterialDesign.Colors.transparent;

    var headerTextColor =
        (headerPainted) ? MaterialDesign.Colors.white : theme.textBasicColor;

    return AnimatedContainer(
      duration: theme.minorAnimationDuration,
      curve: theme.minorAnimationCurve,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(borderRadius)),
        color: headerColor,
      ),
      child: MaterialDesign.Material(
        type: MaterialDesign.MaterialType.transparency,
        child: Padding(
          padding: padding,
          child: MaterialDesign.DefaultTextStyle(
            style: theme.subtitle1.textStyle.copyWith(
              color: headerTextColor,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

class _CardFooter extends StatelessWidget {
  final WidgetStatus status;
  final WidgetShape shape;
  final CardStatusAppearance statusAppearance;
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
    var theme = EqTheme.of(context);

    var painted =
        status != null && (this.statusAppearance == CardStatusAppearance.body);

    var textColor = (painted) ? theme.textAlternateColor : theme.textBasicColor;

    return Container(
      width: double.infinity,
      child: MaterialDesign.Material(
        type: MaterialDesign.MaterialType.transparency,
        child: Padding(
          padding: padding,
          child: MaterialDesign.DefaultTextStyle(
            style: TextStyle(
              color: textColor,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

class _CardStatusStripWidget extends StatelessWidget {
  final WidgetStatus status;
  final WidgetShape shape;

  const _CardStatusStripWidget(
      {MaterialDesign.Key key, this.status, this.shape})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var theme = EqTheme.of(context);
    return AnimatedContainer(
      duration: theme.minorAnimationDuration,
      curve: theme.minorAnimationCurve,
      width: double.infinity,
      height: 4.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(WidgetShapeUtils.getMultiplier(shape: shape) *
              theme.borderRadius),
          bottom: Radius.zero,
        ),
        color: theme.getColorsForStatus(status: status).shade500,
      ),
    );
  }
}
