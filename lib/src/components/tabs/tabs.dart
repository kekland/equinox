import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';
export 'package:equinox/src/components/tabs/tab.dart';

/// Tabs are generally put inside [EqAppBar.bottom]. It can be used to display various
/// paths or pages.
///
/// [tabs] must not be null.
class EqTabs extends StatefulWidget implements PreferredSizeWidget {
  /// Index of a tab that is selected by default.
  final int defaultSelected;

  /// This method is called when a tab is selected. Can be `null` to make all tabs disabled.
  final Function(int) onSelect;

  /// List of all tabs. See [EqTabData] for more;
  final List<EqTabData> tabs;

  /// Whether to show the pager indicator
  final bool showPagerIndicator;

  /// Position of the pager indicator (on top or on bottom)
  final EqVerticalPositioning pagerIndicatorPosition;

  const EqTabs({
    Key key,
    this.defaultSelected,
    @required this.onSelect,
    @required this.tabs,
    this.showPagerIndicator = true,
    this.pagerIndicatorPosition = EqVerticalPositioning.bottom,
  }) : super(key: key);
  @override
  _EqTabsState createState() => _EqTabsState();

  @override
  Size get preferredSize => Size.fromHeight(48.0);
}

class _EqTabsState extends State<EqTabs> {
  int selected = 0;

  @override
  void initState() {
    if (widget.defaultSelected != null) selected = widget.defaultSelected;
    super.initState();
  }

  void onSelect(int index) {
    selected = index;
    widget.onSelect(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var tabs = <Widget>[];
    for (int i = 0; i < widget.tabs.length; i++) {
      final tab = widget.tabs[i];
      tabs.add(
        Flexible(
          flex: 1,
          child: EqTab(
            pagerIndicatorAlignment:
                (widget.pagerIndicatorPosition == EqVerticalPositioning.top)
                    ? Alignment.topCenter
                    : Alignment.bottomCenter,
            showPagerIndicator: widget.showPagerIndicator,
            data: tab,
            active: selected == i,
            onTap: (tab.disabled || widget.onSelect == null)
                ? null
                : () => onSelect(i),
          ),
        ),
      );
      if (i != widget.tabs.length - 1) tabs.add(SizedBox(width: 4.0));
    }
    return Container(
      height: 48.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: tabs,
      ),
    );
  }
}
