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
  Widget playgroundBuilder() => SizedBox();

  @override
  String get showcaseName => 'Cards';

  @override
  List<ShowcaseWidgetData> get showcases => [
        ShowcaseWidgetData(
          builder: () => EqCard(
                statusAppearance: EqCardStatusAppearance.none,
                header: Text('Basic card'),
                child: Text(equinoxDescription),
              ),
          override: true,
        ),
        ShowcaseWidgetData(
          builder: () => EqCard(
                statusAppearance: EqCardStatusAppearance.none,
                header: Text('With header and footer'),
                child: Text(equinoxDescription),
                footer: Text('By Wikipedia'),
              ),
          override: true,
        ),
        ShowcaseWidgetData(
          builder: () => EqCard(
                status: EqWidgetStatus.success,
                statusAppearance: EqCardStatusAppearance.header,
                header: Text('With status'),
                child: Text(equinoxDescription),
                footer: Text('By Wikipedia'),
              ),
          override: true,
        ),
        ShowcaseWidgetData(
          builder: () => EqCard(
                status: EqWidgetStatus.warning,
                statusAppearance: EqCardStatusAppearance.strip,
                header: Text('With status as a tiny strip'),
                child: Text(equinoxDescription),
                footer: Text('By Wikipedia'),
              ),
          override: true,
        ),
        ShowcaseWidgetData(
          title: 'Card shapes',
          builder: () => Column(
                children: [
                  EqCard(
                    status: EqWidgetStatus.success,
                    statusAppearance: EqCardStatusAppearance.strip,
                    header: Text('Rectangle'),
                    child: Text(equinoxDescription),
                    shape: EqWidgetShape.rectangle,
                    footer: Text('By Wikipedia'),
                  ),
                  SizedBox(height: 16.0),
                  EqCard(
                    status: EqWidgetStatus.danger,
                    shape: EqWidgetShape.semiRound,
                    statusAppearance: EqCardStatusAppearance.strip,
                    header: Text('Semi Round'),
                    child: Text(equinoxDescription),
                    footer: Text('By Wikipedia'),
                  ),
                ],
              ),
        ),
      ];
}
