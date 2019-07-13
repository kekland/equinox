import 'package:equinox/equinox.dart';
export 'package:equinox/src/components/checkbox/checkbox_style.dart';
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
  final EqWidgetStatus status;

  /// Status of the widget. Controls the color of the checkbox. Gets overwritten
  /// if [EqCheckboxThemeData.borderRadius] is present.
  final EqWidgetShape shape;

  /// Controls the location of description.
  final EqPositioning descriptionPosition;

  /// Padding for the radio. Defaults to `control-padding`.
  final EdgeInsets padding;

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
    this.descriptionPosition = EqPositioning.right,
    this.padding,
  }) : super(key: key);

  @override
  _EqCheckboxState createState() => _EqCheckboxState();
}

class _EqCheckboxState extends State<EqCheckbox> {
  bool outlined = false;

  _onTap() {
    if (widget.value == null)
      widget.onChanged(true);
    else
      widget.onChanged(!widget.value);
  }

  @override
  Widget build(BuildContext context) {
    final style = StaticStyle.of(context);

    final enabled = widget.onChanged != null;
    final selected = widget.value;
    final focused = outlined;

    final List selectorBasis = [
      'checkbox',
      (enabled) ? widget.status : 'disabled',
      (enabled && focused) ? 'focus' : null,
      (selected != null && selected && !focused && enabled)
          ? 'checked'
          : (selected == null && !focused && enabled) ? 'indeterminate' : null,
    ];

    final borderRadius =
        EqWidgetShapeUtils.getRadius(style: style.style, shape: widget.shape);

    final checkbox = OutlinedWidget(
      outlined: outlined,
      predefinedSize: Size.square(style.get('checkbox-size')),
      borderRadius: BorderRadius.all(borderRadius),
      child: AnimatedContainer(
        duration: style.get('minor-animation-duration'),
        curve: style.get('minor-animation-curve'),
        width: style.get('checkbox-size'),
        height: style.get('checkbox-size'),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(borderRadius),
          color: style
              .get(generateSelector([...selectorBasis, 'background-color'])),
          border: Border.all(
            color:
                style.get(generateSelector([...selectorBasis, 'border-color'])),
            width: style.get('checkbox-border-width'),
          ),
        ),
        child: MaterialDesign.Material(
          type: MaterialDesign.MaterialType.transparency,
          child: Center(
            child: (widget.value == null)
                ? Icon(
                    EvaIcons.minus,
                    color: style.get(generateSelector(
                        [...selectorBasis, 'checkmark-color'])),
                    size: 16.0,
                  )
                : (widget.value)
                    ? Icon(
                        EvaIcons.checkmark,
                        color: style.get(generateSelector(
                            [...selectorBasis, 'checkmark-color'])),
                        size: 16.0,
                      )
                    : SizedBox(),
          ),
        ),
      ),
    );

    final description = (widget.description != null)
        ? EqText.subtitle2(
            widget.description,
            style: TextStyle(
              fontFamily: style.get('checkbox-text-font-family'),
              fontSize: style.get('checkbox-text-font-size'),
              fontWeight: style.get('checkbox-text-font-weight'),
              color: (enabled)
                  ? style.get('checkbox-text-color')
                  : style.get('checkbox-disabled-text-color'),
            ),
          )
        : null;

    return OutlinedGestureDetector(
      onTap: (widget.onChanged != null) ? _onTap : null,
      onOutlineChange: (v) => setState(() => outlined = v),
      child: Padding(
        padding: widget.padding ?? style.get('checkbox-padding'),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: EqToggleableDesciptionUtils.buildListWithDescription(
            main: checkbox,
            description: description,
            descriptionPosition: widget.descriptionPosition ??
                style.get('checkbox-description-position'),
            padding: style.get('checkbox-description-padding'),
          ),
        ),
      ),
    );
  }
}
