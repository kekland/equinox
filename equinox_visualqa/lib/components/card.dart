import 'package:equinox/equinox.dart';
import 'package:flutter/material.dart';
import 'package:equinox_visualqa/management/showcase_state.dart';

String equinoxDescription =
    "An equinox is commonly regarded as the instant of time when the plane (extended indefinitely in all directions) of Earth's equator passes through the center of the Sun.";

class CardShowcase extends StatefulWidget {
  @override
  _CardShowcaseState createState() => _CardShowcaseState();
}

class _CardShowcaseState extends ShowcaseState<CardShowcase> {
  @override
  InteractivePlayground playgroundBuilder() => InteractivePlayground(
          builder: (_, data) => EqCard(
                header: data['header'] ? Text('Header') : null,
                footer: data['footer'] ? Text('Footer') : null,
                child: Text(equinoxDescription),
                shape: data['shape'],
                status: data['status'],
                statusAppearance: data['appearance'],
              ),
          data: {
            'header': BoolTyped(true),
            'footer': BoolTyped(true),
            'shape': EnumTyped(WidgetShape.rectangle, WidgetShape.values),
            'status': EnumTyped(WidgetStatus.primary, WidgetStatus.values),
            'appearance': EnumTyped(
                CardStatusAppearance.header, CardStatusAppearance.values),
          });

  @override
  String get showcaseName => 'Cards';

  @override
  List<ShowcaseWidgetData> get showcases => [
        ShowcaseWidgetData(
          builder: () => EqCard(
                statusAppearance: CardStatusAppearance.none,
                header: Text('Basic card'),
                child: Text(equinoxDescription),
              ),
          override: true,
        ),
        ShowcaseWidgetData(
          builder: () => EqCard(
                statusAppearance: CardStatusAppearance.none,
                header: Text('With header and footer'),
                child: Text(equinoxDescription),
                footer: Text('By Wikipedia'),
              ),
          override: true,
        ),
        ShowcaseWidgetData(
          builder: () => EqCard(
                status: WidgetStatus.success,
                statusAppearance: CardStatusAppearance.header,
                header: Text('With status'),
                child: Text(equinoxDescription),
                footer: Text('By Wikipedia'),
              ),
          override: true,
        ),
        ShowcaseWidgetData(
          builder: () => EqCard(
                status: WidgetStatus.warning,
                statusAppearance: CardStatusAppearance.strip,
                header: Text('With status as a tiny strip'),
                child: Text(equinoxDescription),
                footer: Text('By Wikipedia'),
              ),
          override: true,
        ),
        ShowcaseWidgetData(
          builder: () => EqCard(
                status: WidgetStatus.danger,
                statusAppearance: CardStatusAppearance.body,
                header: Text('Full colored'),
                child: Text(equinoxDescription),
              ),
          override: true,
        ),
        ShowcaseWidgetData(
          title: 'Card shapes',
          builder: () => Column(
                children: [
                  EqCard(
                    status: WidgetStatus.success,
                    statusAppearance: CardStatusAppearance.strip,
                    header: Text('Rectangle'),
                    child: Text(equinoxDescription),
                    shape: WidgetShape.rectangle,
                    footer: Text('By Wikipedia'),
                  ),
                  SizedBox(height: 16.0),
                  EqCard(
                    status: WidgetStatus.danger,
                    shape: WidgetShape.semiRound,
                    statusAppearance: CardStatusAppearance.strip,
                    header: Text('Semi Round'),
                    child: Text(equinoxDescription),
                    footer: Text('By Wikipedia'),
                  ),
                ],
              ),
        ),
      ];
}
