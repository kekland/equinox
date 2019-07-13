import 'package:equinox/equinox.dart';

StyleData _getForStatus(String status) {
  return StyleData({
    'checkbox-$status-background-color': (style) =>
        style.get('color-$status-default').withOpacity(0.125),
    'checkbox-$status-border-color': 'color-$status-default',
    'checkbox-$status-checked-background-color': 'color-$status-default',
    'checkbox-$status-checked-border-color': 'color-$status-default',
    'checkbox-$status-checked-checkmark-color': 'text-control-color',
    'checkbox-$status-indeterminate-background-color': 'color-$status-default',
    'checkbox-$status-indeterminate-border-color': 'color-$status-default',
    'checkbox-$status-indeterminate-checkmark-color': 'text-control-color',
    'checkbox-$status-focus-background-color': 'color-$status-hover',
    'checkbox-$status-focus-border-color': 'color-$status-hover',
    'checkbox-$status-focus-checkmark-color': 'text-control-color',
  });
}

final StyleData checkboxStyle = StyleData({
  'checkbox-size': 'icon-size',
  'checkbox-padding': 'control-padding',
  'checkbox-background-color': 'background-basic-color-3',
  'checkbox-border-color': 'border-basic-color-4',
  'checkbox-border-width': 'border-width',
  'checkbox-outline-width': 'outline-width',
  'checkbox-outline-color': 'outline-color',
  'checkbox-text-color': 'text-basic-color',
  'checkbox-text-font-family': 'text-subtitle-2-font-family',
  'checkbox-text-font-size': 'text-subtitle-2-font-size',
  'checkbox-text-font-weight': 'text-subtitle-2-font-weight',
  'checkbox-disabled-background-color': 'background-basic-color-2',
  'checkbox-disabled-border-color': 'border-basic-color-3',
  'checkbox-disabled-checkmark-color': 'text-disabled-color',
  'checkbox-disabled-text-color': 'text-disabled-color',
  'checkbox-checked-background-color': 'color-primary-default',
  'checkbox-checked-border-color': 'color-primary-default',
  'checkbox-checked-checkmark-color': 'text-control-color',
  'checkbox-indeterminate-background-color': 'color-primary-default',
  'checkbox-indeterminate-border-color': 'color-primary-default',
  'checkbox-indeterminate-checkmark-color': 'text-control-color',
  'checkbox-focus-background-color': 'color-primary-hover',
  'checkbox-focus-border-color': 'color-primary-hover',
  'checkbox-focus-checkmark-color': 'text-control-color',
})
  ..inject(_getForStatus('primary'))
  ..inject(_getForStatus('success'))
  ..inject(_getForStatus('warning'))
  ..inject(_getForStatus('danger'))
  ..inject(_getForStatus('info'));
