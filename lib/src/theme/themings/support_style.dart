import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';

final StyleData supportStyle = StyleData({
  'border-radius-rectangle': 4.0,
  'border-radius-semi-round': 12.0,
  'outline-width': 0.375 * 16.0,
  'outline-color': Colors.black.withOpacity(0.125),
  'shadow': BoxShadow(offset: Offset(0.0, 8.0), blurRadius: 16.0, color: Color.fromRGBO(44, 51, 73, 0.1)),
  'divider-color': 'border-basic-color-3',
  'divider-width': 1.0,
  'control-padding': EdgeInsets.all(0.0),
  'control-description-padding': 8.0,
  'border-width': 1.0,
  'widget-shape': EqWidgetShape.rectangle,
});
