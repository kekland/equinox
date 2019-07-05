import 'package:equinox/equinox.dart';
import 'package:flutter/material.dart';

class EqListItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool active;
  final WidgetStatus status;
  final VoidCallback onTap;

  const EqListItem({
    Key key,
    this.icon,
    @required this.title,
    @required this.onTap,
    this.subtitle,
    this.status,
    this.active = false,
  }) : super(key: key);

  @override
  _EqListItemState createState() => _EqListItemState();
}

class _EqListItemState extends State<EqListItem> {
  bool isPressing = false;

  Color getTitleColor(EqThemeData theme) {
    if (widget.onTap == null) return theme.textDisabledColor;
    if (widget.active)
      return theme.getColorsForStatus(status: widget.status).shade500;
    if (isPressing)
      return theme.getColorsForStatus(status: widget.status).shade400;
    return theme.textBasicColor;
  }

  Color getSubtitleColor(EqThemeData theme) {
    if (widget.onTap == null) return theme.textDisabledColor;
    if (widget.active)
      return theme.getColorsForStatus(status: widget.status).shade400;
    if (isPressing)
      return theme.getColorsForStatus(status: widget.status).shade300;
    return theme.textHintColor;
  }

  @override
  Widget build(BuildContext context) {
    var theme = EqTheme.of(context);

    var textColor = getTitleColor(theme);
    var subtitleTextColor = getSubtitleColor(theme);

    return OutlinedGestureDetector(
      onTap: widget.onTap,
      onOutlineChange: (v) => setState(() => isPressing = v),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            if (widget.icon != null) ...[
              Icon(widget.icon, color: subtitleTextColor),
              SizedBox(width: 16.0),
            ],
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.title,
                  style: theme.subtitle1.textStyle.copyWith(
                    color: textColor,
                  ),
                ),
                if (widget.subtitle != null)
                  Text(
                    widget.subtitle,
                    style: theme.paragraph2.textStyle.copyWith(
                      color: subtitleTextColor,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
