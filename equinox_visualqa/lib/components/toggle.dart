import 'package:equinox/equinox.dart';
import 'package:flutter/material.dart';
import 'package:equinox_visualqa/management/showcase_state.dart';
import 'package:equinox_visualqa/utils.dart';
import 'package:separated_column/separated_column.dart';

class ToggleShowcase extends StatefulWidget {
  @override
  _ToggleShowcaseState createState() => _ToggleShowcaseState();
}

class _ToggleShowcaseState extends ShowcaseState<ToggleShowcase> {
  @override
  Widget playgroundBuilder() => SizedBox();

  @override
  String get showcaseName => 'Toggles';

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
          title: 'Toggle',
          builder: () => SeparatedColumn(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  EqToggle(
                    value: getStatus('d.0', true),
                    onChanged: (v) => setStatus('d.0', v),
                    description: 'Description',
                  ),
                  EqToggle(
                    value: false,
                    onChanged: null,
                    description: 'Disabled',
                  ),
                  EqToggle(
                    value: true,
                    onChanged: null,
                    description: 'Selected disabled',
                  ),
                ],
                separatorBuilder: (_, i) => SizedBox(height: 16.0),
              ),
        ),
        ShowcaseWidgetData(
          title: 'Toggle colors',
          builder: () => SeparatedColumn(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: EqWidgetStatus.values
                    .map(
                      (value) => EqToggle(
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
          title: 'Description location',
          builder: () => SeparatedColumn(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: EqPositioning.values
                    .map(
                      (value) => EqToggle(
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
