import 'package:equinox/src/equinox_internal.dart';
import 'package:flutter/widgets.dart';

import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart' as MaterialDesign;

export 'package:equinox/src/components/app_bar/app_bar_style.dart';
import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';

/// AppBar is used in [EqLayout]. It is displayed on top of a page.
class EqAppBar extends StatelessWidget {
  /// Title of the page. Use [EqAppBar.withoutTitle()] if you want no title.
  final String title;

  /// Text under the title. Optional.
  final String subtitle;

  /// Whether the title should be centered.
  final bool centerTitle;

  /// Recognizes if this page can be popped (using [Navigator.canPop()]) and adds back button
  /// if it can be. Overwritten by [leading].
  final bool inferLeading;

  /// A widget (usually a [EqIconButton]) in the left.
  final Widget leading;

  /// Set of actions. Usually a list of [EqIconButton].
  final List<Widget> actions;

  /// Widget to display on the bottom. Must be 56 pixels tall. Usually it is [EqTabs].
  final Widget bottom;

  /// Does this app bar have a title?
  final bool hasTitle;

  // Color to use in the background.
  final Color backgroundColor;

  // Color to use in the foreground.
  final Color foregroundColor;

  const EqAppBar({
    Key key,
    @required this.title,
    this.subtitle,
    this.centerTitle,
    this.leading,
    this.actions = const [],
    this.inferLeading = true,
    this.bottom,
    this.hasTitle = true,
    this.backgroundColor,
    this.foregroundColor,
  }) : super(key: key);

  const EqAppBar.withoutTitle({
    Key key,
    @required this.bottom,
    this.backgroundColor,
    this.foregroundColor,
  })  : this.title = null,
        this.subtitle = null,
        this.centerTitle = false,
        this.leading = null,
        this.actions = null,
        this.inferLeading = false,
        this.hasTitle = false;

  Widget _buildBody(BuildContext context, StaticStyleState theme) {
    var leadingWidget;
    if (leading != null) {
      leadingWidget = leading;
    } else if (leading == null &&
        inferLeading &&
        Navigator.of(context).canPop()) {
      /* TODO leadingWidget = new EqIconButton(
        icon: EvaIcons.arrowBack,
        size: WidgetSize.giant,
        color: theme.textBasicColor,
        status: WidgetStatus.basic,
        appearance: WidgetAppearance.ghost,
        onTap: () => Navigator.pop(context),
      );*/
    }

    var actionsWidgets = actions ?? [];

    if ((centerTitle != null && centerTitle) ||
        (theme.get('app-bar-title-center'))) {
      return Stack(
        alignment: Alignment.center,
        children: [
          Row(
            children: [
              if (leadingWidget != null) leadingWidget,
              Expanded(child: SizedBox()),
              ...actionsWidgets,
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: _AppBarTitle(
              title: title,
              subtitle: subtitle,
              centered: centerTitle,
            ),
          ),
        ],
      );
    } else {
      return Row(
        children: [
          if (leadingWidget != null) ...[leadingWidget, SizedBox(width: 8.0)],
          _AppBarTitle(
            title: title,
            subtitle: subtitle,
            centered: centerTitle,
          ),
          SizedBox(width: 8.0),
          Expanded(child: SizedBox()),
          ...actionsWidgets,
        ],
      );
    }
  }

  double _calculateHeight() {
    double height = 0.0;
    if (hasTitle) height += 64.0;
    if (bottom != null) height += 56.0;
    return height;
  }

  @override
  Widget build(BuildContext context) {
    final style = StaticStyle.of(context);
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? style.get('app-bar-background-color'),
        boxShadow: [style.get('shadow')],
      ),
      child: SafeArea(
        top: true,
        bottom: false,
        child: Container(
          height: _calculateHeight(),
          child: Column(
            children: [
              if (hasTitle)
                Container(
                  height: 64.0,
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: _buildBody(context, style),
                ),
              if (bottom != null)
                Container(
                  height: 56.0,
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: bottom,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AppBarTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool centered;

  const _AppBarTitle({Key key, this.title, this.subtitle, this.centered})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final style = StaticStyle.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment:
          (centered) ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: style.get("app-bar-title-font-weight"),
            fontSize: style.get("app-bar-title-font-size"),
            fontFamily: style.get("app-bar-title-font-family"),
            color: style.get("app-bar-title-color"),
          ),
        ),
        if (subtitle != null)
          Text(
            subtitle,
            style: TextStyle(
              fontWeight: style.get("app-bar-subtitle-font-weight"),
              fontSize: style.get("app-bar-subtitle-font-size"),
              fontFamily: style.get("app-bar-subtitle-font-family"),
              color: style.get("app-bar-subtitle-color"),
            ),
          ),
      ],
    );
  }
}
