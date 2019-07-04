import 'package:eva_design_flutter/eva_design_flutter.dart';
import 'package:flutter/material.dart';

class EqRadio extends StatefulWidget {
  final VoidCallback onSelected;
  final bool value;
  final String description;
  final WidgetStatus status;

  const EqRadio({
    Key key,
    @required this.onSelected,
    @required this.value,
    @required this.description,
    this.status,
  }) : super(key: key);
  @override
  _EqRadioState createState() => _EqRadioState();
}

class _EqRadioState extends State<EqRadio> {
  bool outlined = false;

  Color getBorderColor(EqThemeData theme) {
    var statusColor = theme.getColorsForStatus(status: widget.status).shade500;

    if (widget.status != null) return statusColor;

    return widget.value
        ? theme.primary.shade500
        : theme.borderBasicColors.color4;
  }

  Color getCircleColor(EqThemeData theme) {
    var statusColor = theme.getColorsForStatus(status: widget.status).shade500;

    return widget.value
        ? statusColor
        : Colors.transparent;
  }

  Color getBackgroundColor(EqThemeData theme) {
    if(widget.status != null) {
      return theme.getColorsForStatus(status: widget.status).shade500.withOpacity(0.125);
    }
    else {
      return theme.backgroundBasicColors.color3;
    }

  }

  @override
  Widget build(BuildContext context) {
    var theme = EqTheme.of(context);
    var borderRadius = 12.0;

    return OutlinedGestureDetector(
      onTap: widget.onSelected,
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
                color: getBackgroundColor(theme),
                border: Border.all(color: getBorderColor(theme), width: 1.0),
              ),
              child: Material(
                type: MaterialType.transparency,
                child: Center(
                  child: AnimatedContainer(
                    duration: theme.minorAnimationDuration,
                    curve: theme.minorAnimationCurve,
                    width: 16.0,
                    height: 16.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: getCircleColor(theme),
                    ),
                  ),
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
