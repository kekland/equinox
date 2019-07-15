import 'package:equinox/equinox.dart';

StyleData _getForStatus(String status) {
  return StyleData({
    'toggle-$status-background-color': (style) =>
        style.get('color-$status-default').withOpacity(0.125),
    'toggle-$status-knob-color': 'text-control-color',
    'toggle-$status-border-color': 'color-$status-default',
    'toggle-$status-checked-background-color': 'color-$status-default',
    'toggle-$status-checked-border-color': 'color-$status-default',
    'toggle-$status-checked-knob-color': 'text-control-color',
    'toggle-$status-focus-background-color': 'color-$status-hover',
    'toggle-$status-focus-border-color': 'color-$status-hover',
    'toggle-$status-focus-knob-color': 'text-control-color',
  });
}

final StyleData toggleStyle = StyleData({
  'toggle-width': 52.0,
  'toggle-height': 32.0,
  'toggle-padding': 'control-padding',
  'toggle-description-padding': 'control-description-padding',
  'toggle-border-width': 'border-width',
  'toggle-outline-width': 'outline-width',
  'toggle-outline-color': 'outline-color',
  'toggle-text-color': 'text-basic-color',
  'toggle-text-font-family': 'text-subtitle-2-font-family',
  'toggle-text-font-size': 'text-subtitle-2-font-size',
  'toggle-text-font-weight': 'text-subtitle-2-font-weight',
  'toggle-background-color': 'background-basic-color-3',
  'toggle-border-color': 'border-basic-color-4',
  'toggle-knob-color': 'text-control-color',
  'toggle-disabled-background-color': 'background-basic-color-2',
  'toggle-disabled-border-color': 'border-basic-color-3',
  'toggle-disabled-knob-color': 'text-disabled-color',
  'toggle-disabled-text-color': 'text-disabled-color',
  'toggle-checked-background-color': 'color-primary-default',
  'toggle-checked-border-color': 'color-primary-default',
  'toggle-checked-knob-color': 'text-control-color',
  'toggle-focus-background-color': 'color-primary-hover',
  'toggle-focus-border-color': 'color-primary-hover',
  'toggle-focus-knob-color': 'text-control-color',
})
  ..inject(_getForStatus('primary'))
  ..inject(_getForStatus('success'))
  ..inject(_getForStatus('warning'))
  ..inject(_getForStatus('danger'))
  ..inject(_getForStatus('info'));
