import 'package:equinox/equinox.dart';

StyleData _generateForStyle(String status) {
  return StyleData({
    'progress-bar-$status-background-color': 'progress-bar-background-color',
    'progress-bar-$status-progress-color': 'color-$status-default',
    'progress-bar-$status-text-color': 'progress-bar-text-color',
  });
}

final StyleData progressBarStyle = StyleData({
  'progress-bar-tiny-height': 16.0,
  'progress-bar-small-height': 20.0,
  'progress-bar-medium-height': 22.0,
  'progress-bar-large-height': 24.0,
  'progress-bar-giant-height': 28.0,
  'progress-bar-tiny-text-font-family': 'text-subtitle-2-font-family',
  'progress-bar-tiny-text-font-weight': 'text-subtitle-2-font-weight',
  'progress-bar-tiny-text-font-size': 'text-subtitle-2-font-size',
  'progress-bar-small-text-font-family': 'text-subtitle-2-font-family',
  'progress-bar-small-text-font-weight': 'text-subtitle-2-font-weight',
  'progress-bar-small-text-font-size': 'text-subtitle-2-font-size',
  'progress-bar-medium-text-font-family': 'text-subtitle-font-family',
  'progress-bar-medium-text-font-weight': 'text-subtitle-font-weight',
  'progress-bar-medium-text-font-size': 'text-subtitle-font-size',
  'progress-bar-large-text-font-family': 'text-subtitle-font-family',
  'progress-bar-large-text-font-weight': 'text-subtitle-font-weight',
  'progress-bar-large-text-font-size': 'text-subtitle-font-size',
  'progress-bar-giant-text-font-family': 'text-subtitle-font-family',
  'progress-bar-giant-text-font-weight': 'text-subtitle-font-weight',
  'progress-bar-giant-text-font-size': 'text-subtitle-font-size',
  'progress-bar-background-color': 'background-basic-color-3',
  'progress-bar-progress-color': 'color-primary-default',
  'progress-bar-text-color': 'text-control-color',
})
  ..inject(_generateForStyle('primary'))
  ..inject(_generateForStyle('success'))
  ..inject(_generateForStyle('warning'))
  ..inject(_generateForStyle('danger'))
  ..inject(_generateForStyle('info'));
