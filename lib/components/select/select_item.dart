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
}
