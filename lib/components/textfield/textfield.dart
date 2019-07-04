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
  final IconPositioning iconPosition;

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
    this.iconPosition = IconPositioning.left,
    this.label,
    this.description,
  }) : super(key: key);
  @override
  _EqTextFieldState createState() => _EqTextFieldState();
}

class _EqTextFieldState extends State<EqTextField> {
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

  @override
  Widget build(BuildContext context) {
    var theme = EqTheme.of(context);
    var borderRadius = WidgetShapeUtils.getMultiplier(shape: widget.shape) *
        theme.borderRadius;

    var errored = (widget.error != null);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (widget.label != null) ...[
          Text(
            widget.label.toUpperCase(),
            style: theme.label.textStyle.copyWith(color: theme.textHintColor),
          ),
          SizedBox(height: 4.0),
        ],
        TextField(
          controller: widget.controller,
          cursorColor: _getFocusedBorderColor(theme),
          onTap: widget.onTap,
          onEditingComplete: widget.onEditingComplete,
          onChanged: widget.onChanged,
          onSubmitted: widget.onSubmitted,
          enabled: widget.enabled,
          style:
              theme.subtitle1.textStyle.copyWith(color: theme.textBasicColor),
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: theme.paragraph1.textStyle.copyWith(
                color: (widget.enabled)
                    ? theme.textHintColor
                    : theme.textDisabledColor),
            filled: true,
            fillColor: theme.backgroundBasicColors.color2,
            prefixIcon: (widget.icon != null &&
                    widget.iconPosition == IconPositioning.left)
                ? Icon(widget.icon, color: theme.textHintColor)
                : null,
            suffixIcon: (widget.icon != null &&
                    widget.iconPosition == IconPositioning.right)
                ? Icon(widget.icon, color: theme.textHintColor)
                : null,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: _getBorderColor(theme), width: 1.0),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: _getBorderColor(theme), width: 1.0),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: _getFocusedBorderColor(theme), width: 2.0),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: theme.borderBasicColors.color3, width: 1.0),
              borderRadius: BorderRadius.circular(borderRadius),
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
