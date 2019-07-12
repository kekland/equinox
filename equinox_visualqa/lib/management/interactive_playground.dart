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
    return SizedBox();
  }
}