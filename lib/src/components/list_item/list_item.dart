import 'package:equinox/equinox.dart';
import 'package:equinox/src/equinox_internal.dart';
import 'package:flutter/widgets.dart';

/// EqListItem is used to display a line of information, typically in a list.
class EqListItem extends StatefulWidget {
  /// Icon to display before the content.
  final IconData icon;

  /// The main information of this item.
  final String title;

  /// Additional information.
  final String subtitle;

  /// Active means that this list item is highlighted (selected).
  final bool active;

  /// Controls the colors.
  final WidgetStatus status;

  /// This method is called when user presses the item.
  final VoidCallback onTap;

  /// Use this if you want to override the theme.
  final EqThemeData themeOverride;

  const EqListItem({
    Key key,
    this.icon,
    @required this.title,
    @required this.onTap,
    this.subtitle,
    this.status,
    this.active = false,
    this.themeOverride,
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
    var theme = widget.themeOverride ?? EqTheme.of(context);

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
