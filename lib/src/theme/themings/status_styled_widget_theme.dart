import 'package:equinox/equinox.dart';
import 'package:equinox/src/model/params.dart';

abstract class StatusAppliedWidgetThemeData<T> {
  T generateFromStatus({EqThemeData theme, T base, EqWidgetStatus status});
  T merge(T other);
}

class StatusStyledWidgetThemeData<T extends StatusAppliedWidgetThemeData<T>> {
  final T base;
  final T primary;
  final T success;
  final T info;
  final T warning;
  final T danger;
  final T basic;

  StatusStyledWidgetThemeData({T data})
      : base = data,
        primary = null,
        success = null,
        info = null,
        warning = null,
        danger = null,
        basic = null;

  StatusStyledWidgetThemeData.raw({
    this.base,
    this.primary,
    this.success,
    this.info,
    this.warning,
    this.danger,
    this.basic,
  });

  factory StatusStyledWidgetThemeData.autoFillRest(
      {EqThemeData theme, T base}) {
    return StatusStyledWidgetThemeData.raw(
      base: base,
      primary: base.generateFromStatus(
          theme: theme, base: base, status: EqWidgetStatus.primary),
      success: base.generateFromStatus(
          theme: theme, base: base, status: EqWidgetStatus.success),
      info: base.generateFromStatus(
          theme: theme, base: base, status: EqWidgetStatus.info),
      warning: base.generateFromStatus(
          theme: theme, base: base, status: EqWidgetStatus.warning),
      danger: base.generateFromStatus(
          theme: theme, base: base, status: EqWidgetStatus.danger),
      basic: base.generateFromStatus(
          theme: theme, base: base, status: EqWidgetStatus.basic),
    );
  }

  T getWithStatus(EqWidgetStatus status) {
    switch (status) {
      case EqWidgetStatus.primary:
        return this.primary;
      case EqWidgetStatus.success:
        return this.success;
      case EqWidgetStatus.info:
        return this.info;
      case EqWidgetStatus.warning:
        return this.warning;
      case EqWidgetStatus.danger:
        return this.danger;
      case EqWidgetStatus.basic:
        return this.basic;
      default:
        return this.base;
    }
  }

  StatusStyledWidgetThemeData
      copyWith<T extends StatusAppliedWidgetThemeData<T>>({
    EqThemeData theme,
    T base,
    T primary,
    T success,
    T info,
    T warning,
    T danger,
    T basic,
  }) {
    return StatusStyledWidgetThemeData<T>.raw(
      base: base,
      primary: base
          .generateFromStatus(
              theme: theme, base: base, status: EqWidgetStatus.primary)
          .merge(primary),
      success: base
          .generateFromStatus(
              theme: theme, base: base, status: EqWidgetStatus.success)
          .merge(success),
      info: base
          .generateFromStatus(
              theme: theme, base: base, status: EqWidgetStatus.info)
          .merge(info),
      warning: base
          .generateFromStatus(
              theme: theme, base: base, status: EqWidgetStatus.warning)
          .merge(warning),
      danger: base
          .generateFromStatus(
              theme: theme, base: base, status: EqWidgetStatus.danger)
          .merge(danger),
      basic: base
          .generateFromStatus(
              theme: theme, base: base, status: EqWidgetStatus.basic)
          .merge(basic),
    );
  }

  StatusStyledWidgetThemeData merge<T extends StatusAppliedWidgetThemeData<T>>(
      StatusStyledWidgetThemeData<T> other) {
    if (other == null) return this;
    return copyWith(
      base: other.base,
      basic: other.basic,
      danger: other.danger,
      info: other.info,
      primary: other.primary,
      success: other.success,
      warning: other.warning,
    );
  }
}
