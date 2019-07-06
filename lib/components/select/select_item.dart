import 'package:equinox/equinox.dart';
import 'package:flutter/material.dart';

class EqSelectItem<T> {
  final IconData icon;
  final String title;
  final String subtitle;
  final T value;

  EqSelectItem({
    @required this.title,
    @required this.value,
    this.icon,
    this.subtitle,
  });
  
  double caluclateHeight(EqThemeData theme) {
    double titleHeight = theme.subtitle1.lineHeight * ((title != null)? 1.0 : 0.0);
    double subtitleHeight = theme.paragraph1.lineHeight * ((subtitle != null)? 1.0 : 0.0);

    return 32.0 + titleHeight + subtitleHeight;
  }
}
