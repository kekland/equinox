import 'package:eva_design_flutter/eva_design_flutter.dart';
import 'package:flutter/material.dart';

class EqTextField extends StatefulWidget {
  final WidgetShape shape;
  final WidgetStatus status;
  final String error;
  final String hint;
  final String label;
  final String description;
  final bool enabled;
  final TextEditingController controller;
  final void Function() onTap;
  final void Function(String) onChanged;
  final void Function(String) onSubmitted;
  final void Function() onEditingComplete;
  final IconData icon;
  final Positioning iconPosition;
  final bool obscureText;
  final TextInputType keyboardType;
  final FocusNode focusNode;

  const EqTextField({
    Key key,
    @required this.hint,
    this.shape = WidgetShape.rectangle,
    this.status,
    this.error,
    this.enabled = true,
    this.controller,
    this.onTap,
    this.onChanged,
    this.onSubmitted,
    this.onEditingComplete,
    this.icon,
    this.iconPosition = Positioning.left,
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
  Color _getBorderColor(EqThemeData theme) {
    if (widget.error != null) {
      return theme.getColorsForStatus(status: WidgetStatus.danger).shade500;
    } else {
      return (widget.status != null)
          ? theme.getColorsForStatus(status: widget.status).shade500
          : theme.borderBasicColors.color3;
    }
  }

  Color _getFocusedBorderColor(EqThemeData theme) {
    if (widget.error != null) {
      return theme.getColorsForStatus(status: WidgetStatus.danger).shade500;
    } else {
      return (widget.status != null)
          ? theme.getColorsForStatus(status: widget.status).shade500
          : theme.primary.shade500;
    }
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
    var theme = EqTheme.of(context);
    var borderRadius = WidgetShapeUtils.getMultiplier(shape: widget.shape) *
        theme.borderRadius;

    var errored = (widget.error != null);
    var disabled = !(widget.enabled);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (widget.label != null) ...[
          Text(
            widget.label.toUpperCase(),
            style: theme.label.textStyle.copyWith(color: theme.textHintColor),
          ),
          SizedBox(height: 6.0),
        ],
        GestureDetector(
          onTapDown:
              (widget.enabled) ? (_) => setState(() => outlined = true) : null,
          child: OutlinedWidget(
            outlined: outlined,
            borderRadius: BorderRadius.circular(borderRadius),
            child: TextField(
              focusNode: focusNode,
              obscureText: widget.obscureText,
              keyboardType: widget.keyboardType,
              controller: widget.controller,
              cursorColor: _getFocusedBorderColor(theme),
              onTap: widget.onTap,
              onEditingComplete: widget.onEditingComplete,
              onChanged: widget.onChanged,
              onSubmitted: widget.onSubmitted,
              enabled: widget.enabled,
              style: theme.subtitle1.textStyle
                  .copyWith(color: theme.textBasicColor),
              decoration: InputDecoration(
                hintText: widget.hint,
                hintStyle: theme.paragraph1.textStyle.copyWith(
                    color: (widget.enabled)
                        ? theme.textHintColor
                        : theme.textDisabledColor),
                filled: true,
                fillColor: theme.backgroundBasicColors.color2,
                prefixIcon: (widget.icon != null &&
                        widget.iconPosition == Positioning.left)
                    ? Icon(widget.icon,
                        color: (disabled)
                            ? theme.textDisabledColor
                            : theme.textHintColor)
                    : null,
                suffixIcon: (widget.icon != null &&
                        widget.iconPosition == Positioning.right)
                    ? Icon(widget.icon,
                        color: (disabled)
                            ? theme.textDisabledColor
                            : theme.textHintColor)
                    : null,
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 12.0),
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: _getBorderColor(theme), width: 1.0),
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: _getBorderColor(theme), width: 1.0),
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: _getFocusedBorderColor(theme), width: 2.0),
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: theme.borderBasicColors.color3, width: 1.0),
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
            ),
          ),
        ),
        if (!errored && widget.description != null) ...[
          SizedBox(height: 4.0),
          Text(
            widget.description,
            style:
                theme.paragraph2.textStyle.copyWith(color: theme.textHintColor),
          ),
        ],
        if (errored) ...[
          SizedBox(height: 4.0),
          Text(
            widget.error,
            style: theme.paragraph2.textStyle
                .copyWith(color: theme.danger.shade500),
          ),
        ],
      ],
    );
  }
}
