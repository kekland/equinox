import 'package:equinox/equinox.dart';
import 'package:equinox_visualqa/management/interactive_playground.dart';
import 'package:equinox_visualqa/management/showcase_state.dart';
import 'package:equinox_visualqa/utils.dart';
import 'package:flutter/material.dart';
import 'package:separated_column/separated_column.dart';

class SelectShowcase extends StatefulWidget {
  @override
  _SelectShowcaseState createState() => _SelectShowcaseState();
}

class _SelectShowcaseState extends ShowcaseState<SelectShowcase> {
  @override
  Widget playgroundBuilder() => InteractivePlayground(
        data: {
          'enabled': BoolTyped(true),
          'label': BoolTyped(true),
          'description': BoolTyped(true),
          'icon': BoolTyped(false),
          'status': EnumTyped(WidgetStatus.primary, WidgetStatus.values),
          'shape': EnumTyped(WidgetShape.rectangle, WidgetShape.values),
        },
        builder: (_, data) => EqSelect(
              hint: 'Hint',
              label: data['label'] ? 'Label' : null,
              description: data['description'] ? 'Description' : null,
              icon: data['icon'] ? EvaIcons.star : null,
              status: data['status'],
              shape: data['shape'],
              items: selectItems,
              onSelect: data['enabled'] ? (v) {} : null,
            ),
      );

  @override
  String get showcaseName => 'Select';

  var selectItems = [
    EqSelectItem(
      title: 'Item 1',
      subtitle: 'Subtitle for Item 1',
      value: '1',
      icon: EvaIcons.star,
    ),
    EqSelectItem(
      title: 'Item 2',
      subtitle: 'Subtitle for Item 2',
      value: '2',
      icon: EvaIcons.star,
    ),
    EqSelectItem(
      title: 'Item 3',
      subtitle: 'Subtitle for Item 3',
      value: '3',
      icon: EvaIcons.star,
    ),
  ];

  @override
  List<ShowcaseWidgetData> get showcases => [
        ShowcaseWidgetData(
          title: 'Select',
          builder: () => SeparatedColumn(
                children: [
                  EqSelect(
                    hint: 'Enabled',
                    items: selectItems,
                    onSelect: (v) {},
                  ),
                  EqSelect(
                    hint: 'Disabled',
                    items: selectItems,
                    onSelect: null,
                  ),
                ],
                separatorBuilder: (_, i) => SizedBox(height: 16.0),
              ),
        ),
        ShowcaseWidgetData(
          title: 'Select with label and description',
          builder: () => EqSelect(
                label: 'Label',
                description: 'Description',
                hint: 'Hint',
                items: selectItems,
                onSelect: (v) {},
              ),
        ),
        ShowcaseWidgetData(
          title: 'Select colors',
          builder: () => SeparatedColumn(
                children: WidgetStatus.values
                    .map(
                      (value) => EqSelect(
                            hint: enumToString(value),
                            status: value,
                            onSelect: (v) {},
                            items: selectItems,
                          ),
                    )
                    .toList(),
                separatorBuilder: (_, i) => SizedBox(height: 16.0),
              ),
        ),
        ShowcaseWidgetData(
          title: 'Select shapes',
          builder: () => SeparatedColumn(
                children: WidgetShape.values
                    .map(
                      (value) => EqSelect(
                            hint: enumToString(value),
                            shape: value,
                            onSelect: (v) {},
                            items: selectItems,
                          ),
                    )
                    .toList(),
                separatorBuilder: (_, i) => SizedBox(height: 16.0),
              ),
        ),
        ShowcaseWidgetData(
          title: 'Select shapes',
          builder: () => EqSelect(
                hint: 'With icon',
                icon: EvaIcons.star,
                onSelect: (v) {},
                items: selectItems,
              ),
        ),
      ];
}
