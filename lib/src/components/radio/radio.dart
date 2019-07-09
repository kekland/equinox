import 'package:equinox/equinox.dart';
import 'package:equinox/src/equinox_internal.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart' as MaterialDesign;

export 'package:equinox/src/components/radio/radio_theme.dart';

/// Toggle represents a selection in a list of items.
class EqRadio extends StatefulWidget {
  /// A method to call when user selects this radio button.
  final VoidCallback onSelected;

  /// The value of radio. Cannot be null.
  final bool value;

  /// A description to put either on left or on the right of checkbox, controlled by [descriptionPosition].
  final String description;

  /// Status of the widget. Controls the color of the toggle.
  final WidgetStatus status;

  /// Controls the location of description.
  final Positioning descriptionPosition;

  const EqRadio({
    Key key,
    @required this.onSelected,
    @required this.value,
    this.description,
    this.status,
    this.descriptionPosition = Positioning.right,
  }) : super(key: key);
  @override
  _EqRadioState createState() => _EqRadioState();
}

class _EqRadioState extends State<EqRadio> {
  bool outlined = false;

  EqRadioThemeData getThemeData(BuildContext context) {
    final theme = EqTheme.of(context);
    EqRadioThemeData themeData = theme.defaultRadioTheme ?? EqRadioThemeData();

    return themeData.copyWith(
      status: widget.status,
      descriptionPosition: widget.descriptionPosition,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = EqTheme.of(context);
    final themeData = getThemeData(context);

    final disabled = widget.onSelected == null;
    final selected = widget.value;
    final borderRadius = BorderRadius.circular(12.0);

    final descriptionTextStyle =
        themeData.getDescriptionTextStyle(theme: theme);
    final backgroundColor = themeData.getFillColor(
        theme: theme, disabled: disabled, selected: selected);
    final borderColor = themeData.getBorderColor(
        theme: theme, disabled: disabled, selected: selected);
    final circleColor = themeData.getKnobColor(
        theme: theme, disabled: disabled, selected: selected);

    var list = <Widget>[];

    final radio = OutlinedWidget(
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
          color: backgroundColor,
          border: Border.all(color: borderColor, width: 1.0),
        ),
        child: MaterialDesign.Material(
          type: MaterialDesign.MaterialType.transparency,
          child: Center(
            child: AnimatedContainer(
              duration: theme.minorAnimationDuration,
              curve: theme.minorAnimationCurve,
              width: 16.0,
              height: 16.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: circleColor,
              ),
            ),
          ),
        ),
      ),
    );

    if (widget.description != null &&
        themeData.descriptionPosition == Positioning.left) {
      list = [
        Text(
          widget.description,
          style: descriptionTextStyle,
        ),
        SizedBox(width: 8.0),
        radio,
      ];
    }

    if (widget.description != null &&
        themeData.descriptionPosition == Positioning.right) {
      list = [
        radio,
        SizedBox(width: 8.0),
        Text(
          widget.description,
          style: descriptionTextStyle,
        ),
      ];
    }

    return OutlinedGestureDetector(
      onTap: widget.onSelected,
      onOutlineChange: (v) => setState(() => outlined = v),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: list,
      ),
    );
  }
}
