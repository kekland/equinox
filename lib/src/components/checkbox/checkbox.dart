import 'package:equinox/equinox.dart';
export 'package:equinox/src/components/checkbox/checkbox_theme.dart';
import 'package:equinox/src/equinox_internal.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart' as MaterialDesign;

/// A widget that represents a boolean. [value] can be null. Can be deeply customized using
/// [EqCheckboxThemeData] or by passing `defaultCheckboxTheme` in `EqThemeData`.
/// Theme that is set in `EquinoxApp` will be merged with the closest [EqCheckbox] widget's theme,
/// with prevalence to the latter, and then combined with this butotn's settings.
class EqCheckbox extends StatefulWidget {
  /// Current value of the widget. Can be null (tristate).
  final bool value;

  /// A description to put either on left or on the right of checkbox, controlled by [descriptionPosition].
  final String description;

  /// Status of the widget. Controls the color of the checkbox.
  final WidgetStatus status;
  
  /// Status of the widget. Controls the color of the checkbox. Gets overwritten
  /// if [EqCheckboxThemeData.borderRadius] is present.
  final WidgetShape shape;
  
  /// Controls the location of description.
  final Positioning descriptionPosition;

  /// A method that is called when checkbox's value is changed. Checkbox is disabled if [onChanged] is null.
  /// If [value] is null, returns `true`.
  /// Otherwise, returns the opposite of [value].
  final void Function(bool) onChanged;

  const EqCheckbox({
    Key key,
    @required this.value,
    @required this.onChanged,
    this.description,
    this.status,
    this.shape,
    this.descriptionPosition,
  }) : super(key: key);

  @override
  _EqCheckboxState createState() => _EqCheckboxState();
}

class _EqCheckboxState extends State<EqCheckbox> {
  bool outlined = false;

  EqCheckboxThemeData getThemeData(BuildContext context) {
    final theme = EqTheme.of(context);
    EqCheckboxThemeData themeData =
        theme.defaultCheckboxTheme ?? EqCheckboxThemeData();

    return themeData.copyWith(
      status: widget.status,
      shape: widget.shape,
      descriptionPosition: widget.descriptionPosition,
    );
  }

  _onTap() {
    if (widget.value == null)
      widget.onChanged(true);
    else
      widget.onChanged(!widget.value);
  }

  @override
  Widget build(BuildContext context) {
    final theme = EqTheme.of(context);
    final themeData = getThemeData(context);

    final selected = widget.value == null || widget.value;
    final disabled = widget.onChanged == null;

    final borderRadius = themeData.getBorderRadius(theme: theme);
    final borderColor =
        themeData.getBorderColor(theme: theme, disabled: disabled);
    final fillColor = themeData.getFillColor(
        theme: theme, selected: selected, disabled: disabled);
    final descriptionStyle = themeData.getDescriptionTextStyle(theme: theme);
    final iconColor = themeData.getIconColor(theme: theme, disabled: disabled);

    var list = <Widget>[];

    final checkbox = OutlinedWidget(
      outlined: outlined,
      predefinedSize: Size(24.0, 24.0),
      borderRadius: borderRadius,
      child: AnimatedContainer(
        duration: theme.minorAnimationDuration,
        curve: theme.minorAnimationCurve,
        width: 24.0,
        height: 24.0,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: fillColor,
          border: Border.all(color: borderColor, width: 1.0),
        ),
        child: MaterialDesign.Material(
          type: MaterialDesign.MaterialType.transparency,
          child: Center(
            child: (widget.value == null)
                ? Icon(EvaIcons.minus, color: iconColor, size: 16.0)
                : (widget.value)
                    ? Icon(EvaIcons.checkmark, color: iconColor, size: 16.0)
                    : SizedBox(),
          ),
        ),
      ),
    );

    if (widget.description != null &&
        themeData.descriptionPosition == Positioning.left) {
      list = [
        Text(
          widget.description,
          style: descriptionStyle,
        ),
        SizedBox(width: 8.0),
        checkbox,
      ];
    } else if (widget.description != null &&
        themeData.descriptionPosition == Positioning.right) {
      list = [
        checkbox,
        SizedBox(width: 8.0),
        Text(
          widget.description,
          style: descriptionStyle,
        ),
      ];
    } else {
      list = [checkbox];
    }

    return OutlinedGestureDetector(
      onTap: (widget.onChanged != null) ? _onTap : null,
      onOutlineChange: (v) => setState(() => outlined = v),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: list,
      ),
    );
  }
}
