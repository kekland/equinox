import 'package:equinox/equinox.dart';
export 'package:equinox/src/components/icon_button/icon_button_style.dart';
import 'package:equinox/src/equinox_internal.dart';
import 'package:flutter/widgets.dart';

/// This widget is used to display a button without a label.
/// Customize this using [EqIconButtonThemeData].
class EqIconButton extends StatefulWidget {
  /// Controls the size of the button
  final EqWidgetSize size;

  /// Controls the colors.
  final EqWidgetStatus status;

  /// If provided, overwrites the color set by [status] in [WidgetAppearance.ghost] and
  /// [WidgetAppearance.outline] appearances.
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
    this.status,
    this.appearance = EqWidgetAppearance.filled,
    this.shape = EqWidgetShape.round,
    this.color,
  }) : super(key: key);

  @override
  _EqIconButtonState createState() => _EqIconButtonState();
}

class _EqIconButtonState extends State<EqIconButton> {
  bool outlined = false;

  @override
  Widget build(BuildContext context) {
    final style = StaticStyle.of(context);

    final active = outlined;
    final disabled = widget.onTap == null;

    final selectorBase = ['icon-button', widget.appearance];
    final selectorSizeBase = ['icon-button', widget.appearance, widget.size];
    final selectorStateBase = [
      'icon-button',
      widget.appearance,
      widget.status,
      (disabled) ? 'disabled' : (active) ? 'active' : null,
    ];

    return OutlinedWidget(
      outlined: outlined,
      borderRadius: BorderRadius.all(EqWidgetShapeUtils.getRadius(
        style: style.style,
        shape: widget.shape,
      )),
      clipInner: widget.appearance != EqWidgetAppearance.ghost,
      child: AnimatedContainer(
        duration: style.get('minor-animation-duration'),
        curve: style.get('minor-animation-curve'),
        decoration: BoxDecoration(
          color: style.get(
              generateSelector([...selectorStateBase, 'background-color'])),
          borderRadius: BorderRadius.all(EqWidgetShapeUtils.getRadius(
            style: style.style,
            shape: widget.shape,
          )),
          border: Border.all(
            width: style.get(
              generateSelector([...selectorBase, 'border-width']),
            ),
            color: style.get(
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
            child: Icon(
              widget.icon,
              size: style.get(
                  generateSelector(['icon-button', widget.size, 'icon-size'])),
              color: style
                  .get(generateSelector([...selectorStateBase, 'icon-color'])),
            ),
          ),
        ),
      ),
    );
  }
}
