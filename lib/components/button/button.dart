export 'package:eva_design_flutter/components/button/button_appearance.dart';
import 'package:eva_design_flutter/eva_design_flutter.dart';
import 'package:flutter/material.dart' as MaterialDesign;
import 'package:flutter/widgets.dart';

class EqButton extends MaterialDesign.StatefulWidget {
  final WidgetSize size;
  final WidgetStatus status;
  final ButtonAppearance appearance;
  final WidgetShape shape;
  final VoidCallback onTap;
  final String label;

  const EqButton({
    Key key,
    @required this.label,
    @required this.onTap,
    this.size = WidgetSize.medium,
    this.status = WidgetStatus.primary,
    this.appearance = ButtonAppearance.filled,
    this.shape = WidgetShape.rectangle,
  }) : super(key: key);

  @override
  _EqButtonState createState() => _EqButtonState();
}

class _EqButtonState extends MaterialDesign.State<EqButton> {
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
    if (this.widget.appearance == ButtonAppearance.filled)
      return theme.textControlColor;
    else
      return theme.getColorsForStatus(status: widget.status).shade500;
  }

  Color _getFillColor(EqThemeData theme) {
    if (this.widget.onTap == null) return theme.backgroundBasicColors.color3;
    return (widget.appearance == ButtonAppearance.filled)
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
    var border = (widget.appearance == ButtonAppearance.outline)
        ? Border.all(
            color: _getOutlineColor(theme),
            width: 2.0,
          )
        : null;

    var padding = WidgetSizeUtils.getPadding(size: widget.size);
    var text = widget.label.toUpperCase();

    return AnimatedContainer(
      duration: theme.minorAnimationDuration,
      curve: theme.minorAnimationCurve,
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: border,
      ),
      child: MaterialDesign.Material(
        type: MaterialDesign.MaterialType.transparency,
        borderRadius: BorderRadius.circular(borderRadius),
        child: MaterialDesign.InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(borderRadius),
          child: Padding(
            padding: padding,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: _getTextStyle(theme).copyWith(color: _getTextColor(theme)),
            ),
          ),
        ),
      ),
    );
  }
}
