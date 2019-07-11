import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';

/// EqTabBar is generally put inside [EqAppBar.bottom] or [EqLayout.bottomTabBar]. It can be used to display various
/// paths or pages. Use [EqTabBar.bottom()] if you want to make it a BottomTabBar, and [EqTabBar.top()] otherwise.
///
/// [tabs] must not be null.
class EqTabBar extends StatelessWidget {
  /// Index of a tab that is selected by default.
  final int defaultSelected;

  /// This method is called when a tab is selected. Can be `null` to make all tabs disabled.
  final Function(int) onSelect;

  /// List of all tabs. See [EqTabData] for more;
  final List<EqTabData> tabs;

  /// Whether this is a top tabbar or bottom tab bar.
  final EqVerticalPositioning position;

  const EqTabBar({
    Key key,
    this.defaultSelected,
    @required this.onSelect,
    @required this.tabs,
    this.position = EqVerticalPositioning.top,
  }) : super(key: key);

  const EqTabBar.top({
    Key key,
    this.defaultSelected,
    @required this.onSelect,
    @required this.tabs,
  })  : this.position = EqVerticalPositioning.top,
        super(key: key);

  const EqTabBar.bottom({
    Key key,
    this.defaultSelected,
    @required this.onSelect,
    @required this.tabs,
  })  : this.position = EqVerticalPositioning.bottom,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return EqTabs(
      onSelect: onSelect,
      tabs: tabs,
      defaultSelected: defaultSelected,
      showPagerIndicator: position == EqVerticalPositioning.top,
      pagerIndicatorPosition: this.position == EqVerticalPositioning.top
          ? EqVerticalPositioning.bottom
          : EqVerticalPositioning.top,
    );
  }
}
