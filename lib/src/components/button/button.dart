import 'package:equinox/equinox.dart';
import 'package:equinox/src/equinox_internal.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart' as MaterialDesign;

export 'package:equinox/src/components/button/button_theme.dart';
export 'package:equinox/src/components/button/button_theme_inherited.dart';

class EqButton extends StatefulWidget {
  final WidgetSize size;
  final WidgetStatus status;
  final WidgetAppearance appearance;
  final WidgetShape shape;
  final VoidCallback onTap;
  final String label;
  final IconData icon;
  final Positioning iconPosition;

  const EqButton({
    Key key,
    @required this.label,
    @required this.onTap,
    this.size,
    this.status,
    this.appearance,
    this.shape,
    this.icon,
    this.iconPosition = Positioning.left,
  }) : super(key: key);

  const EqButton.filled({
    Key key,
    @required this.label,
    @required this.onTap,
    this.size,
    this.status = WidgetStatus.primary,
    this.shape,
    this.icon,
    this.iconPosition,
  })  : this.appearance = WidgetAppearance.filled,
        super(key: key);

  const EqButton.outline({
    Key key,
    @required this.label,
    @required this.onTap,
    this.size,
    this.status = WidgetStatus.primary,
    this.shape,
    this.icon,
    this.iconPosition,
  })  : this.appearance = WidgetAppearance.outline,
        super(key: key);

  const EqButton.ghost({
    Key key,
    @required this.label,
    @required this.onTap,
    this.size,
    this.status = WidgetStatus.primary,
    this.shape,
    this.icon,
    this.iconPosition,
  })  : this.appearance = WidgetAppearance.ghost,
        super(key: key);

  @override
  _EqButtonState createState() => _EqButtonState();
}

class _EqButtonState extends State<EqButton> {
  bool outlined = false;

  EqButtonThemeData getThemeData(BuildContext context) {
    final theme = EqTheme.of(context);
    EqButtonThemeData themeData =
        theme.defaultButtonTheme ?? EqButtonThemeData();

    final inheritedTheme = EqButtonTheme.of(context);
    if (inheritedTheme != null) {
      themeData = themeData.merge(inheritedTheme);
    }

    return themeData.copyWith(
      size: widget.size,
      status: widget.status,
      appearance: widget.appearance,
      shape: widget.shape,
      iconPosition: widget.iconPosition,
    );
  }

  Widget _buildBody(BuildContext context) {
    var list = <Widget>[];

    final theme = EqTheme.of(context);
    final themeData = getThemeData(context);
    final disabled = widget.onTap == null;
    final hasIcon =
        widget.icon != null && widget.iconPosition != Positioning.none;

    final iconSize = themeData.getIconSize(theme: theme, disabled: disabled);
    final textColor = themeData.getTextColor(theme: theme, disabled: disabled);
    final textStyle = themeData.getTextStyle(theme: theme, disabled: disabled);

    Text text = Text(
      widget.label.toUpperCase(),
      textAlign: TextAlign.center,
      style: textStyle,
    );

    if (hasIcon) {
      Widget icon = Icon(
        widget.icon,
        size: iconSize,
        color: textColor,
      );
      if (widget.iconPosition == Positioning.left) {
        list = [icon, SizedBox(width: 8.0), text];
      } else {
        list = [text, SizedBox(width: 8.0), icon];
      }
    }
    else {
      list = [text];
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: list,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = EqTheme.of(context);
    final themeData = getThemeData(context);
    final disabled = widget.onTap == null;

    final fillColor = themeData.getFillColor(theme: theme, disabled: disabled);

    final padding = themeData.getPadding(theme: theme);
    final borderRadius = themeData.getBorderRadius(theme: theme);
    final border = themeData.getBorder(theme: theme, disabled: disabled);

    return OutlinedWidget(
      outlined: outlined,
      borderRadius: borderRadius,
      child: AnimatedContainer(
        duration: theme.minorAnimationDuration,
        curve: theme.minorAnimationCurve,
        decoration: BoxDecoration(
          color: fillColor,
          borderRadius: borderRadius,
          border: border,
        ),
        child: OutlinedGestureDetector(
          onTap: widget.onTap,
          onOutlineChange: (v) => setState(() => outlined = v),
          child: Padding(
            padding: padding,
            child: Center(
              widthFactor: 1.0,
              heightFactor: 1.0,
              child: _buildBody(context),
            ),
          ),
        ),
      ),
    );
  }
}
