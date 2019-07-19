import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart' as MaterialDesign;

/// A widget that represents a page. Similar to [Scaffold].
class EqLayout extends StatefulWidget {
  /// A theme to use in this page. Overwrites the [EquinoxApp.theme].
  final StyleData theme;

  /// Page's body. Will be placed below [appBar].
  final Widget child;

  /// A slot for [EqAppBar] or other application bars. Can be `null`.
  final PreferredSizeWidget appBar;

  /// A slot for [EqTabBar.bottom()] or other widget to place on the bottom. Can be `null`.
  final PreferredSizeWidget bottomTabBar;

  const EqLayout({
    Key key,
    this.theme,
    @required this.child,
    this.appBar,
    this.bottomTabBar,
  }) : super(key: key);
  @override
  _EqLayoutState createState() => _EqLayoutState();
}

class _EqLayoutState extends State<EqLayout> {
  @override
  Widget build(BuildContext context) {
    final theme = widget.theme ?? StaticStyle.of(context)?.style;
    return EqTheme(
      theme: theme,
      child: AnimatedContainer(
        duration: theme.get('major-animation-duration'),
        curve: theme.get('major-animation-curve'),
        color: theme.get('background-basic-color-3'),
        child: MaterialDesign.Material(
          type: MaterialDesign.MaterialType.transparency,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: (widget.appBar != null)
                    ? widget.appBar.preferredSize.height + MediaQuery.of(context).padding.top
                    : 0.0,
                bottom: (widget.bottomTabBar != null)
                    ? widget.bottomTabBar.preferredSize.height
                    : 0.0,
                left: 0.0,
                right: 0.0,
                child: widget.child,
              ),
              if (widget.appBar != null) widget.appBar,
              if (widget.bottomTabBar != null)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: widget.bottomTabBar,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
