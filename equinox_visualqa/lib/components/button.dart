import 'package:equinox/equinox.dart';
import 'package:flutter/material.dart';
import 'package:equinox_visualqa/management/showcase_state.dart';
import 'package:equinox_visualqa/utils.dart';

class ButtonShowcase extends StatefulWidget {
  @override
  _ButtonShowcaseState createState() => _ButtonShowcaseState();
}

class _ButtonShowcaseState extends ShowcaseState<ButtonShowcase> {
  @override
  InteractivePlayground playgroundBuilder() {
    return InteractivePlayground(
      data: {
        'enabled': BoolTyped(true),
        'iconEnabled': BoolTyped(false),
        'iconPosition': EnumTyped(Positioning.left, Positioning.values),
        'appearance':
            EnumTyped(WidgetAppearance.filled, WidgetAppearance.values),
        'shape': EnumTyped(WidgetShape.rectangle, WidgetShape.values),
        'status': EnumTyped(WidgetStatus.primary, WidgetStatus.values),
        'size': EnumTyped(WidgetSize.large, WidgetSize.values),
      },
      builder: (_, data) => SizedBox(
            width: double.infinity,
            child: EqButton(
              onTap: data['enabled'] ? () {} : null,
              appearance: data['appearance'],
              icon: data['iconEnabled'] ? EvaIcons.star : null,
              iconPosition: data['iconPosition'],
              label: 'Button',
              shape: data['shape'],
              status: data['status'],
              size: data['size'],
            ),
          ),
    );
  }

  @override
  String get showcaseName => 'Buttons';

  @override
  List<ShowcaseWidgetData> get showcases => [
        ShowcaseWidgetData(
          title: 'Buttons',
          builder: () => Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                alignment: WrapAlignment.start,
                children: [
                  EqButton(onTap: () {}, label: 'Active'),
                  EqButton(onTap: null, label: 'Disabled'),
                ],
              ),
        ),
        ShowcaseWidgetData(
          title: 'Button colors',
          builder: () => Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                alignment: WrapAlignment.start,
                children: WidgetStatus.values
                    .map((status) => EqButton(
                          onTap: () {},
                          label: enumToString(status),
                          status: status,
                        ))
                    .toList(),
              ),
        ),
        ShowcaseWidgetData(
          title: 'Button sizes',
          builder: () => Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                alignment: WrapAlignment.start,
                children: WidgetSize.values.reversed
                    .map((size) => EqButton(
                          onTap: () {},
                          label: enumToString(size),
                          size: size,
                        ))
                    .toList(),
              ),
        ),
        ShowcaseWidgetData(
          title: 'Outline button',
          builder: () => Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                alignment: WrapAlignment.start,
                children: WidgetStatus.values
                    .map((status) => EqButton(
                          onTap: () {},
                          label: enumToString(status),
                          status: status,
                          appearance: WidgetAppearance.outline,
                        ))
                    .toList(),
              ),
        ),
        ShowcaseWidgetData(
          title: 'Ghost button',
          builder: () => Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                alignment: WrapAlignment.start,
                children: WidgetStatus.values
                    .map((status) => EqButton(
                          onTap: () {},
                          label: enumToString(status),
                          status: status,
                          appearance: WidgetAppearance.ghost,
                        ))
                    .toList(),
              ),
        ),
        ShowcaseWidgetData(
          title: 'Button shapes',
          builder: () => Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                alignment: WrapAlignment.start,
                children: WidgetShape.values
                    .map((shape) => EqButton(
                          onTap: () {},
                          label: enumToString(shape),
                          shape: shape,
                        ))
                    .toList(),
              ),
        ),
        ShowcaseWidgetData(
          title: 'Button with icon',
          builder: () => Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                alignment: WrapAlignment.start,
                children: Positioning.values
                    .map((position) => EqButton(
                          onTap: () {},
                          icon: EvaIcons.star,
                          iconPosition: position,
                          label: enumToString(position),
                          status: WidgetStatus.success,
                          shape: WidgetShape.semiRound,
                        ))
                    .toList(),
              ),
        ),
      ];
}
