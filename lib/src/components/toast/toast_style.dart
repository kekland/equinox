import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';

StyleData _generateForStatus(String status) {
  return StyleData({
    'toast-$status-background-color': 'color-$status-default',
    'toast-$status-foreground-color': 'text-control-color',
  });
}

final StyleData toastStyle = StyleData({
  'toast-shadow': 'shadow',
  'toast-icon-size': 'icon-size',
  'toast-icon-padding': EdgeInsets.all(4.0),
  'toast-title-font-family': 'text-subtitle-font-family',
  'toast-title-font-weight': 'text-subtitle-font-weight',
  'toast-title-font-size': 'text-subtitle-font-size',
  'toast-subtitle-font-family': 'text-paragraph-font-family',
  'toast-subtitle-font-weight': 'text-paragraph-font-weight',
  'toast-subtitle-font-size': 'text-paragraph-font-size',
  'toast-background-color': 'background-basic-color-1',
  'toast-foreground-color': 'text-basic-color',
});
