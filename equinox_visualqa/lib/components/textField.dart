import 'package:equinox/equinox.dart';
import 'package:equinox_visualqa/management/interactive_playground.dart';
import 'package:equinox_visualqa/management/showcase_state.dart';
import 'package:equinox_visualqa/utils.dart';
import 'package:flutter/material.dart';
import 'package:separated_column/separated_column.dart';

class TextFieldShowcase extends StatefulWidget {
  @override
  _TextFieldShowcaseState createState() => _TextFieldShowcaseState();
}

class _TextFieldShowcaseState extends ShowcaseState<TextFieldShowcase> {
  @override
  Widget playgroundBuilder() => InteractivePlayground(
        data: {
          'enabled': BoolTyped(true),
          'label': BoolTyped(true),
          'description': BoolTyped(true),
          'error': BoolTyped(false),
          'icon': BoolTyped(false),
          'obscured': BoolTyped(false),
          'iconPosition': EnumTyped(Positioning.left, Positioning.values),
          'status': EnumTyped(WidgetStatus.primary, WidgetStatus.values),
          'shape': EnumTyped(WidgetShape.rectangle, WidgetShape.values),
        },
        builder: (_, data) => EqTextField(
          hint: 'Hint',
          enabled: data['enabled'],
          label: data['label']? 'Label' : null,
          description: data['description']? 'Description' : null,
          error: data['error']? 'Error' : null,
          icon: data['icon']? EvaIcons.star : null,
          obscureText: data['obscured'],
          iconPosition: data['iconPosition'],
          status: data['status'],
          shape: data['shape'],
        ),
      );

  @override
  String get showcaseName => 'TextField';

  @override
  List<ShowcaseWidgetData> get showcases => [
        ShowcaseWidgetData(
          title: 'TextField',
          builder: () => Column(
                children: [
                  EqTextField(
                    hint: 'Hint',
                  ),
                  SizedBox(height: 16.0),
                  EqTextField(
                    hint: 'Disabled',
                    enabled: false,
                  ),
                ],
              ),
        ),
        ShowcaseWidgetData(
          title: 'TextField with Label and Description',
          builder: () => EqTextField(
                hint: 'Hint',
                label: 'Label',
                description: 'Description',
              ),
        ),
        ShowcaseWidgetData(
          title: 'TextField shapes',
          builder: () => SeparatedColumn(
                children: WidgetShape.values
                    .map((shape) => EqTextField(hint: enumToString(shape), shape: shape))
                    .toList(),
                separatorBuilder: (_, i) => SizedBox(height: 16.0),
              ),
        ),
        ShowcaseWidgetData(
          title: 'TextField color',
          builder: () => SeparatedColumn(
                children: WidgetStatus.values
                    .map((value) => EqTextField(hint: enumToString(value), status: value))
                    .toList(),
                separatorBuilder: (_, i) => SizedBox(height: 16.0),
              ),
        ),
        ShowcaseWidgetData(
          title: 'TextField with error',
          builder: () =>
              EqTextField(label: 'Label', hint: 'Hint', error: 'Error'),
        ),
        ShowcaseWidgetData(
          title: 'TextField with icon',
          builder: () => Column(
                children: [
                  EqTextField(
                    label: 'On left',
                    hint: 'Hint',
                    icon: EvaIcons.star,
                    iconPosition: Positioning.left,
                  ),
                  SizedBox(height: 16.0),
                  EqTextField(
                    label: 'On right',
                    hint: 'Hint',
                    icon: EvaIcons.star,
                    iconPosition: Positioning.right,
                  ),
                ],
              ),
        ),
        ShowcaseWidgetData(
          title: 'Obscured TextField',
          builder: () => Column(
                children: [
                  EqTextField(
                    label: 'Label',
                    hint: 'Hint',
                    obscureText: true,
                  ),
                ],
              ),
        ),
      ];
}
