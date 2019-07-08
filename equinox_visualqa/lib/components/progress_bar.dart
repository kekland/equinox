import 'package:equinox/equinox.dart';
import 'package:equinox_visualqa/management/showcase_state.dart';
import 'package:equinox_visualqa/utils.dart';
import 'package:flutter/material.dart';
import 'package:separated_column/separated_column.dart';

class ProgressBarShowcase extends StatefulWidget {
  @override
  _ProgressBarShowcaseState createState() => _ProgressBarShowcaseState();
}

class _ProgressBarShowcaseState extends ShowcaseState<ProgressBarShowcase> {
  @override
  Widget playgroundBuilder() => InteractivePlayground(
          data: {
            'shape': EnumTyped(WidgetShape.rectangle, WidgetShape.values),
            'status': EnumTyped(WidgetStatus.primary, WidgetStatus.values),
            'size': EnumTyped(WidgetSize.large, WidgetSize.values),
          },
          builder: (_, data) {
            return StatefulBuilder(builder: (context, setState) {
              return Row(
                children: [
                  EqIconButton(
                    icon: EvaIcons.minus,
                    onTap: () => setState(
                        () => percentage2 = (percentage2 - 0.25).clamp(0.0, 1.0)),
                    status: data['status'],
                    appearance: WidgetAppearance.ghost,
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: EqProgressBar(
                        value: percentage2,
                        status: data['status'],
                        shape: data['shape'],
                        size: data['size'],
                        text: '${(percentage2 * 100.0).round().toString()}%'),
                  ),
                  SizedBox(width: 16.0),
                  EqIconButton(
                    icon: EvaIcons.plus,
                    onTap: () => setState(
                        () => percentage2 = (percentage2 + 0.25).clamp(0.0, 1.0)),
                    status: data['status'],
                    appearance: WidgetAppearance.ghost,
                  ),
                ],
              );
            });
          });

  @override
  String get showcaseName => 'ProgressBar';
  double percentage = 0.5;
  double percentage2 = 0.5;
  @override
  List<ShowcaseWidgetData> get showcases {
    return [
      ShowcaseWidgetData(
        title: 'Progress bar',
        builder: () => SeparatedColumn(
              children: [
                EqProgressBar(
                  value: 0.45,
                  text: '45%',
                ),
                EqProgressBar(
                  value: 0.85,
                  text: '85%',
                ),
              ],
              separatorBuilder: (_, i) => SizedBox(height: 16.0),
            ),
      ),
      ShowcaseWidgetData(
        title: 'Progress bar colors',
        builder: () => SeparatedColumn(
              children: WidgetStatus.values
                  .map(
                    (value) => EqProgressBar(
                          value: 0.8,
                          text: enumToString(value),
                          status: value,
                        ),
                  )
                  .toList(),
              separatorBuilder: (_, i) => SizedBox(height: 16.0),
            ),
      ),
      ShowcaseWidgetData(
        title: 'Progress bar shapes',
        builder: () => SeparatedColumn(
              children: WidgetShape.values
                  .map(
                    (value) => EqProgressBar(
                          value: 0.8,
                          text: enumToString(value),
                          status: WidgetStatus.success,
                          shape: value,
                        ),
                  )
                  .toList(),
              separatorBuilder: (_, i) => SizedBox(height: 16.0),
            ),
      ),
      ShowcaseWidgetData(
        title: 'Progress bar sizes',
        builder: () => SeparatedColumn(
              children: WidgetSize.values
                  .map(
                    (value) => EqProgressBar(
                          value: 0.8,
                          text: enumToString(value),
                          size: value,
                        ),
                  )
                  .toList(),
              separatorBuilder: (_, i) => SizedBox(height: 16.0),
            ),
      ),
      ShowcaseWidgetData(
        title: 'Progress bar animation',
        builder: () => StatefulBuilder(builder: (context, setState) {
              return Row(
                children: [
                  EqIconButton(
                    icon: EvaIcons.minus,
                    onTap: () => setState(
                        () => percentage = (percentage - 0.25).clamp(0.0, 1.0)),
                    status: WidgetStatus.success,
                    appearance: WidgetAppearance.ghost,
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: EqProgressBar(
                        value: percentage,
                        status: WidgetStatus.success,
                        text: '${(percentage * 100.0).round().toString()}%'),
                  ),
                  SizedBox(width: 16.0),
                  EqIconButton(
                    icon: EvaIcons.plus,
                    onTap: () => setState(
                        () => percentage = (percentage + 0.25).clamp(0.0, 1.0)),
                    status: WidgetStatus.success,
                    appearance: WidgetAppearance.ghost,
                  ),
                ],
              );
            }),
      ),
    ];
  }
}
