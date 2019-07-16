import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';

StyleData _getFilledForStatus(String status) {
  return StyleData({
    'button-filled-$status-background-color': 'color-$status-default',
    'button-filled-$status-border-color': 'color-$status-default',
    'button-filled-$status-text-color': 'text-control-color',
    'button-filled-$status-active-background-color': 'color-$status-hover',
    'button-filled-$status-active-border-color': 'color-$status-hover',
    'button-filled-$status-active-text-color':
        'button-filled-$status-text-color',
    'button-filled-$status-disabled-background-color':
        'background-basic-color-3',
    'button-filled-$status-disabled-border-color': 'border-basic-color-3',
    'button-filled-$status-disabled-text-color': 'text-disabled-color',
  });
}

final StyleData _filledStyle = StyleData({
  'button-filled-border-width': 2.0,
  'button-filled-tiny-padding':
      const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
  'button-filled-small-padding':
      const EdgeInsets.symmetric(vertical: 6.0, horizontal: 14.0),
  'button-filled-medium-padding':
      const EdgeInsets.symmetric(vertical: 10.0, horizontal: 18.0),
  'button-filled-large-padding':
      const EdgeInsets.symmetric(vertical: 12.0, horizontal: 18.0),
  'button-filled-giant-padding':
      const EdgeInsets.symmetric(vertical: 14.0, horizontal: 22.0),
  'button-filled-background-color': 'background-basic-color-2',
  'button-filled-border-color': 'border-basic-color-2',
  'button-filled-text-color': 'text-basic-color',
  'button-filled-active-background-color': 'background-basic-color-1',
  'button-filled-active-border-color': 'border-basic-color-1',
  'button-filled-active-text-color': 'text-basic-color',
  'button-filled-disabled-background-color': 'background-basic-color-3',
  'button-filled-disabled-border-color': 'border-basic-color-3',
  'button-filled-disabled-text-color': 'text-disabled-color',
})
  ..inject(_getFilledForStatus('primary'))
  ..inject(_getFilledForStatus('success'))
  ..inject(_getFilledForStatus('warning'))
  ..inject(_getFilledForStatus('danger'))
  ..inject(_getFilledForStatus('info'));

StyleData _getOutlineForStatus(String status) {
  return StyleData({
    'button-outline-$status-border-color': 'color-$status-default',
    'button-outline-$status-text-color': 'text-$status-color',
    'button-outline-$status-background-color':
        'button-outline-background-color',
    'button-outline-$status-active-border-color': 'color-$status-hover',
    'button-outline-$status-active-text-color': 'text-$status-hover-color',
    'button-outline-$status-active-background-color':
        'button-outline-background-color',
    'button-outline-$status-disabled-border-color': 'border-basic-color-3',
    'button-outline-$status-disabled-text-color': 'text-disabled-color',
    'button-outline-$status-disabled-background-color':
        'button-outline-background-color',
  });
}

final StyleData _outlineStyle = StyleData({
  'button-outline-border-width': 2.0,
  'button-outline-background-color': 'background-basic-color-2',
  'button-outline-tiny-padding':
      const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
  'button-outline-small-padding':
      const EdgeInsets.symmetric(vertical: 6.0, horizontal: 14.0),
  'button-outline-medium-padding':
      const EdgeInsets.symmetric(vertical: 10.0, horizontal: 18.0),
  'button-outline-large-padding':
      const EdgeInsets.symmetric(vertical: 12.0, horizontal: 18.0),
  'button-outline-giant-padding':
      const EdgeInsets.symmetric(vertical: 14.0, horizontal: 22.0),
  'button-outline-border-color': 'text-basic-color',
  'button-outline-text-color': 'text-basic-color',
  'button-outline-active-border-color': 'text-hint-color',
  'button-outline-active-text-color': 'text-hint-color',
  'button-outline-active-background-color': 'button-outline-background-color',
  'button-outline-disabled-border-color': 'border-basic-color-3',
  'button-outline-disabled-text-color': 'text-disabled-color',
  'button-outline-disabled-background-color': 'button-outline-background-color',
})
  ..inject(_getOutlineForStatus('primary'))
  ..inject(_getOutlineForStatus('success'))
  ..inject(_getOutlineForStatus('warning'))
  ..inject(_getOutlineForStatus('danger'))
  ..inject(_getOutlineForStatus('info'));

StyleData _getGhostForStatus(String status) {
  return StyleData({
    'button-ghost-$status-border-color': 'button-ghost-border-color',
    'button-ghost-$status-text-color': 'text-$status-color',
    'button-ghost-$status-background-color': 'button-ghost-background-color',
    'button-ghost-$status-active-border-color': 'button-ghost-border-color',
    'button-ghost-$status-active-text-color': 'text-$status-hover-color',
    'button-ghost-$status-active-background-color':
        'button-ghost-background-color',
    'button-ghost-$status-disabled-border-color': 'button-ghost-border-color',
    'button-ghost-$status-disabled-text-color': 'text-disabled-color',
    'button-ghost-$status-disabled-background-color':
        'button-ghost-background-color',
  });
}

final StyleData _ghostStyle = StyleData({
  'button-ghost-border-width': 0.0,
  'button-ghost-border-color': Colors.transparent,
  'button-ghost-background-color': Colors.transparent,
  'button-ghost-tiny-padding':
      const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
  'button-ghost-small-padding':
      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
  'button-ghost-medium-padding':
      const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
  'button-ghost-large-padding':
      const EdgeInsets.symmetric(vertical: 14.0, horizontal: 20.0),
  'button-ghost-giant-padding':
      const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
  'button-ghost-text-color': 'text-basic-color',
  'button-ghost-active-border-color': 'button-ghost-border-color',
  'button-ghost-active-text-color': 'text-hint-color',
  'button-ghost-active-background-color': 'button-ghost-background-color',
  'button-ghost-disabled-border-color': 'button-ghost-border-color',
  'button-ghost-disabled-text-color': 'text-disabled-color',
  'button-ghost-disabled-background-color': 'button-ghost-background-color',
})
  ..inject(_getGhostForStatus('primary'))
  ..inject(_getGhostForStatus('success'))
  ..inject(_getGhostForStatus('warning'))
  ..inject(_getGhostForStatus('danger'))
  ..inject(_getGhostForStatus('info'));

final StyleData buttonStyle = StyleData({
  'button-outline-width': 'outline-width',
  'button-outline-color': 'outline-color',
  'button-text-font-family': 'font-family-primary',
  'button-text-font-weight': FontWeight.w700,
  'button-text-tiny-font-size': 0.625 * 16.0,
  'button-text-small-font-size': 0.75 * 16.0,
  'button-text-medium-font-size': 0.875 * 16.0,
  'button-text-large-font-size': 1 * 16.0,
  'button-text-giant-font-size': 1.125 * 16.0,
})
  ..inject(_filledStyle)
  ..inject(_ghostStyle)
  ..inject(_outlineStyle);
