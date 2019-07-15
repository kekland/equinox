import 'package:equinox/equinox.dart';
import 'package:equinox/src/equinox_internal.dart';
import 'package:flutter/widgets.dart';

export 'package:equinox/src/components/list_item/list_item_style.dart';

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
  final EqWidgetStatus status;

  /// This method is called when user presses the item.
  final VoidCallback onTap;

  const EqListItem({
    Key key,
    this.icon,
    @required this.title,
    @required this.onTap,
    this.subtitle,
    this.status = EqWidgetStatus.primary,
    this.active = false,
  }) : super(key: key);

  @override
  _EqListItemState createState() => _EqListItemState();
}

class _EqListItemState extends State<EqListItem> {
  bool isPressing = false;

  @override
  Widget build(BuildContext context) {
    final style = StaticStyle.of(context);
    final active = widget.active;
    final focused = isPressing;
    final disabled = widget.onTap == null;
    return OutlinedGestureDetector(
      onTap: widget.onTap,
      onOutlineChange: (v) => setState(() => isPressing = v),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            if (widget.icon != null) ...[
              Icon(widget.icon,
                  color: style.get(generateSelector([
                    'list-item-icon',
                    (disabled) ? 'disabled' : widget.status,
                    (focused) ? 'focused' : (active) ? 'active' : null,
                    'color'
                  ]))),
              SizedBox(width: 16.0),
            ],
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.title,
                  style: TextStyle(
                    fontWeight: style.get('list-item-title-font-weight'),
                    fontSize: style.get('list-item-title-font-size'),
                    fontFamily: style.get('list-item-title-font-family'),
                    color: style.get(generateSelector([
                      'list-item-title',
                      (disabled) ? 'disabled' : widget.status,
                      (focused)
                          ? 'focused'
                          : (active && !disabled) ? 'active' : null,
                      'color'
                    ])),
                  ),
                ),
                if (widget.subtitle != null)
                  Text(
                    widget.subtitle,
                    style: TextStyle(
                      fontWeight: style.get('list-item-subtitle-font-weight'),
                      fontSize: style.get('list-item-subtitle-font-size'),
                      fontFamily: style.get('list-item-subtitle-font-family'),
                      color: style.get(generateSelector([
                        'list-item-subtitle',
                        (disabled) ? 'disabled' : widget.status,
                        (focused)
                            ? 'focused'
                            : (active && !disabled) ? 'active' : null,
                        'color'
                      ])),
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
