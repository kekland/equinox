import 'package:eva_design_flutter/components/global/outlined_gesture_detector.dart';
import 'package:eva_design_flutter/eva_design_flutter.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class EqCheckbox extends StatefulWidget {
  final bool value;
  final String description;
  final WidgetStatus status;
  final WidgetShape shape;
  final void Function(bool) onChanged;

  const EqCheckbox({
    Key key,
    @required this.value,
    @required this.onChanged,
    @required this.description,
    this.status,
    this.shape = WidgetShape.rectangle,
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
        return theme.borderBasicColors.color4;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = EqTheme.of(context);
    var borderRadius = theme.borderRadius *
        WidgetShapeUtils.getMultiplier(shape: widget.shape);

    var borderColor = (this.widget.status != null)
        ? theme.getColorsForStatus(status: widget.status).shade500
        : theme.borderBasicColors.color4;

    var fillColor = _getFillColor(theme);

    return OutlinedGestureDetector(
      onTap: _onTap,
      onOutlineChange: (v) => setState(() => outlined = v),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          OutlinedWidget(
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
              child: Material(
                type: MaterialType.transparency,
                child: Center(
                  child: (widget.value == null)
                      ? Icon(EvaIcons.minus, color: Colors.white, size: 16.0)
                      : (widget.value)
                          ? Icon(EvaIcons.checkmark,
                              color: Colors.white, size: 16.0)
                          : SizedBox(),
                ),
              ),
            ),
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: Text(
              widget.description,
              style: theme.subtitle2.textStyle
                  .copyWith(color: theme.textBasicColor, height: 1.0),
            ),
          )
        ],
      ),
    );
  }
}
