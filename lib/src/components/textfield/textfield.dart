import 'package:equinox/equinox.dart';
import 'package:equinox/src/equinox_internal.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart' as MaterialDesign;

export 'package:equinox/src/components/textfield/textfield_theme.dart';

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
  }) : super(key: key);
  @override
  _EqTextFieldState createState() => _EqTextFieldState();
}

class _EqTextFieldState extends State<EqTextField> {
  bool outlined = false;
  FocusNode focusNode;

  EqTextFieldThemeData getThemeData(BuildContext context) {
    final theme = EqTheme.of(context);
    EqTextFieldThemeData themeData =
        theme.defaultTextFieldTheme ?? EqTextFieldThemeData();

    return themeData.copyWith(
      status: widget.status,
      shape: widget.shape,
      iconPosition: widget.iconPosition,
    );
  }

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
    final theme = EqTheme.of(context);
    final themeData = getThemeData(context);

    final errored = (widget.error != null);
    final disabled = !(widget.enabled);

    final borderRadius = themeData.getBorderRadius(theme: theme);
    final borderColor =
        themeData.getBorderColor(theme: theme, errored: errored);
    final focusedBorderColor =
        themeData.getFocusedBorderColor(theme: theme, errored: errored);
    final errorBorderColor = themeData.getErroredBorderColor(theme: theme);
    final disabledBorderColor = themeData.getDisabledBorderColor(theme: theme);
    final padding = themeData.getPadding(theme: theme);
    final backgroundColor = themeData.getBackgroundColor(theme: theme);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (widget.label != null) ...[
          EqText.label(
            widget.label.toUpperCase(),
            style: TextStyle(color: theme.textHintColor),
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
                cursorColor: focusedBorderColor,
                onTap: widget.onTap,
                onEditingComplete: widget.onEditingComplete,
                onChanged: widget.onChanged,
                onSubmitted: widget.onSubmitted,
                enabled: widget.enabled,
                style: theme.subtitle1.textStyle
                    .copyWith(color: theme.textBasicColor),
                decoration: MaterialDesign.InputDecoration(
                  hintText: widget.hint,
                  hintStyle: theme.paragraph1.textStyle.copyWith(
                      color: (widget.enabled)
                          ? theme.textHintColor
                          : theme.textDisabledColor),
                  filled: true,
                  fillColor: backgroundColor,
                  prefixIcon: (widget.icon != null &&
                          themeData.iconPosition == EqPositioning.left)
                      ? Icon(widget.icon,
                          color: (disabled)
                              ? theme.textDisabledColor
                              : theme.textHintColor)
                      : null,
                  suffixIcon: (widget.icon != null &&
                          themeData.iconPosition == EqPositioning.right)
                      ? Icon(widget.icon,
                          color: (disabled)
                              ? theme.textDisabledColor
                              : theme.textHintColor)
                      : null,
                  contentPadding: padding,
                  border: MaterialDesign.OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor, width: 1.0),
                    borderRadius: borderRadius,
                  ),
                  enabledBorder: MaterialDesign.OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor, width: 1.0),
                    borderRadius: borderRadius,
                  ),
                  focusedBorder: MaterialDesign.OutlineInputBorder(
                    borderSide:
                        BorderSide(color: focusedBorderColor, width: 2.0),
                    borderRadius: borderRadius,
                  ),
                  disabledBorder: MaterialDesign.OutlineInputBorder(
                    borderSide:
                        BorderSide(color: disabledBorderColor, width: 1.0),
                    borderRadius: borderRadius,
                  ),
                  errorBorder: MaterialDesign.OutlineInputBorder(
                    borderSide: BorderSide(color: errorBorderColor, width: 1.0),
                    borderRadius: borderRadius,
                  ),
                  focusedErrorBorder: MaterialDesign.OutlineInputBorder(
                    borderSide: BorderSide(color: errorBorderColor, width: 2.0),
                    borderRadius: borderRadius,
                  ),
                ),
              ),
            ),
          ),
        ),
        if (!errored && widget.description != null) ...[
          SizedBox(height: 4.0),
          EqText.paragraph2(
            widget.description,
            style: TextStyle(color: theme.textHintColor),
          ),
        ],
        if (errored) ...[
          SizedBox(height: 4.0),
          EqText.paragraph2(
            widget.error,
            state: TextState.danger,
          ),
        ],
      ],
    );
  }
}
