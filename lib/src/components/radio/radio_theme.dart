import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';

/// A class that contains the customizations for [EqRadio].
///
/// Can be used in [EqThemeData.defaultRadioTheme].
class EqRadioThemeData extends StatusAppliedWidgetThemeData<EqRadioThemeData> {
  /// Controls the position of the description.
  ///
  /// If null, defaults to [EqPositioning.right]
  final EqPositioning descriptionPosition;

  /// Controls the amount of padding of the container.
  ///
  /// Defaults to [EqThemeData.controlElementsTheme.padding].
  final EdgeInsets padding;

  /// Controls the radius of the radio.
  ///
  /// If null, defaults to [EqRadioThemeData.size / 2.0]
  final BorderRadius borderRadius;

  /// Controls the size of the widget.
  ///
  /// If null, defaults to [EqThemeData.defaultIconTheme]
  final double size;

  /// Controls the size of the knob.
  ///
  /// If null, defaults to [size * (2/3)]
  final double knobSize;

  /// The distance between the description and the widget.
  ///
  /// Defaults to [EqThemeData.controlElementsTheme.descriptionPadding].
  final double descriptionPadding;

  /// The style of the description.
  /// 
  /// Defaults to [EqThemeData.textTheme.subtitle2]
  final TextStyle descriptionStyle;

  /// Controls the border colors.
  ///
  /// If null, defaults to [EqThemeData.borderTheme]
  final EqBorderThemeData borderTheme;

  /// Controls the border colors.
  ///
  /// If null, defaults to [EqThemeData.backgroundTheme]
  final EqBackgroundThemeData backgroundTheme;

  /// Controls the border colors.
  final EqBackgroundThemeData knobTheme;

  EqRadioThemeData({
    this.descriptionPosition,
    this.padding,
    this.borderRadius,
    this.size,
    this.knobSize,
    this.descriptionPadding,
    this.descriptionStyle,
    this.borderTheme,
    this.backgroundTheme,
    this.knobTheme,
  });

  /// Merges two [EqRadioThemeData]'s.
  EqRadioThemeData copyWith({
    EqPositioning descriptionPosition,
    EdgeInsets padding,
    BorderRadius borderRadius,
    double size,
    double knobSize,
    double descriptionPadding,
    TextStyle descriptionStyle,
    EqBackgroundThemeData backgroundTheme,
    EqBorderThemeData borderTheme,
    EqBackgroundThemeData knobTheme,
  }) {
    return EqRadioThemeData(
      borderRadius: borderRadius ?? this.borderRadius,
      descriptionPadding: descriptionPadding ?? this.descriptionPadding,
      descriptionPosition: descriptionPosition ?? this.descriptionPosition,
      descriptionStyle: descriptionStyle ?? this.descriptionStyle,
      knobSize: knobSize ?? this.knobSize,
      padding: padding ?? this.padding,
      size: size ?? this.size,
      backgroundTheme: this.backgroundTheme.merge(backgroundTheme),
      borderTheme: this.borderTheme.merge(borderTheme),
      knobTheme: this.knobTheme.merge(knobTheme),
    );
  }

  /// Merges two [EqRadioThemeData]'s, giving the prevalence to the second one.
  EqRadioThemeData merge(EqRadioThemeData other) {
    if (other == null) return this;
    return copyWith(
      borderRadius: other.borderRadius,
      descriptionPadding: other.descriptionPadding,
      descriptionPosition: other.descriptionPosition,
      descriptionStyle: other.descriptionStyle,
      padding: other.padding,
      size: other.size,
      backgroundTheme: other.backgroundTheme,
      borderTheme: other.borderTheme,
      knobSize: other.knobSize,
      knobTheme: other.knobTheme,
    );
  }

  static EqRadioThemeData of(BuildContext context) {
    // TODO: return EqTheme.of(context).defaultRadioTheme;
  }

  @override
  EqRadioThemeData generateFromStatus(
      {EqThemeData theme, EqRadioThemeData base, EqWidgetStatus status,}) {
    return base.merge(
      EqRadioThemeData(
        backgroundTheme: EqBackgroundThemeData(
          color: theme.getColorForStatus(status: status, opacity: 0.125),
          colorSelected: theme.getColorForStatus(status: status),
        ),
        borderTheme: EqBorderThemeData(
          color: theme.getColorForStatus(status: status),
          colorSelected: theme.getColorForStatus(status: status),
        ),
        knobTheme: EqBackgroundThemeData(
          colorDisabled: theme.basic.shade400,
          colorSelected: theme.getColorForStatus(status: status),
        ),
      ),
    );
  }
}
