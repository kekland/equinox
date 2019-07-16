import 'dart:math';

import 'package:equinox/equinox.dart';
import 'package:equinox/src/equinox_internal.dart';
import 'package:flutter/widgets.dart';

class EqSelectOverlay extends StatelessWidget {
  final EqWidgetStatus status;
  final Animation<double> animation;
  final double borderRadius;
  final List<EqSelectItem> items;
  final int selectedIndex;
  final void Function(int, EqSelectItem) onSelect;
  final bool openingFromBottom;
  final double height;

  const EqSelectOverlay({
    Key key,
    this.animation,
    this.borderRadius,
    this.items,
    this.selectedIndex,
    this.onSelect,
    this.status,
    this.openingFromBottom,
    this.height,
  }) : super(key: key);

  Widget _buildBody(BuildContext context, Widget child) {
    final style = StaticStyle.of(context);
    if (openingFromBottom)
      return child;
    else
      return ClipRect(
        child: child,
        clipper: VerticalRectangleClipper(
          shadowSize: style.get('shadow').blurRadius,
          verticalMultiplier: 1.0,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final style = StaticStyle.of(context);
    final maxBorderRadius = style.get('border-radius-semi-round');
    final borderRadiusValue = min<double>(borderRadius, maxBorderRadius);
    return AnimatedBuilder(
      animation: animation,
      builder: (ctx, child) => Container(
            constraints: BoxConstraints(maxHeight: height),
            child: EqCard(
              borderRadius: (openingFromBottom)
                  ? BorderRadius.vertical(
                      top: Radius.zero,
                      bottom: Radius.circular(borderRadiusValue),
                    )
                  : BorderRadius.vertical(
                      top: Radius.circular(borderRadiusValue),
                      bottom: Radius.zero,
                    ),
              padding: EdgeInsets.zero,
              child: SizeTransition(
                axis: Axis.vertical,
                sizeFactor: animation,
                child: SizedBox(
                  height: height,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    children: items.map((item) {
                      int index = items.indexOf(item);
                      return EqListItem(
                        title: item.title,
                        subtitle: item.subtitle,
                        padding: EdgeInsets.all(16.0),
                        icon: item.icon,
                        onTap: () => onSelect(index, item),
                        status: status,
                        active: index == selectedIndex,
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
    );
  }
}
