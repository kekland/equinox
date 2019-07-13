import 'package:equinox/equinox.dart';
import 'package:flutter/material.dart';
import 'package:equinox_visualqa/management/showcase_state.dart';
import 'package:equinox_visualqa/utils.dart';
import 'package:separated_column/separated_column.dart';

class CheckboxShowcase extends StatefulWidget {
  @override
  _CheckboxShowcaseState createState() => _CheckboxShowcaseState();
}

class _CheckboxShowcaseState extends ShowcaseState<CheckboxShowcase> {
  @override
  Widget playgroundBuilder() => SizedBox();

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
                children: EqWidgetStatus.values
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
                children: EqWidgetShape.values
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
                children: EqPositioning.values
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
