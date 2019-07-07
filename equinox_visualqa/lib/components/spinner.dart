import 'package:equinox_visualqa/management/interactive_playground.dart';
import 'package:equinox_visualqa/management/showcase_state.dart';
import 'package:flutter/widgets.dart';
import 'package:equinox/equinox.dart';

class SpinnerShowcase extends StatefulWidget {
  @override
  _SpinnerShowcaseState createState() => _SpinnerShowcaseState();
}

class _SpinnerShowcaseState extends ShowcaseState<SpinnerShowcase> {
  @override
  InteractivePlayground playgroundBuilder() => InteractivePlayground(
        data: {
          'status': EnumTyped(WidgetStatus.primary, WidgetStatus.values),
          'size': EnumTyped(WidgetSize.medium, WidgetSize.values),
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
                children: WidgetStatus.values
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
                children: WidgetSize.values.reversed
                    .map((size) => EqSpinner(
                          size: size,
                        ))
                    .toList(),
              ),
        ),
      ];
}
