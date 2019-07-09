import 'package:equinox/equinox.dart';
import 'package:equinox/src/equinox_internal.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart' as MaterialDesign;

export 'package:equinox/src/components/button/button_theme.dart';

/// A widget that displays a Eva Design styled button. Can be deeply customized using
/// [EqButtonThemeData] or by passing `defaultButtonTheme` in `EquinoxApp`'s theme.
/// Theme that is set in `EquinoxApp` will be merged with the closest [EqButtonTheme] widget's theme,
/// with prevalence to the latter, and then combined with this butotn's settings.
class EqButton extends StatefulWidget {
  /// Controls the size of the widget. Will overwrite the value set by [EqButtonThemeData].
  final WidgetSize size;

  /// Controls the status - and color of the widget. Will overwrite the value set by [EqButtonThemeData].
  final WidgetStatus status;

  /// Controls the appearance of the button. It can be either filled, outlined, or ghost. Will overwrite the value set by [EqButtonThemeData].
  final WidgetAppearance appearance;
  
  /// Controls the BorderRadius of the button. Will overwrite the value set by [EqButtonThemeData].
  final WidgetShape shape;

  /// Method that is called when user presses the button. Button will become disabled if `null` is passed;
  final VoidCallback onTap;
  
  /// Text to display inside of the button. Can be styled using [EqButtonThemeData].
  final String label;

  /// Icon to display inside of the button. Position is controlled by [iconPosition]. Has the same color as [label].
  final IconData icon;

  /// Sets the position of the icon. Will overwrite the value set by [EqButtonThemeData].
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
    this.iconPosition,
  }) : super(key: key);

  /// Automatically sets the [appearance] to be `WidgetAppearance.filled`.
  const EqButton.filled({
    Key key,
    @required this.label,
    @required this.onTap,
    this.size,
    this.status,
    this.shape,
    this.icon,
    this.iconPosition,
  })  : this.appearance = WidgetAppearance.filled,
        super(key: key);

  /// Automatically sets the [appearance] to be `WidgetAppearance.outline`.
  const EqButton.outline({
    Key key,
    @required this.label,
    @required this.onTap,
    this.size,
    this.status,
    this.shape,
    this.icon,
    this.iconPosition,
  })  : this.appearance = WidgetAppearance.outline,
        super(key: key);

  /// Automatically sets the [appearance] to be `WidgetAppearance.ghost`.
  const EqButton.ghost({
    Key key,
    @required this.label,
    @required this.onTap,
    this.size,
    this.status,
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
