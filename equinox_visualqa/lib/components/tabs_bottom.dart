import 'package:equinox/equinox.dart';
import 'package:equinox_visualqa/management/showcase_state.dart';
import 'package:flutter/material.dart';

class TabsBottomShowcase extends StatefulWidget {
  @override
  _TabsBottomShowcaseState createState() => _TabsBottomShowcaseState();
}

class _TabsBottomShowcaseState extends ShowcaseState<TabsBottomShowcase> {
  @override
  Widget playgroundBuilder() => InteractivePlayground(
        data: {
          'enabled': BoolTyped(true),
          'hasIcons': BoolTyped(true),
        },
        builder: (_, data) => EqTabBar.bottom(
              tabs: [
                EqTabData(icon: data['hasIcons']? EvaIcons.star: null, title: 'Tab'),
                EqTabData(icon: data['hasIcons']? EvaIcons.star: null, title: 'Tab'),
                EqTabData(icon: data['hasIcons']? EvaIcons.star: null, title: 'Tab'),
              ],
              onSelect: data['enabled'] ? (i) {} : null,
            ),
      );

  @override
  String get showcaseName => 'Bottom TabBar';

  @override
  List<ShowcaseWidgetData> get showcases => [
        ShowcaseWidgetData(
          title: 'Bottom TabBar',
          builder: () => EqCard(
            padding: const EdgeInsets.all(4.0),
            child: EqTabBar.bottom(
              tabs: [
                EqTabData(icon: EvaIcons.star, title: 'Tab'),
                EqTabData(icon: EvaIcons.star, title: 'Tab'),
                EqTabData(icon: EvaIcons.star, title: 'Tab'),
              ],
              onSelect: (_) {},
            ),
          ),
        ),
        ShowcaseWidgetData(
          title: 'Tabs without icons',
          builder: () => EqCard(
            padding: const EdgeInsets.all(4.0),
            child: EqTabBar.bottom(
              tabs: [
                EqTabData(title: 'Tab'),
                EqTabData(title: 'Tab'),
                EqTabData(title: 'Tab'),
              ],
              onSelect: (_) {},
            ),
          ),
        ),
        ShowcaseWidgetData(
          title: 'Disabled tabs',
          builder: () => EqCard(
            padding: const EdgeInsets.all(4.0),
            child: EqTabBar.bottom(
              tabs: [
                EqTabData(icon: EvaIcons.star, title: 'Tab'),
                EqTabData(icon: EvaIcons.star, title: 'Tab'),
                EqTabData(icon: EvaIcons.star, title: 'Tab'),
              ],
              onSelect: null,
            ),
          ),
        ),
        ShowcaseWidgetData(
          title: 'Partially disabled tabs',
          builder: () => EqCard(
            padding: const EdgeInsets.all(4.0),
            child: EqTabBar.bottom(
              tabs: [
                EqTabData(icon: EvaIcons.star, title: 'Tab'),
                EqTabData(icon: EvaIcons.star, title: 'Tab', disabled: true),
                EqTabData(icon: EvaIcons.star, title: 'Tab'),
              ],
              onSelect: (i) {},
            ),
          ),
        ),
      ];
}
