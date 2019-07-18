import 'package:equinox/equinox.dart';
import 'package:equinox/src/equinox_internal.dart';
import 'package:flutter/widgets.dart';

export 'package:equinox/src/components/tabs/tab_style.dart';

/// A data for tab. Either [icon] or [title] must be present.
class EqTabData {
  /// Leading widget to display alongside [title].
  final WidgetBuilder leading;

  /// Label to display. Can be null.
  final WidgetBuilder title;

  /// Whether the tab is disabled or not. By default it is false.
  final bool disabled;

  EqTabData({
    this.leading,
    this.title,
    this.disabled = false,
  });

  factory EqTabData.fromIcon(
      {String title, IconData icon, bool disabled, double iconSize = 18.0}) {
    return EqTabData(
      leading: (_) => EqIcon(icon, size: iconSize),
      title: (_) => Text(title),
      disabled: disabled,
    );
  }
}

/// A singular tab. [data] must not be null.
class EqTab extends StatefulWidget {
  final EqTabData data;
  final bool active;
  final VoidCallback onTap;
  final bool showPagerIndicator;
  final Alignment pagerIndicatorAlignment;

  const EqTab({
    Key key,
    this.data,
    this.active = false,
    this.onTap,
    this.showPagerIndicator = true,
    this.pagerIndicatorAlignment = Alignment.bottomCenter,
  }) : super(key: key);

  @override
  _EqTabState createState() => _EqTabState();
}

class _EqTabState extends State<EqTab> {
  bool tapping = false;

  @override
  Widget build(BuildContext context) {
    final style = StaticStyle.of(context);

    final disabled = widget.onTap == null;
    final active = widget.active;
    final hover = tapping;

    final foregroundColor = style.get(generateSelector([
      'tab-foreground',
      (disabled) ? 'disabled' : (active) ? 'active' : null,
      'color'
    ]));
    var containerColor = style.get(generateSelector([
      'tab-indicator',
      (disabled) ? 'disabled' : (hover) ? 'hover' : (active) ? 'active' : null,
      'color'
    ]));

    return OutlinedGestureDetector(
      onOutlineChange: (v) => setState(() => tapping = v),
      onTap: widget.onTap,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: StaticStyle(
          data: style.style.fork()
            ..inject(StyleData({
              'icon-color': foregroundColor,
            })),
          child: AnimatedDefaultTextStyle(
            duration: style.get('minor-animation-duration'),
            curve: style.get('minor-animation-curve'),
            style: TextStyle(
              fontFamily: style.get('tab-text-font-family'),
              fontSize: style.get('tab-text-font-size'),
              fontWeight: style.get('tab-text-font-weight'),
              color: foregroundColor,
            ),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (widget.data.leading != null)
                        widget.data.leading(context),
                      if (widget.data.leading != null &&
                          widget.data.title != null)
                        SizedBox(height: 2.0),
                      if (widget.data.title != null) widget.data.title(context),
                    ],
                  ),
                ),
                if (widget.showPagerIndicator)
                  Align(
                    alignment: widget.pagerIndicatorAlignment,
                    child: AnimatedContainer(
                      duration: style.get('minor-animation-duration'),
                      curve: style.get('minor-animation-curve'),
                      width: double.infinity,
                      height: 4.0,
                      decoration: BoxDecoration(
                        color: containerColor,
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
