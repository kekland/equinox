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
  final EqWidgetStatus status;

  /// Controls the location of description.
  final EqPositioning descriptionPosition;

  const EqRadio({
    Key key,
    @required this.onSelected,
    @required this.value,
    this.description,
    this.status,
    this.descriptionPosition = EqPositioning.right,
  }) : super(key: key);
  @override
  _EqRadioState createState() => _EqRadioState();
}

class _EqRadioState extends State<EqRadio> {
  bool outlined = false;

  @override
  Widget build(BuildContext context) {
    final theme = EqTheme.of(context);
    final themeData = EqRadioThemeData.of(context).getWithStatus(widget.status);

    final enabled = widget.onSelected != null;
    final selected = widget.value;

    final backgroundColor = themeData.backgroundTheme
        .getBackgroundColor(selected: selected, enabled: enabled);

    final knobColor = selected
        ? themeData.knobTheme
            .getBackgroundColor(selected: true, enabled: enabled)
        : Colors.transparent;

    final border =
        themeData.borderTheme.getBorder(selected: selected, enabled: enabled);

    final double size = themeData.size ?? 24.0;
    final double knobSize = themeData.knobSize ?? size * (2.0 / 3.0);

    final BorderRadius borderRadius =
        themeData.borderRadius ?? BorderRadius.circular(size / 2.0);

    final radio = OutlinedWidget(
      outlined: outlined,
      predefinedSize: Size.square(size),
      borderRadius: borderRadius,
      child: AnimatedContainer(
        duration: theme.minorAnimationTheme.duration,
        curve: theme.minorAnimationTheme.curve,
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: backgroundColor,
          border: border,
        ),
        child: MaterialDesign.Material(
          type: MaterialDesign.MaterialType.transparency,
          child: Center(
            child: AnimatedContainer(
              duration: theme.minorAnimationTheme.duration,
              curve: theme.minorAnimationTheme.curve,
              width: knobSize,
              height: knobSize,
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                color: knobColor,
              ),
            ),
          ),
        ),
      ),
    );

    final description = widget.description != null
        ? EqText.subtitle2(
            widget.description,
            style: themeData.descriptionStyle,
          )
        : null;

    return OutlinedGestureDetector(
      onTap: widget.onSelected,
      onOutlineChange: (v) => setState(() => outlined = v),
      child: Padding(
        padding: themeData.padding ?? theme.controlElementsTheme.padding,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: EqToggleableDesciptionUtils.buildListWithDescription(
            main: radio,
            description: description,
            descriptionPosition:
                widget.descriptionPosition ?? themeData.descriptionPosition,
            padding: themeData.descriptionPadding ?? theme.controlElementsTheme.descriptionPadding,
          ),
        ),
      ),
    );
  }
}
