import 'package:eva_design_flutter/eva_design_flutter.dart';
import 'package:flutter/material.dart';

class EqAppBar extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool centerTitle;
  final bool inferLeading;
  final Widget leading;
  final List<Widget> actions;

  const EqAppBar({
    Key key,
    @required this.title,
    this.subtitle,
    this.centerTitle = true,
    this.leading,
    this.actions = const [],
    this.inferLeading = true,
  }) : super(key: key);

  List<Widget> _buildBody(BuildContext context, EqThemeData theme) {
    var list = <Widget>[];
    if (leading != null) {
      list.add(leading);
    } else if (leading == null &&
        inferLeading &&
        Navigator.of(context).canPop()) {
      list.add(
        new EqIconButton(
          icon: Icons.arrow_back,
          size: WidgetSize.giant,
          color: Colors.black,
          status: WidgetStatus.basic,
          appearance: WidgetAppearance.ghost,
          onTap: () => Navigator.pop(context),
        ),
      );
    }

    list.add(
      Expanded(
        child: _AppBarTitle(
          title: title,
          subtitle: subtitle,
          centered: centerTitle,
        ),
      ),
    );
    return list;
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
          height: 64.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Row(children: _buildBody(context, theme)),
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
