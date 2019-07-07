import 'package:equinox/equinox.dart';
import 'package:equinox/equinox_internal.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart' as MaterialDesign;

class EqCheckbox extends StatefulWidget {
  final bool value;
  final String description;
  final WidgetStatus status;
  final WidgetShape shape;
  final Positioning descriptionPosition;
  final void Function(bool) onChanged;

  const EqCheckbox({
    Key key,
    @required this.value,
    @required this.onChanged,
    this.description,
    this.status,
    this.shape = WidgetShape.rectangle,
    this.descriptionPosition = Positioning.right,
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

  Color _getFillColor(EqThemeData theme) {
    if (widget.onChanged == null) return theme.backgroundBasicColors.color2;

    var filledColor = (this.widget.status != null)
        ? theme.getColorsForStatus(status: widget.status).shade500
        : theme.primary.shade500;

    if (this.widget.value == null || this.widget.value) {
      return filledColor;
    } else {
      if (this.widget.status != null) {
        return theme
            .getColorsForStatus(status: widget.status)
            .shade500
            .withOpacity(0.125);
      } else {
        return theme.backgroundBasicColors.color3;
      }
    }
  }

  Color _getBorderColor(EqThemeData theme) {
    if (widget.onChanged == null) return theme.borderBasicColors.color3;

    return (this.widget.status != null)
        ? theme.getColorsForStatus(status: widget.status).shade500
        : theme.borderBasicColors.color4;
  }

  Color _getIconColor(EqThemeData theme) {
    if (widget.onChanged == null) return theme.textDisabledColor;
    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    var theme = EqTheme.of(context);
    var borderRadius = theme.borderRadius *
        WidgetShapeUtils.getMultiplier(shape: widget.shape);

    var borderColor = _getBorderColor(theme);

    var fillColor = _getFillColor(theme);

    var list = <Widget>[];
    var description = widget.description != null
        ? Text(
            widget.description,
            style: theme.subtitle2.textStyle
                .copyWith(color: theme.textBasicColor, height: 1.0),
          )
        : null;

    if (description != null && widget.descriptionPosition == Positioning.left) {
      list.addAll([
        description,
        SizedBox(width: 8.0),
      ]);
    }

    list.add(OutlinedWidget(
      outlined: outlined,
      predefinedSize: Size(24.0, 24.0),
      borderRadius: BorderRadius.circular(borderRadius),
      child: AnimatedContainer(
        duration: theme.minorAnimationDuration,
        curve: theme.minorAnimationCurve,
        width: 24.0,
        height: 24.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: fillColor,
          border: Border.all(color: borderColor, width: 1.0),
        ),
        child: MaterialDesign.Material(
          type: MaterialDesign.MaterialType.transparency,
          child: Center(
            child: (widget.value == null)
                ? Icon(EvaIcons.minus, color: _getIconColor(theme), size: 16.0)
                : (widget.value)
                    ? Icon(EvaIcons.checkmark,
                        color: _getIconColor(theme), size: 16.0)
                    : SizedBox(),
          ),
        ),
      ),
    ));

    if (description != null &&
        widget.descriptionPosition == Positioning.right) {
      list.addAll([
        SizedBox(width: 8.0),
        description,
      ]);
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
