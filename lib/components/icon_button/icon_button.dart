export 'package:equinox/components/button/button_icon_positioning.dart';
import 'package:equinox/components/global/outlined_gesture_detector.dart';
import 'package:equinox/equinox.dart';
import 'package:flutter/material.dart' as MaterialDesign;
import 'package:flutter/widgets.dart';

class EqIconButton extends StatefulWidget {
  final WidgetSize size;
  final WidgetStatus status;
  final Color color;
  final WidgetAppearance appearance;
  final WidgetShape shape;
  final VoidCallback onTap;
  final IconData icon;

  const EqIconButton({
    Key key,
    @required this.icon,
    @required this.onTap,
    this.size = WidgetSize.medium,
    this.status = WidgetStatus.primary,
    this.appearance = WidgetAppearance.filled,
    this.shape = WidgetShape.round,
    this.color,
  }) : super(key: key);

  @override
  _EqIconButtonState createState() => _EqIconButtonState();
}

class _EqIconButtonState extends State<EqIconButton> {
  bool outlined = false;
  TextStyle _getTextStyle(EqThemeData theme) {
    switch (this.widget.size) {
      case WidgetSize.giant:
        return theme.buttonGiant.textStyle;
      case WidgetSize.large:
        return theme.buttonLarge.textStyle;
      case WidgetSize.medium:
        return theme.buttonMedium.textStyle;
      case WidgetSize.small:
        return theme.buttonSmall.textStyle;
      case WidgetSize.tiny:
        return theme.buttonTiny.textStyle;
      default:
        return theme.buttonMedium.textStyle;
    }
  }

  Color _getTextColor(EqThemeData theme) {
    if (this.widget.onTap == null) return theme.textDisabledColor;
    if (this.widget.appearance == WidgetAppearance.filled)
      return widget.color ?? theme.textControlColor;
    else
      return widget.color ??
          theme.getColorsForStatus(status: widget.status).shade500;
  }

  Color _getFillColor(EqThemeData theme) {
    if (this.widget.onTap == null) return theme.backgroundBasicColors.color3;
    return (widget.appearance == WidgetAppearance.filled)
        ? theme.getColorsForStatus(status: widget.status).shade500
        : MaterialDesign.Colors.transparent;
  }

  Color _getOutlineColor(EqThemeData theme) {
    if (this.widget.onTap == null) return theme.backgroundBasicColors.color4;
    return theme.getColorsForStatus(status: widget.status).shade500;
  }

  @override
  Widget build(BuildContext context) {
    var theme = EqTheme.of(context);
    var fillColor = _getFillColor(theme);

    var borderRadius = theme.borderRadius *
        WidgetShapeUtils.getMultiplier(shape: widget.shape);
    var border = (widget.appearance == WidgetAppearance.outline)
        ? Border.all(
            color: _getOutlineColor(theme),
            width: 2.0,
          )
        : null;

    var padding = WidgetSizeUtils.getPadding(size: widget.size);
    padding = EdgeInsets.all(padding.vertical / 2.0);

    return OutlinedWidget(
      outlined: outlined,
      borderRadius: BorderRadius.circular(borderRadius),
      predefinedSize: Size.square(padding.horizontal + _getTextStyle(theme).fontSize + 2.0),
      child: AnimatedContainer(
        duration: theme.minorAnimationDuration,
        curve: theme.minorAnimationCurve,
        decoration: BoxDecoration(
          color: fillColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: border,
        ),
        child: OutlinedGestureDetector(
          onTap: widget.onTap,
          onOutlineChange: (v) => setState(() => outlined = v),
          child: Padding(
            padding: padding,
            child: Icon(
              widget.icon,
              color: _getTextColor(theme),
              size: _getTextStyle(theme).fontSize + 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
