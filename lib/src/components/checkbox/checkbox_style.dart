import 'package:equinox/equinox.dart';

StyleData _getForStatus(String status) {
  return StyleData({
    'checkbox-$status-background-color': 'background-basic-color-2',
    'checkbox-$status-border-color': 'color-$status-default',
    'checkbox-$status-checked-background-color': 'color-$status-default',
    'checkbox-$status-checked-border-color': 'color-$status-default',
    'checkbox-$status-checked-checkmark-color': 'text-control-color',
    'checkbox-$status-indeterminate-background-color': 'color-$status-default',
    'checkbox-$status-indeterminate-border-color': 'color-$status-default',
    'checkbox-$status-indeterminate-checkmark-color': 'text-control-color',
    'checkbox-$status-active-background-color': 'color-$status-default',
    'checkbox-$status-active-border-color': 'color-$status-default',
    'checkbox-$status-active-checkmark-color': 'text-control-color',
  });
}

final StyleData checkboxStyle = StyleData({
  'checkbox-size': 'icon-size',
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
  'checkbox-disabled-checkmark-color': 'background-basic-color-1',
  'checkbox-disabled-text-color': 'text-disabled-color',
})
  ..inject(_getForStatus('primary'))
  ..inject(_getForStatus('success'))
  ..inject(_getForStatus('warning'))
  ..inject(_getForStatus('danger'))
  ..inject(_getForStatus('info'));
