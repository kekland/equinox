import 'package:equinox/equinox.dart';
import 'package:equinox_visualqa/utils.dart';
import 'package:flutter/material.dart';

class BoolTyped {
  bool value;

  BoolTyped(this.value);
}

class EnumTyped<T> {
  T value;
  List<T> values;

  EnumTyped(this.value, this.values);
}

class InteractivePlayground extends StatefulWidget {
  final Widget Function(StyleData theme, Map<String, dynamic> data) builder;
  final Map<String, dynamic> data;

  const InteractivePlayground({Key key, this.builder, this.data})
      : super(key: key);
  @override
  _InteractivePlaygroundState createState() => _InteractivePlaygroundState();
}

class _InteractivePlaygroundState extends State<InteractivePlayground> {
  Map<String, dynamic> dataCopy;

  @override
  void initState() {
    dataCopy = widget.data;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final style = StaticStyle.of(context);
    var items = <Widget>[];

    for (final String key in dataCopy.keys) {
      final dynamic data = dataCopy[key];
      final String description = normalize(key);

      if (data is BoolTyped) {
        items.add(
          EqCheckbox(
            value: data.value,
            onChanged: (v) => setState(() => dataCopy[key].value = v),
            description: description,
            descriptionPosition: EqPositioning.right,
          ),
        );
      } else if (data is EnumTyped) {
        items.add(EqSelect(
          hint: description,
          items: data.values
              .map(
                (value) => EqSelectItem(
                  title: enumToString(value),
                  value: value,
                ),
              )
              .toList(),
          onSelect: (v) => setState(() => dataCopy[key].value = v),
          label: description,
          selectedIndex: data.values.indexOf(data.value),
        ));
      }
      items.add(SizedBox(height: 16.0));
    }

    items.add(
      widget.builder(
        style.style,
        dataCopy.map(
          (k, v) => MapEntry(k, v.value),
        ),
      ),
    );

    return EqCard(
      statusAppearance: EqCardStatusAppearance.none,
      header: Text('Interactive playground'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items,
      ),
    );
  }
}
