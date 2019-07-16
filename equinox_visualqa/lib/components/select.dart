    
import 'package:equinox/equinox.dart';
import 'package:flutter/material.dart';
import 'package:equinox_visualqa/management/showcase_state.dart';
import 'package:equinox_visualqa/utils.dart';
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
          'status': EnumTyped(EqWidgetStatus.primary, EqWidgetStatus.values),
          'shape': EnumTyped(EqWidgetShape.rectangle, EqWidgetShape.values),
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
                children: EqWidgetStatus.values
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
                children: EqWidgetShape.values
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
          title: 'Select icons',
          builder: () => EqSelect(
                hint: 'With icon',
                icon: EvaIcons.star,
                onSelect: (v) {},
                items: selectItems,
              ),
        ),
        ShowcaseWidgetData(
          title: 'Select sizes',
          builder: () => SeparatedColumn(
                children: EqWidgetSize.values
                    .map(
                      (value) => EqSelect(
                            hint: enumToString(value),
                            size: value,
                            onSelect: (v) {},
                            items: selectItems,
                          ),
                    )
                    .toList(),
                separatorBuilder: (_, i) => SizedBox(height: 16.0),
              ),
        ),
        ShowcaseWidgetData(
          title: 'Select appearances',
          builder: () => SeparatedColumn(
                children: EqWidgetAppearance.values
                    .map(
                      (value) => EqSelect(
                            hint: enumToString(value),
                            appearance: value,
                            status: EqWidgetStatus.primary,
                            onSelect: (v) {},
                            items: selectItems,
                          ),
                    )
                    .toList(),
                separatorBuilder: (_, i) => SizedBox(height: 16.0),
              ),
        ),
      ];
}
