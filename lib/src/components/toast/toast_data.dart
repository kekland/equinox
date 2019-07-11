import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';

/// A set of data to display in a toast.
class EqToast {
  /// Message gets displayed as the largest element in the tab.
  final String message;

  /// Subtitle provides some additional information besides [message]. Optional.
  final String subtitle;

  /// Icon to display alongside [message]. Optional.
  final IconData icon;

  /// Status of this toast
  final EqWidgetStatus status;

  /// The shape of this toast. Uses [EqThemeData.defaultWidgetShape] as default.
  final EqWidgetShape shape;

  /// Duration of this toast. After [duration] elapses, tab will hide automatically.
  final Duration duration;

  /// Gets called when user taps the toast. Optional.
  final VoidCallback onTap;

  const EqToast({
    @required this.message,
    this.subtitle,
    this.icon,
    this.onTap,
    this.status = EqWidgetStatus.primary,
    this.shape,
    this.duration = const Duration(seconds: 3),
  });
}
