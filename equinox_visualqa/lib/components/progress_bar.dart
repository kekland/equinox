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
            'shape': EnumTyped(EqWidgetShape.rectangle, EqWidgetShape.values),
            'status': EnumTyped(EqWidgetStatus.primary, EqWidgetStatus.values),
            'size': EnumTyped(EqWidgetSize.large, EqWidgetSize.values),
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
                    appearance: EqWidgetAppearance.ghost,
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
                    appearance: EqWidgetAppearance.ghost,
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
              children: EqWidgetStatus.values
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
              children: EqWidgetShape.values
                  .map(
                    (value) => EqProgressBar(
                          value: 0.8,
                          text: enumToString(value),
                          status: EqWidgetStatus.success,
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
              children: EqWidgetSize.values
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
                    status: EqWidgetStatus.success,
                    appearance: EqWidgetAppearance.ghost,
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: EqProgressBar(
                        value: percentage,
                        status: EqWidgetStatus.success,
                        text: '${(percentage * 100.0).round().toString()}%'),
                  ),
                  SizedBox(width: 16.0),
                  EqIconButton(
                    icon: EvaIcons.plus,
                    onTap: () => setState(
                        () => percentage = (percentage + 0.25).clamp(0.0, 1.0)),
                    status: EqWidgetStatus.success,
                    appearance: EqWidgetAppearance.ghost,
                  ),
                ],
              );
            }),
      ),
    ];
  }
}
