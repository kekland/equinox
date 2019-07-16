import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';

StyleData _getFilledForStatus(String status) {
  return StyleData({
    'icon-button-filled-$status-background-color': 'color-$status-default',
    'icon-button-filled-$status-border-color': 'color-$status-default',
    'icon-button-filled-$status-icon-color': 'text-control-color',
    'icon-button-filled-$status-active-background-color': 'color-$status-hover',
    'icon-button-filled-$status-active-border-color': 'color-$status-hover',
    'icon-button-filled-$status-active-icon-color':
        'icon-button-filled-$status-icon-color',
    'icon-button-filled-$status-disabled-background-color':
        'background-basic-color-3',
    'icon-button-filled-$status-disabled-border-color': 'border-basic-color-3',
    'icon-button-filled-$status-disabled-icon-color': 'text-disabled-color',
  });
}

final StyleData _filledStyle = StyleData({
  'icon-button-filled-border-width': 2.0,
  'icon-button-filled-tiny-padding':
      const EdgeInsets.all(4.0),
  'icon-button-filled-small-padding':
      const EdgeInsets.all(6.0),
  'icon-button-filled-medium-padding':
      const EdgeInsets.all(10.0),
  'icon-button-filled-large-padding':
      const EdgeInsets.all(12.0),
  'icon-button-filled-giant-padding':
      const EdgeInsets.all(14.0),
})
  ..inject(_getFilledForStatus('primary'))
  ..inject(_getFilledForStatus('success'))
  ..inject(_getFilledForStatus('warning'))
  ..inject(_getFilledForStatus('danger'))
  ..inject(_getFilledForStatus('info'));

StyleData _getOutlineForStatus(String status) {
  return StyleData({
    'icon-button-outline-$status-border-color': 'color-$status-default',
    'icon-button-outline-$status-icon-color': 'text-$status-color',
    'icon-button-outline-$status-background-color':
        'icon-button-outline-background-color',
    'icon-button-outline-$status-active-border-color': 'color-$status-hover',
    'icon-button-outline-$status-active-icon-color': 'text-$status-hover-color',
    'icon-button-outline-$status-active-background-color':
        'icon-button-outline-background-color',
    'icon-button-outline-$status-disabled-border-color': 'border-basic-color-3',
    'icon-button-outline-$status-disabled-icon-color': 'text-disabled-color',
    'icon-button-outline-$status-disabled-background-color':
        'icon-button-outline-background-color',
  });
}

final StyleData _outlineStyle = StyleData({
  'icon-button-outline-border-width': 2.0,
  'icon-button-outline-background-color': 'background-basic-color-2',
  'icon-button-outline-tiny-padding':
      const EdgeInsets.all(4.0),
  'icon-button-outline-small-padding':
      const EdgeInsets.all(6.0),
  'icon-button-outline-medium-padding':
      const EdgeInsets.all(10.0),
  'icon-button-outline-large-padding':
      const EdgeInsets.all(12.0),
  'icon-button-outline-giant-padding':
      const EdgeInsets.all(14.0),
})
  ..inject(_getOutlineForStatus('primary'))
  ..inject(_getOutlineForStatus('success'))
  ..inject(_getOutlineForStatus('warning'))
  ..inject(_getOutlineForStatus('danger'))
  ..inject(_getOutlineForStatus('info'));

StyleData _getGhostForStatus(String status) {
  return StyleData({
    'icon-button-ghost-$status-border-color': 'icon-button-ghost-border-color',
    'icon-button-ghost-$status-icon-color': 'text-$status-color',
    'icon-button-ghost-$status-background-color': 'icon-button-ghost-background-color',
    'icon-button-ghost-$status-active-border-color': 'icon-button-ghost-border-color',
    'icon-button-ghost-$status-active-icon-color': 'text-$status-hover-color',
    'icon-button-ghost-$status-active-background-color':
        'icon-button-ghost-background-color',
    'icon-button-ghost-$status-disabled-border-color': 'icon-button-ghost-border-color',
    'icon-button-ghost-$status-disabled-icon-color': 'text-disabled-color',
    'icon-button-ghost-$status-disabled-background-color':
        'icon-button-ghost-background-color',
  });
}

final StyleData _ghostStyle = StyleData({
  'icon-button-ghost-border-width': 0.0,
  'icon-button-ghost-border-color': Colors.transparent,
  'icon-button-ghost-background-color': Colors.transparent,
  'icon-button-ghost-tiny-padding':
      const EdgeInsets.all(6.0),
  'icon-button-ghost-small-padding':
      const EdgeInsets.all(8.0),
  'icon-button-ghost-medium-padding':
      const EdgeInsets.all(12.0),
  'icon-button-ghost-large-padding':
      const EdgeInsets.all(14.0),
  'icon-button-ghost-giant-padding':
      const EdgeInsets.all(16.0),
})
  ..inject(_getGhostForStatus('primary'))
  ..inject(_getGhostForStatus('success'))
  ..inject(_getGhostForStatus('warning'))
  ..inject(_getGhostForStatus('danger'))
  ..inject(_getGhostForStatus('info'));

final StyleData iconButtonStyle = StyleData({
  'icon-button-outline-width': 'outline-width',
  'icon-button-outline-color': 'outline-color',
  'icon-button-tiny-icon-size': 0.75 * 20.0,
  'icon-button-small-icon-size': 0.875 * 20.0,
  'icon-button-medium-icon-size': 1 * 20.0,
  'icon-button-large-icon-size': 1.125 * 20.0,
  'icon-button-giant-icon-size': 1.25 * 20.0,
})
  ..inject(_filledStyle)
  ..inject(_ghostStyle)
  ..inject(_outlineStyle);
