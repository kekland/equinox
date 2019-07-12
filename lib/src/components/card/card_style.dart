import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';

StyleData _getHeaderStyle(String status) {
  return StyleData({
    'card-header-info-background-color': 'color-$status-default',
    'card-header-info-text-color': 'text-control-color',
  });
}

final StyleData cardStyle = StyleData({
  'card-background-color': 'background-basic-color-1',
  'card-text-color': 'text-basic-color',
  'card-text-font-family': 'text-paragraph-font-family',
  'card-text-font-weight': 'text-paragraph-font-weight',
  'card-text-font-size': 'text-paragraph-font-size',
  'card-border-width': 0.0,
  'card-border-color': Colors.transparent,
  'card-shape': 'widget-shape',
  'card-padding': const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
  'card-shadow': 'shadow',
  'card-divider-color': 'divider-color',
  'card-divider-width': 'divider-width',
  'card-header-background-color': 'card-background-color',
  'card-header-text-color': 'text-basic-color',
  'card-header-text-font-family': 'text-subtitle-font-family',
  'card-header-text-font-weight': 'text-subtitle-font-weight',
  'card-header-text-font-size': 'text-subtitle-font-size',
})
  ..inject(_getHeaderStyle('primary'))
  ..inject(_getHeaderStyle('success'))
  ..inject(_getHeaderStyle('warning'))
  ..inject(_getHeaderStyle('danger'))
  ..inject(_getHeaderStyle('info'));
