import 'package:equinox/equinox.dart';

StyleData _getForStatus(String status) {
  return StyleData({
    'list-item-title-$status-color': 'text-basic-color',
    'list-item-title-$status-active-color': 'text-primary-color',
    'list-item-title-$status-focused-color': 'color-primary-500',
    'list-item-subtitle-$status-color': 'text-hint-color',
    'list-item-subtitle-$status-active-color': 'color-primary-hover',
    'list-item-subtitle-$status-focused-color': 'color-primary-400',
    'list-item-icon-$status-color': 'text-hint-color',
    'list-item-icon-$status-active-color': 'color-primary-hover',
    'list-item-icon-$status-focused-color': 'color-primary-400',
  });
}

final StyleData listItemStyle = StyleData({
  'list-item-title-font-family': 'text-subtitle-font-family',
  'list-item-title-font-size': 'text-subtitle-font-size',
  'list-item-title-font-weight': 'text-subtitle-font-weight',
  'list-item-subtitle-font-family': 'text-subtitle-font-family',
  'list-item-subtitle-font-size': 'text-subtitle-font-size',
  'list-item-subtitle-font-weight': 'text-subtitle-font-weight',
  'list-item-title-disabled-color': 'text-disabled-color',
  'list-item-subtitle-disabled-color': 'text-disabled-color',
  'list-item-icon-disabled-color': 'text-disabled-color',
})
  ..inject(_getForStatus('primary'))
  ..inject(_getForStatus('success'))
  ..inject(_getForStatus('warning'))
  ..inject(_getForStatus('danger'))
  ..inject(_getForStatus('info'));
