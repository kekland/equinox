import 'package:equinox/equinox.dart';
export 'package:equinox/src/components/icon_button/icon_button_theme.dart';
import 'package:equinox/src/equinox_internal.dart';
import 'package:flutter/widgets.dart';

/// This widget is used to display a button without a label.
/// Customize this using [EqIconButtonThemeData].
class EqIconButton extends StatefulWidget {
  /// Controls the size of the button
  final EqWidgetSize size;

  /// Controls the colors.
  final EqWidgetStatus status;

  /// If provided, overwrites the color set by [status] in [EqWidgetAppearance.ghost] and
  /// [EqWidgetAppearance.outline] appearances.
  final Color color;

  /// Controls the appearance of the widget.
  final EqWidgetAppearance appearance;

  /// Controls the border radius.
  final EqWidgetShape shape;

  /// Method is called when user taps on the button. Can be null to disable this button.
  final VoidCallback onTap;

  /// Icon to display.
  final IconData icon;

  const EqIconButton({
    Key key,
    @required this.icon,
    @required this.onTap,
    this.size = EqWidgetSize.medium,
    this.status = EqWidgetStatus.primary,
    this.appearance = EqWidgetAppearance.filled,
    this.shape = EqWidgetShape.round,
    this.color,
  }) : super(key: key);

  @override
  _EqIconButtonState createState() => _EqIconButtonState();
}

class _EqIconButtonState extends State<EqIconButton> {
  bool outlined = false;

  EqIconButtonThemeData getThemeData(BuildContext context) {
    final theme = EqTheme.of(context);
    EqIconButtonThemeData themeData =
        theme.defaultIconButtonTheme ?? EqIconButtonThemeData();

    return themeData.copyWith(
      appearance: widget.appearance,
      color: widget.color,
      status: widget.status,
      shape: widget.shape,
      size: widget.size,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = EqTheme.of(context);
    final themeData = getThemeData(context);
    final disabled = widget.onTap == null;

    final border = themeData.getBorder(theme: theme, disabled: disabled);
    final padding = themeData.getPadding(theme: theme);
    final borderRadius = themeData.getBorderRadius(theme: theme);
    final fillColor = themeData.getFillColor(theme: theme, disabled: disabled);
    final size = themeData.getIconSize(theme: theme);
    final iconColor = themeData.getIconColor(theme: theme, disabled: disabled);

    return OutlinedWidget(
      outlined: outlined,
      borderRadius: borderRadius,
      clipInner: widget.appearance != EqWidgetAppearance.ghost,
      predefinedSize: Size.square(padding.horizontal + size),
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
            child: Icon(
              widget.icon,
              color: iconColor,
              size: size,
            ),
          ),
        ),
      ),
    );
  }
}
