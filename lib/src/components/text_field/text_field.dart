import 'package:equinox/equinox.dart';
import 'package:equinox/src/equinox_internal.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart' as MaterialDesign;

export 'package:equinox/src/components/text_field/text_field_style.dart';

/// A Widget that is used to receive text information from user. Can be styled using [EqTextFieldTheme].
class EqTextField extends StatefulWidget {
  /// Controls the TextField's border radius.
  final EqWidgetShape shape;

  /// Controls the TextField's color.
  final EqWidgetStatus status;

  /// Text to put as error. Will repaint the text field. If `null` is provided, no error will be drawn.
  final String error;

  /// Text to put as a hint.
  final String hint;

  /// Text to put as a label. Can be `null`.
  final String label;

  /// Text to put as a description. Can be `null`.
  final String description;

  /// Can this text field be used?
  final bool enabled;

  /// TextEditingController to pass to the TextField
  final TextEditingController controller;

  /// Gets called when user taps the TextField
  final void Function() onTap;

  /// Gets called when the text in the TextField is changed
  final void Function(String) onChanged;

  /// Gets called when user submits text through keyboard
  final void Function(String) onSubmitted;

  /// Gets called when user is finished editing this field
  final void Function() onEditingComplete;

  /// Icon to put into TextField. Position is controlled using [iconPosition].
  final IconData icon;

  /// Controls the position of [icon].
  final EqPositioning iconPosition;

  /// Whether to obscure the text or not. For example, when editing password you need to set this to true.
  final bool obscureText;

  /// Size of this widget.
  final EqWidgetSize size;

  /// Padding to use inside TextField.
  final EdgeInsets padding;

  /// Type of the keyboard.
  final TextInputType keyboardType;

  /// A [FocusNode] to pass to [TextField].
  final FocusNode focusNode;

  const EqTextField({
    Key key,
    @required this.hint,
    this.shape = EqWidgetShape.rectangle,
    this.status,
    this.error,
    this.enabled = true,
    this.controller,
    this.onTap,
    this.onChanged,
    this.onSubmitted,
    this.onEditingComplete,
    this.icon,
    this.iconPosition = EqPositioning.left,
    this.label,
    this.description,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.focusNode,
    this.size = EqWidgetSize.medium,
    this.padding,
  }) : super(key: key);
  @override
  _EqTextFieldState createState() => _EqTextFieldState();
}

class _EqTextFieldState extends State<EqTextField> {
  bool outlined = false;
  FocusNode focusNode;

  void focusNodeListener() {
    setState(() {
      outlined = this.focusNode.hasFocus;
    });
  }

  @override
  void initState() {
    if (widget.focusNode != null) {
      this.focusNode = widget.focusNode;
    } else {
      this.focusNode = FocusNode();
    }
    this.focusNode.addListener(focusNodeListener);
    super.initState();
  }

