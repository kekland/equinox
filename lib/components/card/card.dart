export 'package:equinox/components/card/card_status_appearance.dart';

import 'package:equinox/equinox.dart';

import 'package:flutter/material.dart' as MaterialDesign;
import 'package:flutter/widgets.dart';

class EqCard extends StatelessWidget {
  final Widget child;
  final Widget header;
  final Widget footer;
  final WidgetStatus status;
  final WidgetShape shape;
  final CardStatusAppearance statusAppearance;
  final EdgeInsets padding;
  final EdgeInsets headerPadding;
  final EdgeInsets footerPadding;

  const EqCard({
    Key key,
    @required this.child,
    this.header,
    this.footer,
    this.status = WidgetStatus.primary,
    this.shape = WidgetShape.rectangle,
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
        WidgetShapeUtils.getMultiplier(shape: shape) * theme.borderRadius;

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
