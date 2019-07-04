import 'package:eva_design_flutter/eva_design_flutter.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class EqCheckbox extends StatelessWidget {
  final bool value;
  final String description;
  final WidgetStatus status;
  final WidgetShape shape;
  final void Function(bool) onChanged;

  _onTap() {
    if (value == null)
      onChanged(true);
    else
      onChanged(!value);
  }

  const EqCheckbox({
    Key key,
    @required this.value,
    @required this.onChanged,
    @required this.description,
    this.status,
    this.shape = WidgetShape.rectangle,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var theme = EqTheme.of(context);
    var borderRadius =
        theme.borderRadius * WidgetShapeUtils.getMultiplier(shape: shape);

    var filledColor = (this.status != null)
        ? theme.getColorsForStatus(status: status).shade500
        : theme.primary.shade500;
    var borderColor = (this.status != null)
        ? theme.getColorsForStatus(status: status).shade500
        : theme.borderBasicColors.color4;
    var fillColor = (this.value == null || this.value)
        ? filledColor
        : theme.backgroundBasicColors.color3;
    return GestureDetector(
      onTap: _onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AnimatedContainer(
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
              child: InkWell(
                onTap: _onTap,
                child: Center(
                  child: (value == null)
                      ? Icon(EvaIcons.minus, color: Colors.white, size: 16.0)
                      : (value)
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
              description,
              style: theme.subtitle2.textStyle
                  .copyWith(color: theme.textBasicColor, height: 1.0),
            ),
          )
        ],
      ),
    );
  }
}
