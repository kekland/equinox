import 'package:equinox/equinox.dart';
import 'package:flutter/material.dart';
import 'package:equinox_visualqa/management/showcase_state.dart';

class SpinnerShowcase extends StatefulWidget {
  @override
  _SpinnerShowcaseState createState() => _SpinnerShowcaseState();
}

class _SpinnerShowcaseState extends ShowcaseState<SpinnerShowcase> {
  @override
  InteractivePlayground playgroundBuilder() => InteractivePlayground(
        data: {
          'status': EnumTyped(EqWidgetStatus.primary, EqWidgetStatus.values),
          'size': EnumTyped(EqWidgetSize.medium, EqWidgetSize.values),
        },
        builder: (_, data) => Center(
              heightFactor: 1.0,
              child: EqSpinner(
                status: data['status'],
                size: data['size'],
              ),
            ),
      );

  @override
  String get showcaseName => 'Spinners';

  @override
  List<ShowcaseWidgetData> get showcases => [
        ShowcaseWidgetData(
          title: 'Spinner',
          builder: () => EqSpinner(),
        ),
        ShowcaseWidgetData(
          title: 'Spinner colors',
          builder: () => Wrap(
                spacing: 16.0,
                runSpacing: 16.0,
                alignment: WrapAlignment.start,
                children: EqWidgetStatus.values
                    .map((status) => EqSpinner(
                          status: status,
                        ))
                    .toList(),
              ),
        ),
        ShowcaseWidgetData(
          title: 'Spinner sizes',
          builder: () => Wrap(
                spacing: 16.0,
                runSpacing: 16.0,
                alignment: WrapAlignment.start,
                children: EqWidgetSize.values.reversed
                    .map((size) => EqSpinner(
                          size: size,
                        ))
                    .toList(),
              ),
        ),
      ];
}
