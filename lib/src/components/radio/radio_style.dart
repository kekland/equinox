import 'package:equinox/equinox.dart';

StyleData _getStyle(String status) {
  return StyleData({
    'radio-$status-border-color': 'color-$status-default',
    'radio-$status-background-color': (StyleData style) =>
        style.get('color-$status-default').withOpacity(0.125),
    'radio-$status-knob-color': Colors.transparent,
    'radio-$status-focus-border-color': 'color-$status-hover',
    'radio-$status-focus-background-color': (StyleData style) =>
        style.get('color-$status-focus').withOpacity(0.125),
    'radio-$status-focus-knob-color': 'color-$status-hover',
    'radio-$status-selected-border-color': 'color-$status-default',
    'radio-$status-selected-background-color': (StyleData style) =>
        style.get('color-$status-default').withOpacity(0.125),
    'radio-$status-selected-knob-color': 'color-$status-default',
  });
}

final StyleData radioStyle = StyleData({
  'radio-size': 'icon-size',
  'radio-border-width': 'border-width',
  'radio-text-color': 'text-basic-color',
  'radio-text-font-family': 'text-subtitle-2-font-family',
  'radio-text-font-size': 'text-subtitle-2-font-size',
  'radio-text-font-weight': 'text-subtitle-2-font-weight',
  'radio-padding': 'control-padding',
  'radio-description-padding': 'control-description-padding',
  'radio-description-position': EqPositioning.right,
  'radio-outline-color': 'outline-color',
  'radio-outline-width': 'outline-width',
  'radio-background-color': 'background-basic-color-3',
  'radio-border-color': 'border-basic-color-4',
  'radio-knob-color': Colors.transparent,
  'radio-focus-border-color': 'color-primary-focus',
  'radio-focus-background-color': 'radio-background-color',
  'radio-focus-knob-color': 'color-primary-focus',
  'radio-selected-border-color': 'color-primary-default',
  'radio-selected-background-color': 'radio-background-color',
  'radio-selected-knob-color': 'color-primary-default',
  'radio-disabled-text-color': 'text-disabled-color',
  'radio-disabled-border-color': 'border-basic-color-3',
  'radio-disabled-background-color': 'background-basic-color-2',
  'radio-disabled-knob-color': Colors.transparent,
  'radio-disabled-selected-border-color': 'border-basic-color-3',
  'radio-disabled-selected-background-color': 'background-basic-color-2',
  'radio-disabled-selected-knob-color': 'background-basic-color-4',
})
  ..inject(_getStyle('primary'))
  ..inject(_getStyle('success'))
  ..inject(_getStyle('warning'))
  ..inject(_getStyle('danger'))
  ..inject(_getStyle('info'));
