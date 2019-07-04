import 'package:eva_design_flutter/eva_design_flutter.dart';
import 'package:flutter/material.dart';
export 'package:eva_design_flutter/components/tabs/tab.dart';

class EqTabs extends StatefulWidget {
  final int defaultSelected;
  final Function(int) onSelect;
  final List<EqTabData> tabs;

  const EqTabs({
    Key key,
    this.defaultSelected,
    @required this.onSelect,
    @required this.tabs,
  }) : super(key: key);
  @override
  _EqTabsState createState() => _EqTabsState();
}

class _EqTabsState extends State<EqTabs> {
  int selected = 0;

  @override
  void initState() {
    if (widget.defaultSelected != null) selected = widget.defaultSelected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = EqTheme.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        var tabs = <Widget>[];
        for (int i = 0; i < widget.tabs.length; i++) {
          final tab = widget.tabs[i];
          tabs.add(
            Flexible(
              flex: 1,
              child: EqTab(
                data: tab,
                active: selected == i,
                onTap:
                    (tab.disabled) ? null : () => setState(() => selected = i),
              ),
            ),
          );
          if (i != widget.tabs.length - 1) tabs.add(SizedBox(width: 4.0));
        }
        print(constraints);
        return Container(
          height: 48.0,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: tabs,
          ),
        );
      },
    );
  }
}
