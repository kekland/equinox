import 'package:equinox/equinox.dart';
import 'package:equinox/src/equinox_internal.dart';
import 'package:flutter/widgets.dart';

export 'package:equinox/src/components/toggle/toggle_theme.dart';

/// Toggle represents a bool value. [value] cannot be null, unlike [EqCheckbox].
class EqToggle extends StatefulWidget {
  /// The value of toggle. Cannot be null.
  final bool value;

  /// Status of the widget. Controls the color of the toggle.
  final EqWidgetStatus status;

  /// A description to put either on left or on the right of checkbox, controlled by [descriptionPosition].
  final String description;

  /// Controls the location of description.
  final EqPositioning descriptionPosition;

  /// A method to call when user presses the toggle. Passes the inverse of [value].
  /// If it is null, then toggle is disabled.
  final void Function(bool) onChanged;

  const EqToggle({
    Key key,
    @required this.value,
    @required this.onChanged,
    this.status,
    this.description,
    this.descriptionPosition = EqPositioning.left,
  }) : super(key: key);

  @override
  _EqToggleState createState() => _EqToggleState();
}

class _EqToggleState extends State<EqToggle>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  bool outlined = false;

  EqToggleThemeData getThemeData(BuildContext context) {
    final theme = EqTheme.of(context);
    EqToggleThemeData themeData =
        theme.defaultToggleTheme ?? EqToggleThemeData();

    return themeData.copyWith(
      status: widget.status,
      descriptionPosition: widget.descriptionPosition,
    );
  }

  didChangeDependencies() {
    super.didChangeDependencies();
    var theme = EqTheme.of(context);
    var animationDuration = EqTheme.of(context).minorAnimationDuration;

    if (animationController != null) {
      animationController.duration = animationDuration;
    } else {
      animationController =
          AnimationController(vsync: this, duration: animationDuration);
    }
    animation = CurvedAnimation(
        parent: animationController, curve: theme.minorAnimationCurve);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(EqToggle oldWidget) {
    if (oldWidget.value != widget.value) {
      if (widget.value) {
        animationController.forward();
      } else {
        animationController.reverse();
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  _onTap() {
    if (widget.value == null)
      widget.onChanged(true);
    else
      widget.onChanged(!widget.value);
  }

  @override
  Widget build(BuildContext context) {
    final theme = EqTheme.of(context);
    final themeData = getThemeData(context);
    final disabled = (widget.onChanged == null);

    final borderRadius = BorderRadius.circular(16.0);
    final borderColor =
        themeData.getBorderColor(theme: theme, disabled: disabled);
    final fillColor = themeData.getFillColor(
        theme: theme, disabled: disabled, selected: widget.value);
    final knobColor = themeData.getKnobColor(theme: theme, disabled: disabled);

    var list = <Widget>[];

    final toggle = OutlinedWidget(
      outlined: outlined,
      predefinedSize: Size(52.0, 32.0),
      borderRadius: borderRadius,
      child: AnimatedContainer(
        duration: theme.minorAnimationDuration,
        curve: theme.minorAnimationCurve,
        width: 52.0,
        height: 32.0,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: fillColor,
          border: Border.all(color: borderColor, width: 1.0),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          alignment: Alignment.centerLeft,
          child: AnimatedBuilder(
            animation: animation,
            builder: (context, _) => Transform.translate(
                  offset: Offset(18.0 * animation.value, 0.0),
                  child: Container(
                    width: 28.0,
                    height: 28.0,
                    decoration: BoxDecoration(
                      color: knobColor,
                      borderRadius: borderRadius,
                    ),
                  ),
                ),
          ),
        ),
      ),
    );

    if (widget.description != null &&
        themeData.descriptionPosition == EqPositioning.left) {
      list = [
        Text(
          widget.description,
          style: theme.subtitle2.textStyle
              .copyWith(color: theme.textBasicColor, height: 1.0),
        ),
        SizedBox(width: 8.0),
        toggle,
      ];
    }

    if (widget.description != null &&
        themeData.descriptionPosition == EqPositioning.right) {
      list = [
        toggle,
        SizedBox(width: 8.0),
        Text(
          widget.description,
          style: theme.subtitle2.textStyle
              .copyWith(color: theme.textBasicColor, height: 1.0),
        ),
      ];
    }

    return OutlinedGestureDetector(
      onTap: (widget.onChanged != null) ? _onTap : null,
      onOutlineChange: (v) => setState(() => outlined = v),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: list,
      ),
    );
  }
}
