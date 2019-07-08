import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';

class EqAppBar extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool centerTitle;
  final bool inferLeading;
  final Widget leading;
  final List<Widget> actions;
  final Widget bottom;
  final bool hasTitle;

  const EqAppBar({
    Key key,
    @required this.title,
    this.subtitle,
    this.centerTitle = true,
    this.leading,
    this.actions = const [],
    this.inferLeading = true,
    this.bottom,
    this.hasTitle = true,
  }) : super(key: key);

  const EqAppBar.withoutTitle({
    Key key,
    @required this.bottom,
  })  : this.title = null,
        this.subtitle = null,
        this.centerTitle = false,
        this.leading = null,
        this.actions = null,
        this.inferLeading = false,
        this.hasTitle = false;

  Widget _buildBody(BuildContext context, EqThemeData theme) {
    var leadingWidget;
    if (leading != null) {
      leadingWidget = leading;
    } else if (leading == null &&
        inferLeading &&
        Navigator.of(context).canPop()) {
      leadingWidget = new EqIconButton(
        icon: EvaIcons.arrowBack,
        size: WidgetSize.giant,
        color: theme.textBasicColor,
        status: WidgetStatus.basic,
        appearance: WidgetAppearance.ghost,
        onTap: () => Navigator.pop(context),
      );
    }

    var actionsWidgets = actions ?? [];

    if (centerTitle) {
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
    if(hasTitle) height += 64.0;
    if(bottom != null) height += 56.0;
    return height;
  }

  @override
  Widget build(BuildContext context) {
    var theme = EqTheme.of(context);
    return AnimatedContainer(
      duration: theme.majorAnimationDuration,
      curve: theme.majorAnimationCurve,
      decoration: BoxDecoration(
        color: theme.backgroundBasicColors.color1,
        boxShadow: [theme.shadow],
      ),
      child: SafeArea(
        bottom: true,
        child: Container(
          height: _calculateHeight(),
          child: Column(
            children: [
              if (hasTitle)
                Container(
                  height: 64.0,
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: _buildBody(context, theme),
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
    var theme = EqTheme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment:
          (centered) ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(title,
            style:
                theme.heading6.textStyle.copyWith(color: theme.textBasicColor)),
        if (subtitle != null)
          Text(subtitle,
              style: theme.caption2.textStyle
                  .copyWith(color: theme.textHintColor)),
      ],
    );
  }
}