  @override
  void dispose() {
    this.focusNode.addListener(focusNodeListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = StaticStyle.of(context);

    final errored = (widget.error != null);
    final disabled = !(widget.enabled);

    final sizedSelector = [
      'text-field',
      widget.size,
    ];

    final statusSelector = [
      'text-field',
      widget.status,
      (disabled) ? 'disabled' : errored ? 'error' : outlined ? 'active' : null,
    ];

    final borderRadius = BorderRadius.all(EqWidgetShapeUtils.getRadius(
      style: style.style,
      shape: widget.shape,
    ));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (widget.label != null) ...[
          Text(
            widget.label.toUpperCase(),
            style: TextStyle(
              color: style.get('text-field-label-color'),
              fontSize: style.get('text-field-label-font-size'),
              fontFamily: style.get('text-field-label-font-family'),
              fontWeight: style.get('text-field-label-fony-weight'),
            ),
          ),
          SizedBox(height: 6.0),
        ],
        GestureDetector(
          onTapDown:
              (widget.enabled) ? (_) => setState(() => outlined = true) : null,
          child: OutlinedWidget(
            outlined: outlined,
            borderRadius: borderRadius,
            child: MaterialDesign.Material(
              type: MaterialDesign.MaterialType.transparency,
              child: MaterialDesign.TextField(
                focusNode: focusNode,
                obscureText: widget.obscureText,
                keyboardType: widget.keyboardType,
                controller: widget.controller,
                cursorColor: style
                    .get(generateSelector([...statusSelector, 'border-color'])),
                onTap: widget.onTap,
                onEditingComplete: widget.onEditingComplete,
                onChanged: widget.onChanged,
                onSubmitted: widget.onSubmitted,
                enabled: widget.enabled,
                style: TextStyle(
                  color: style
                      .get(generateSelector([...statusSelector, 'text-color'])),
                  fontFamily: style.get(
                      generateSelector([...sizedSelector, 'text-font-family'])),
                  fontWeight: style.get(
                      generateSelector([...sizedSelector, 'text-font-weight'])),
                  fontSize: style.get(
                      generateSelector([...sizedSelector, 'text-font-size'])),
                ),
                decoration: MaterialDesign.InputDecoration(
                  hintText: widget.hint,
                  hintStyle: TextStyle(
                    color: style.get(
                        generateSelector([...statusSelector, 'hint-color'])),
                    fontFamily: style.get('text-field-hint-font-family'),
                    fontSize: style.get('text-field-hint-font-size'),
                    fontWeight: style.get('text-field-hint-font-weight'),
                  ),
                  filled: true,
                  fillColor: style.get(generateSelector(
                      [...statusSelector, 'background-color'])),
                  prefixIcon: (widget.icon != null &&
                          widget.iconPosition == EqPositioning.left)
                      ? EqIcon(
                          widget.icon,
                          color: style.get(generateSelector(
                              [...statusSelector, 'hint-color'])),
                          size: style.get(generateSelector(
                              [...sizedSelector, 'text-font-size'])),
                        )
                      : null,
                  suffixIcon: (widget.icon != null &&
                          widget.iconPosition == EqPositioning.right)
                      ? EqIcon(
                          widget.icon,
                          color: style.get(generateSelector(
                              [...statusSelector, 'hint-color'])),
                          size: style.get(generateSelector(
                              [...sizedSelector, 'text-font-size'])),
                        )
                      : null,
                  contentPadding: widget.padding ??
                      style
                          .get(generateSelector([...sizedSelector, 'padding'])),
                  border: MaterialDesign.OutlineInputBorder(
                    borderSide: BorderSide(
                      color: style.get(
                        generateSelector(
                          [
                            'text-field',
                            widget.status,
                            (errored) ? 'error' : null,
                            'border-color'
                          ],
                        ),
                      ),
                      width: style.get('text-field-border-width'),
                    ),
                    borderRadius: borderRadius,
                  ),
                  enabledBorder: MaterialDesign.OutlineInputBorder(
                    borderSide: BorderSide(
                      color: style.get(generateSelector(
                          [...statusSelector, 'border-color'])),
                      width: style.get('text-field-border-width'),
                    ),
                    borderRadius: borderRadius,
                  ),
                  focusedBorder: MaterialDesign.OutlineInputBorder(
                    borderSide: BorderSide(
                      color: style.get(generateSelector(
                          [...statusSelector, 'border-color'])),
                      width: style.get('text-field-active-border-width'),
                    ),
                    borderRadius: borderRadius,
                  ),
                  disabledBorder: MaterialDesign.OutlineInputBorder(
                    borderSide: BorderSide(
                      color: style.get(generateSelector([
                        'text-field',
                        widget.status,
                        'disabled-border-color'
                      ])),
                      width: style.get('text-field-border-width'),
                    ),
                    borderRadius: borderRadius,
                  ),
                ),
              ),
            ),
          ),
        ),
        if (!errored && widget.description != null) ...[
          SizedBox(height: 4.0),
          Text(
            widget.description,
            style: TextStyle(
              color: style.get('text-field-description-color'),
              fontSize: style.get('text-field-description-font-size'),
              fontFamily: style.get('text-field-description-font-family'),
              fontWeight: style.get('text-field-description-fony-weight'),
            ),
          ),
        ],
        if (errored) ...[
          SizedBox(height: 4.0),
          Text(
            widget.error,
            style: TextStyle(
              color: style.get('text-field-error-color'),
              fontSize: style.get('text-field-error-font-size'),
              fontFamily: style.get('text-field-error-font-family'),
              fontWeight: style.get('text-field-error-fony-weight'),
            ),
          ),
        ],
      ],
    );
  }
}
