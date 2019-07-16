import 'package:equinox/equinox.dart';
import 'package:flutter/material.dart';

/// Represents an item in Select list.
class EqSelectItem<T> {
  /// Icon to display alongisde the title and subtitle.
  final IconData icon;

  /// Main information.
  final String title;

  /// Additional information.
  final String subtitle;

  /// Underlying value that this item holds.
  final T value;

  EqSelectItem({
    @required this.title,
    @required this.value,
    this.icon,
    this.subtitle,
  });

  double caluclateHeight(StaticStyleState style) {
    double titleHeight = (title != null)? style.get('list-item-title-font-size') : 0.0;
    double subtitleHeight = (subtitle != null)? style.get('list-item-subtitle-font-size') : 0.0;

    return 36.0 + titleHeight + subtitleHeight;
  }
}
