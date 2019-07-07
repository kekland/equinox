import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';

class EqToast {
  final String message;
  final String subtitle;
  final IconData icon;
  final WidgetStatus status;
  final WidgetShape shape;
  final Duration duration;
  final VoidCallback onTap;

  const EqToast({
    @required this.message,
    this.subtitle,
    this.icon,
    this.onTap,
    this.status = WidgetStatus.primary,
    this.shape = WidgetShape.rectangle,
    this.duration = const Duration(seconds: 3),
  });
}