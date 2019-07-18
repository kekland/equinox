import 'package:equinox/equinox.dart';
import 'package:flutter/cupertino.dart';

StyleData _generateForStatus(String status) {
  return StyleData({
    'text-field-$status-border-color': 'color-$status-default',
    'text-field-$status-background-color': 'background-basic-color-2',
    'text-field-$status-text-color': 'text-basic-color',
    'text-field-$status-hint-color': 'text-hint-color',
    'text-field-$status-active-border-color': 'color-$status-hover',
    'text-field-$status-active-background-color': 'background-basic-color-2',
    'text-field-$status-active-text-color': 'text-basic-color',
    'text-field-$status-active-hint-color': 'text-hint-color',
    'text-field-$status-disabled-border-color': 'border-basic-color-4',
    'text-field-$status-disabled-background-color': 'background-basic-color-3',
    'text-field-$status-disabled-text-color': 'text-disabled-color',
    'text-field-$status-disabled-hint-color': 'text-disabled-color',
    'text-field-$status-error-border-color': 'color-danger-default',
    'text-field-$status-error-background-color': 'background-basic-color-2',
    'text-field-$status-error-text-color': 'text-basic-color',
    'text-field-$status-error-hint-color': 'text-hint-color',
  });
}

final StyleData textFieldStyle = StyleData({
  'text-field-border-width': 'border-width',
  'text-field-active-border-width': (s) => s.get('border-width') * 2.0,
  'text-field-label-font-family': 'text-label-font-family',
  'text-field-label-font-size': 'text-label-font-size',
  'text-field-label-font-weight': 'text-label-font-weight',
  'text-field-label-color': 'text-hint-color',
  'text-field-description-font-family': 'text-paragraph-2-font-family',
  'text-field-description-font-size': 'text-paragraph-2-font-size',
  'text-field-description-font-weight': 'text-paragraph-2-font-weight',
  'text-field-description-color': 'text-hint-color',
  'text-field-error-font-family': 'text-paragraph-2-font-family',
  'text-field-error-font-size': 'text-paragraph-2-font-size',
  'text-field-error-font-weight': 'text-paragraph-2-font-weight',
  'text-field-error-color': 'text-danger-color',
  'text-field-hint-font-family': 'text-paragraph-font-family',
  'text-field-hint-font-size': 'text-paragraph-font-size',
  'text-field-hint-font-weight': 'text-paragraph-font-weight',
  'text-field-hint-color': 'text-hint-color',
  'text-field-tiny-text-font-family': 'text-caption-2-font-family',
  'text-field-tiny-text-font-size': 'text-caption-2-font-size',
  'text-field-tiny-text-font-weight': 'text-caption-2-font-weight',
  'text-field-small-text-font-family': 'text-subtitle-2-font-family',
  'text-field-small-text-font-size': 'text-subtitle-2-font-size',
  'text-field-small-text-font-weight': 'text-subtitle-2-font-weight',
  'text-field-medium-text-font-family': 'text-subtitle-font-family',
  'text-field-medium-text-font-size': 'text-subtitle-font-size',
  'text-field-medium-text-font-weight': 'text-subtitle-font-weight',
  'text-field-large-text-font-family': 'text-subtitle-font-family',
  'text-field-large-text-font-size': 'text-subtitle-font-size',
  'text-field-large-text-font-weight': 'text-subtitle-font-weight',
  'text-field-giant-text-font-family': 'text-heading-6-font-family',
  'text-field-giant-text-font-size': 'text-heading-6-font-size',
  'text-field-giant-text-font-weight': 'text-heading-6-font-weight',
  'text-field-tiny-padding':
      EdgeInsets.symmetric(vertical: 0.4375 * 16.0, horizontal: 1.125 * 16.0),
  'text-field-small-padding':
      EdgeInsets.symmetric(vertical: 0.5375 * 16.0, horizontal: 1.125 * 16.0),
  'text-field-medium-padding':
      EdgeInsets.symmetric(vertical: 0.6875 * 16.0, horizontal: 1.125 * 16.0),
  'text-field-large-padding':
      EdgeInsets.symmetric(vertical: 0.9375 * 16.0, horizontal: 1.125 * 16.0),
  'text-field-giant-padding':
      EdgeInsets.symmetric(vertical: 1.0 * 16.0, horizontal: 1.125 * 16.0),
  'text-field-border-color': 'border-basic-color-3',
  'text-field-background-color': 'background-basic-color-2',
  'text-field-text-color': 'text-basic-color',
  'text-field-hint-color': 'text-hint-color',
  'text-field-active-border-color': 'color-primary-default',
  'text-field-active-background-color': 'background-basic-color-2',
  'text-field-active-text-color': 'text-basic-color',
  'text-field-active-hint-color': 'text-hint-color',
  'text-field-disabled-border-color': 'border-basic-color-4',
  'text-field-disabled-background-color': 'background-basic-color-3',
  'text-field-disabled-text-color': 'text-disabled-color',
  'text-field-disabled-hint-color': 'text-disabled-color',
  'text-field-error-border-color': 'color-danger-default',
  'text-field-error-background-color': 'background-basic-color-2',
  'text-field-error-text-color': 'text-basic-color',
  'text-field-error-hint-color': 'text-hint-color',
})
  ..inject(_generateForStatus('primary'))
  ..inject(_generateForStatus('success'))
  ..inject(_generateForStatus('warning'))
  ..inject(_generateForStatus('danger'))
  ..inject(_generateForStatus('info'));
