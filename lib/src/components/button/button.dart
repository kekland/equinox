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
  final Widget label;

  /// A leading widget. Will be placed on the left.
  final Widget leading;

  /// A trailing widget. Will be placed on the right.
  final Widget trailing;

  /// Width of the separator between [label] and [leading], [trailing].
  final double separatorWidth;

  /// Padding to use inside the button.
  final EdgeInsets padding;

  /// Alignment of items in the button.
  final MainAxisAlignment itemAlignment;

  /// Color to use for the background.
  final Color backgroundColor;

  /// Color to use for the border.
  final Color borderColor;

  /// Color to use for the foreground.
  final Color foregroundColor;

  /// Whether this button should fill the entire allowed width.
  final bool fluid;

  const EqButton({
    Key key,
    @required this.label,
    @required this.onTap,
    this.size = EqWidgetSize.medium,
    this.status,
    this.appearance = EqWidgetAppearance.filled,
    this.shape = EqWidgetShape.rectangle,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.leading,
    this.trailing,
    this.separatorWidth = 16.0,
    this.itemAlignment = MainAxisAlignment.spaceAround,
    this.padding,
    this.fluid = false,
  }) : super(key: key);

  /// Automatically sets the [appearance] to be `WidgetAppearance.filled`.
  const EqButton.filled({
    Key key,
    @required this.label,
    @required this.onTap,
    this.size = EqWidgetSize.medium,
    this.status,
    this.shape = EqWidgetShape.rectangle,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.leading,
    this.trailing,
    this.separatorWidth = 16.0,
    this.itemAlignment = MainAxisAlignment.spaceAround,
    this.padding,
    this.fluid = false,
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
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.leading,
    this.trailing,
    this.separatorWidth = 16.0,
    this.itemAlignment = MainAxisAlignment.spaceAround,
    this.padding,
    this.fluid = false,
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
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.leading,
    this.trailing,
    this.separatorWidth = 16.0,
    this.itemAlignment = MainAxisAlignment.spaceAround,
    this.padding,
    this.fluid = false,
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

    list = [
      if (widget.leading != null) ...[
        widget.leading,
        SizedBox(width: widget.separatorWidth),
      ],
      Flexible(child: widget.label),
      if (widget.trailing != null) ...[
        SizedBox(width: widget.separatorWidth),
        widget.trailing,
      ],
    ];

    return StaticStyle(
      inheritFromParent: false,
      data: style.style.fork()
        ..inject(
          StyleData(
            {
              'icon-color': widget.foregroundColor ??
                  style.get(
                    generateSelector([...selectorStateBase, 'text-color']),
                  ),
              'icon-size': style.get(
                generateSelector(['button-text', widget.size, 'font-size']),
              ),
            },
          ),
        ),
      child: AnimatedDefaultTextStyle(
        duration: style.get('minor-animation-duration'),
        curve: style.get('minor-animation-curve'),
        style: TextStyle(
          fontSize: style
              .get(generateSelector(['button-text', widget.size, 'font-size'])),
          fontWeight: style.get('button-text-font-weight'),
          fontFamily: style.get('button-text-font-family'),
          color: widget.foregroundColor ??
              style.get(generateSelector([...selectorStateBase, 'text-color'])),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: widget.itemAlignment,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: list,
        ),
      ),
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

    return SizedBox(
      width: (widget.fluid)? double.infinity : null,
      child: OutlinedWidget(
        outlined: outlined,
        borderRadius: BorderRadius.all(EqWidgetShapeUtils.getRadius(
          style: style.style,
          shape: widget.shape,
        )),
        child: AnimatedContainer(
          duration: style.get('minor-animation-duration'),
          curve: style.get('minor-animation-curve'),
          decoration: BoxDecoration(
            color: widget.backgroundColor ?? selectorBackgroundColor,
            borderRadius: BorderRadius.all(EqWidgetShapeUtils.getRadius(
              style: style.style,
              shape: widget.shape,
            )),
            border: Border.all(
              width: style.get(
                generateSelector([...selectorBase, 'border-width']),
              ),
              color: widget.borderColor ??
                  style.get(
                    generateSelector([...selectorStateBase, 'border-color']),
                  ),
            ),
          ),
          child: OutlinedGestureDetector(
            onTap: widget.onTap,
            onOutlineChange: (v) => setState(() => outlined = v),
            child: Padding(
              padding: widget.padding ??
                  style.get(
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
      ),
    );
  }
}
