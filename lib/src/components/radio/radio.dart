import 'package:equinox/equinox.dart';
import 'package:equinox/src/equinox_internal.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart' as MaterialDesign;

export 'package:equinox/src/components/radio/radio_style.dart';

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
    final style = StaticStyle.of(context);

    final enabled = widget.onSelected != null;
    final selected = widget.value;
    final focused = outlined;

    final List selectorBasis = [
      'radio',
      (enabled) ? widget.status : 'disabled',
      (enabled && focused) ? 'focus' : null,
      (selected && !focused) ? 'selected' : null,
    ];

    final radio = OutlinedWidget(
      outlined: outlined,
      predefinedSize: Size.square(style.get('radio-size')),
      borderRadius: BorderRadius.circular(style.get('radio-size')),
      child: AnimatedContainer(
        duration: style.get('minor-animation-duration'),
        curve: style.get('minor-animation-curve'),
        width: style.get('radio-size'),
        height: style.get('radio-size'),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(style.get('radio-size')),
          color: style
              .get(generateSelector([...selectorBasis, 'background', 'color'])),
          border: Border.all(
            color: style
                .get(generateSelector([...selectorBasis, 'border', 'color'])),
            width: style.get('radio-border-width'),
          ),
        ),
        child: MaterialDesign.Material(
          type: MaterialDesign.MaterialType.transparency,
          child: Center(
            child: AnimatedContainer(
              duration: style.get('minor-animation-duration'),
              curve: style.get('minor-animation-curve'),
              width: style.get('radio-size') * (2 / 3),
              height: style.get('radio-size') * (2 / 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(style.get('radio-size')),
                color: style
                    .get(generateSelector([...selectorBasis, 'knob', 'color'])),
              ),
            ),
          ),
        ),
      ),
    );

    final description = widget.description != null
        ? EqText.subtitle2(
            widget.description,
            style: TextStyle(
              fontFamily: style.get('radio-text-font-family'),
              fontSize: style.get('radio-text-font-size'),
              fontWeight: style.get('radio-text-font-weight'),
              color: (enabled)
                  ? style.get('radio-text-color')
                  : style.get('radio-disabled-text-color'),
            ),
          )
        : null;

    return OutlinedGestureDetector(
      onTap: widget.onSelected,
      onOutlineChange: (v) => setState(() => outlined = v),
      child: Padding(
        padding: style.get('radio-padding'),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: EqToggleableDesciptionUtils.buildListWithDescription(
            main: radio,
            description: description,
            descriptionPosition: widget.descriptionPosition ??
                style.get('radio-description-position'),
            padding: style.get('radio-description-padding'),
          ),
        ),
      ),
    );
  }
}
