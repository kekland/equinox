import 'package:equinox/components/checkbox/checkbox.dart';
import 'package:equinox/equinox.dart';
import 'package:equinox_visualqa/management/interactive_playground.dart';
import 'package:equinox_visualqa/management/showcase_state.dart';
import 'package:equinox_visualqa/utils.dart';
import 'package:flutter/material.dart';
import 'package:separated_column/separated_column.dart';

class CheckboxShowcase extends StatefulWidget {
  @override
  _CheckboxShowcaseState createState() => _CheckboxShowcaseState();
}

class _CheckboxShowcaseState extends ShowcaseState<CheckboxShowcase> {
  @override
  Widget playgroundBuilder() => InteractivePlayground(
    data: {
      'enabled': BoolTyped(true),
      'null': BoolTyped(false),
      'status': EnumTyped(WidgetStatus.primary, WidgetStatus.values),
      'shape': EnumTyped(WidgetShape.rectangle, WidgetShape.values),
      'descriptionLocation': EnumTyped(Positioning.right, Positioning.values),
    },
    builder: (_, data) => EqCheckbox(
      onChanged: data['enabled']? (v) => setStatus('interactive', v) : null,
      value: data['null']? null : getStatus('interactive', false),
      descriptionPosition: data['descriptionLocation'],
      status: data['status'],
      shape: data['shape'],
      description: 'Description',
    ),
  );

  @override
  String get showcaseName => 'Checkboxes';

  Map<String, bool> status = {};

  bool getStatus(String key, [bool def = true]) {
    if (status.containsKey(key)) return status[key];
    status[key] = def;
    return def;
  }

  setStatus(String key, bool value) {
    status[key] = value;
    setState(() {});
  }

  @override
  List<ShowcaseWidgetData> get showcases => [
        ShowcaseWidgetData(
          title: 'Checkbox',
          builder: () => SeparatedColumn(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  EqCheckbox(
                    value: getStatus('d.0', true),
                    onChanged: (v) => setStatus('d.0', v),
                    description: 'Description',
                  ),
                  EqCheckbox(
                    value: getStatus('d.1', null),
                    onChanged: (v) => setStatus('d.1', v),
                    description: 'Tristate',
                  ),
                  EqCheckbox(
                    value: false,
                    onChanged: null,
                    description: 'Disabled',
                  ),
                  EqCheckbox(
                    value: true,
                    onChanged: null,
                    description: 'Selected disabled',
                  ),
                ],
                separatorBuilder: (_, i) => SizedBox(height: 16.0),
              ),
        ),
        ShowcaseWidgetData(
          title: 'Checkbox colors',
          builder: () => SeparatedColumn(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: WidgetStatus.values
                    .map(
                      (value) => EqCheckbox(
                            value: getStatus(value.toString(), false),
                            onChanged: (v) => setStatus(value.toString(), v),
                            description: enumToString(value),
                            status: value,
                          ),
                    )
                    .toList(),
                separatorBuilder: (_, i) => SizedBox(height: 16.0),
              ),
        ),
        ShowcaseWidgetData(
          title: 'Checkbox shapes',
          builder: () => SeparatedColumn(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: WidgetShape.values
                    .map(
                      (value) => EqCheckbox(
                            value: getStatus(value.toString(), false),
                            onChanged: (v) => setStatus(value.toString(), v),
                            description: enumToString(value),
                            shape: value,
                          ),
                    )
                    .toList(),
                separatorBuilder: (_, i) => SizedBox(height: 16.0),
              ),
        ),
        ShowcaseWidgetData(
          title: 'Description location',
          builder: () => SeparatedColumn(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: Positioning.values
                    .map(
                      (value) => EqCheckbox(
                            value: getStatus(value.toString(), false),
                            onChanged: (v) => setStatus(value.toString(), v),
                            description: enumToString(value),
                            descriptionPosition: value,
                          ),
                    )
                    .toList(),
                separatorBuilder: (_, i) => SizedBox(height: 16.0),
              ),
        ),
      ];
}
