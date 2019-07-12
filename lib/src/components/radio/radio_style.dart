import 'package:equinox/equinox.dart';

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
  'radio-primary-border-color': 'color-primary-default',
  'radio-primary-background-color': (StyleData style) =>
      style.get('color-primary-default').withOpacity(0.125),
  'radio-primary-knob-color': Colors.transparent,
  'radio-primary-focus-border-color': 'color-primary-focus',
  'radio-primary-focus-background-color': (StyleData style) =>
      style.get('color-primary-focus').withOpacity(0.125),
  'radio-primary-focus-knob-color': 'color-primary-focus',
  'radio-primary-selected-border-color': 'color-primary-default',
  'radio-primary-selected-background-color': (StyleData style) =>
      style.get('color-primary-default').withOpacity(0.125),
  'radio-primary-selected-knob-color': 'color-primary-default',
  'radio-success-border-color': 'color-success-default',
  'radio-success-background-color': (StyleData style) =>
      style.get('color-success-default').withOpacity(0.125),
  'radio-success-knob-color': Colors.transparent,
  'radio-success-focus-border-color': 'color-success-focus',
  'radio-success-focus-background-color': (StyleData style) =>
      style.get('color-success-focus').withOpacity(0.125),
  'radio-success-focus-knob-color': 'color-success-focus',
  'radio-success-selected-border-color': 'color-success-default',
  'radio-success-selected-background-color': (StyleData style) =>
      style.get('color-success-default').withOpacity(0.125),
  'radio-success-selected-knob-color': 'color-success-default',
  'radio-warning-border-color': 'color-warning-default',
  'radio-warning-background-color': (StyleData style) =>
      style.get('color-warning-default').withOpacity(0.125),
  'radio-warning-knob-color': Colors.transparent,
  'radio-warning-focus-border-color': 'color-warning-focus',
  'radio-warning-focus-background-color': (StyleData style) =>
      style.get('color-warning-focus').withOpacity(0.125),
  'radio-warning-focus-knob-color': 'color-warning-focus',
  'radio-warning-selected-border-color': 'color-warning-default',
  'radio-warning-selected-background-color': (StyleData style) =>
      style.get('color-warning-default').withOpacity(0.125),
  'radio-warning-selected-knob-color': 'color-warning-default',
  'radio-danger-border-color': 'color-danger-default',
  'radio-danger-background-color': (StyleData style) =>
      style.get('color-danger-default').withOpacity(0.125),
  'radio-danger-knob-color': Colors.transparent,
  'radio-danger-focus-border-color': 'color-danger-focus',
  'radio-danger-focus-background-color': (StyleData style) =>
      style.get('color-danger-focus').withOpacity(0.125),
  'radio-danger-focus-knob-color': 'color-danger-focus',
  'radio-danger-selected-border-color': 'color-danger-default',
  'radio-danger-selected-background-color': (StyleData style) =>
      style.get('color-danger-default').withOpacity(0.125),
  'radio-danger-selected-knob-color': 'color-danger-default',
  'radio-info-border-color': 'color-info-default',
  'radio-info-background-color': (StyleData style) =>
      style.get('color-info-default').withOpacity(0.125),
  'radio-info-knob-color': Colors.transparent,
  'radio-info-focus-border-color': 'color-info-focus',
  'radio-info-focus-background-color': (StyleData style) =>
      style.get('color-info-focus').withOpacity(0.125),
  'radio-info-focus-knob-color': 'color-info-focus',
  'radio-info-selected-border-color': 'color-info-default',
  'radio-info-selected-background-color': (StyleData style) =>
      style.get('color-info-default').withOpacity(0.125),
  'radio-info-selected-knob-color': 'color-info-default',
});
