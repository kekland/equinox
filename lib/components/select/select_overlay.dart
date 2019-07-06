import 'package:equinox/components/global/internal_card.dart';
import 'package:equinox/components/list_item/list_item.dart';
import 'package:equinox/equinox.dart';
import 'package:flutter/material.dart';

class EqSelectOverlay extends StatelessWidget {
  final EqThemeData theme;
  final WidgetStatus status;
  final Animation<double> animation;
  final double borderRadius;
  final List<EqSelectItem> items;
  final int selectedIndex;
  final void Function(int, EqSelectItem) onSelect;
  final bool openingFromBottom;

  const EqSelectOverlay({
    Key key,
    this.theme,
    this.animation,
    this.borderRadius,
    this.items,
    this.selectedIndex,
    this.onSelect,
    this.status,
    this.openingFromBottom,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (ctx, child) => EqInternalCard(
            themeOverride: theme,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular((!openingFromBottom)? borderRadius : 0.0),
              bottom: Radius.circular((openingFromBottom)? borderRadius : 0.0),
            ),
            child: SizeTransition(
              axis: Axis.vertical,
              sizeFactor: animation,
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: items.map((item) {
                  int index = items.indexOf(item);
                  return EqListItem(
                    themeOverride: theme,
                    title: item.title,
                    subtitle: item.subtitle,
                    icon: item.icon,
                    onTap: () => onSelect(index, item),
                    status: status,
                    active: index == selectedIndex,
                  );
                }).toList(),
              ),
            ),
          ),
    );
  }
}
