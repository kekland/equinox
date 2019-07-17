import 'package:equinox/equinox.dart';
import 'package:flutter/material.dart';
import 'package:equinox_visualqa/management/showcase_state.dart';

class TabsShowcase extends StatefulWidget {
  @override
  _TabsShowcaseState createState() => _TabsShowcaseState();
}

class _TabsShowcaseState extends ShowcaseState<TabsShowcase> {
  @override
  Widget playgroundBuilder() => InteractivePlayground(
        data: {
          'enabled': BoolTyped(true),
          'hasIcons': BoolTyped(true),
        },
        builder: (_, data) => EqTabBar.top(
              tabs: [
                EqTabData(icon: data['hasIcons']? EvaIcons.star: null, title: 'Tab'),
                EqTabData(icon: data['hasIcons']? EvaIcons.star: null, title: 'Tab'),
                EqTabData(icon: data['hasIcons']? EvaIcons.star: null, title: 'Tab'),
              ],
              onSelect: data['enabled'] ? (i) {} : null,
            ),
      );

  @override
  String get showcaseName => 'TabBar';

  @override
  List<ShowcaseWidgetData> get showcases => [
        ShowcaseWidgetData(
          title: 'Tabs',
          builder: () => EqCard(
            padding: const EdgeInsets.all(4.0),
            child: EqTabBar.top(
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
            child: EqTabBar.top(
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
            child: EqTabBar.top(
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
            child: EqTabBar.top(
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
