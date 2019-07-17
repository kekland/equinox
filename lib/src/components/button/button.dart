import 'package:equinox/equinox.dart';
import 'package:equinox/src/equinox_internal.dart';
import 'package:flutter/widgets.dart';

export 'package:equinox/src/components/button/button_style.dart';

/// A widget that displays a Eva Design styled button. Can be deeply customized using
/// [EqButtonThemeData] or by passing `defaultButtonTheme` in `EquinoxApp`'s theme.
/// Theme that is set in `EquinoxApp` will be merged with the closest [EqButtonTheme] widget's theme,
/// with prevalence to the latter, and then combined with this butotn's settings.
class EqButton extends StatefulWidget {
  /// Controls the size of the widget.
  final EqWidgetSize size;

  /// Controls the status - and color of the widget.
  final EqWidgetStatus status;

  /// Controls the appearance of the button. It can be either filled, outlined, or ghost. Will overwrite the value set by the theme.
  final EqWidgetAppearance appearance;

  /// Controls the BorderRadius of the button. Will overwrite the value set by the theme.
  final EqWidgetShape shape;

  /// Method that is called when user presses the button. Button will become disabled if `null` is passed;
  final VoidCallback onTap;

  /// Text to display inside of the button. Can be styled using [EqButtonThemeData].
  final String label;

  /// Icon to display inside of the button. Position is controlled by [iconPosition]. Has the same color as [label].
  final IconData icon;

  /// Sets the position of the icon. Will overwrite the value set by the theme.
  final EqPositioning iconPosition;

  /// Color to use for the background.
  final Color backgroundColor;

  /// Color to use for the foreground.
  final Color foregroundColor;

  const EqButton({
    Key key,
    @required this.label,
    @required this.onTap,
    this.size = EqWidgetSize.medium,
    this.status,
    this.appearance = EqWidgetAppearance.filled,
    this.shape = EqWidgetShape.rectangle,
    this.icon,
    this.iconPosition = EqPositioning.left,
    this.backgroundColor,
    this.foregroundColor,
  }) : super(key: key);

  /// Automatically sets the [appearance] to be `WidgetAppearance.filled`.
  const EqButton.filled({
    Key key,
    @required this.label,
    @required this.onTap,
    this.size = EqWidgetSize.medium,
    this.status,
    this.shape = EqWidgetShape.rectangle,
    this.icon,
    this.iconPosition = EqPositioning.left,
    this.backgroundColor,
    this.foregroundColor,
  })  : this.appearance = EqWidgetAppearance.filled,
        super(key: key);

  /// Automatically sets the [appearance] to be `WidgetAppearance.outline`.
  const EqButton.outline({
    Key key,
    @required this.label,
    @required this.onTap,
    this.size = EqWidgetSize.medium,
    this.status,
    this.shape = EqWidgetShape.rectangle,
    this.icon,
    this.iconPosition = EqPositioning.left,
    this.backgroundColor,
    this.foregroundColor,
  })  : this.appearance = EqWidgetAppearance.outline,
        super(key: key);

  /// Automatically sets the [appearance] to be `WidgetAppearance.ghost`.
  const EqButton.ghost({
    Key key,
    @required this.label,
    @required this.onTap,
    this.size = EqWidgetSize.medium,
    this.status,
    this.shape = EqWidgetShape.rectangle,
    this.icon,
    this.iconPosition = EqPositioning.left,
    this.backgroundColor,
    this.foregroundColor,
  })  : this.appearance = EqWidgetAppearance.ghost,
        super(key: key);

  @override
  _EqButtonState createState() => _EqButtonState();
}

class _EqButtonState extends State<EqButton> {
  bool outlined = false;

  Widget _buildBody(BuildContext context) {
    var list = <Widget>[];

    final style = StaticStyle.of(context);
    final disabled = widget.onTap == null;
    final active = outlined;

    final selectorStateBase = [
      'button',
      widget.appearance,
      widget.status,
      (disabled) ? 'disabled' : (active) ? 'active' : null,
    ];

    final hasIcon =
        widget.icon != null && widget.iconPosition != EqPositioning.none;

    Text text = Text(
      widget.label.toUpperCase(),
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: style
            .get(generateSelector(['button-text', widget.size, 'font-size'])),
        fontWeight: style.get('button-text-font-weight'),
        fontFamily: style.get('button-text-font-family'),
        color: widget.foregroundColor ??
            style.get(generateSelector([...selectorStateBase, 'text-color'])),
      ),
    );

    if (hasIcon) {
      Widget icon = EqIcon(
        icon: widget.icon,
        size: style
            .get(generateSelector(['button-text', widget.size, 'font-size'])),
        color: widget.foregroundColor ??
            style.get(generateSelector([...selectorStateBase, 'text-color'])),
      );
      if (widget.iconPosition == EqPositioning.left) {
        list = [icon, SizedBox(width: 8.0), text];
      } else {
        list = [text, SizedBox(width: 8.0), icon];
      }
    } else {
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
    final style = StaticStyle.of(context);
    final disabled = widget.onTap == null;
    final active = outlined;

    final selectorBase = ['button', widget.appearance];
    final selectorSizeBase = ['button', widget.appearance, widget.size];
    final selectorStateBase = [
      'button',
      widget.appearance,
      widget.status,
      (disabled) ? 'disabled' : (active) ? 'active' : null,
    ];

    final selectorBackgroundColor =
        style.get(generateSelector([...selectorStateBase, 'background-color']));

    return OutlinedWidget(
      outlined: outlined,
      borderRadius: BorderRadius.all(EqWidgetShapeUtils.getRadius(
        style: style.style,
        shape: widget.shape,
      )),
      child: AnimatedContainer(
        duration: style.get('minor-animation-duration'),
        curve: style.get('minor-animation-curve'),
        decoration: BoxDecoration(
          color: (widget.appearance == EqWidgetAppearance.outline)
              ? selectorBackgroundColor
              : widget.backgroundColor ?? selectorBackgroundColor,
          borderRadius: BorderRadius.all(EqWidgetShapeUtils.getRadius(
            style: style.style,
            shape: widget.shape,
          )),
          border: Border.all(
            width: style.get(
              generateSelector([...selectorBase, 'border-width']),
            ),
            color: widget.backgroundColor ??
                style.get(
                  generateSelector([...selectorStateBase, 'border-color']),
                ),
          ),
        ),
        child: OutlinedGestureDetector(
          onTap: widget.onTap,
          onOutlineChange: (v) => setState(() => outlined = v),
          child: Padding(
            padding: style.get(
              generateSelector([...selectorSizeBase, 'padding']),
            ),
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
