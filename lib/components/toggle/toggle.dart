import 'package:equinox/equinox.dart';
import 'package:equinox/equinox_internal.dart';
import 'package:flutter/widgets.dart';

class EqToggle extends StatefulWidget {
  final bool value;
  final WidgetStatus status;
  final String description;
  final Positioning descriptionPosition;
  final void Function(bool) onChanged;

  const EqToggle({
    Key key,
    @required this.value,
    @required this.onChanged,
    this.status,
    this.description,
    this.descriptionPosition = Positioning.left,
  }) : super(key: key);

  @override
  _EqToggleState createState() => _EqToggleState();
}

class _EqToggleState extends State<EqToggle>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  bool outlined = false;

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

  Color _getBorderColor(EqThemeData theme) {
    if (widget.onChanged == null) return theme.borderBasicColors.color3;
    return (this.widget.status != null)
        ? theme.getColorsForStatus(status: widget.status).shade500
        : theme.borderBasicColors.color4;
  }

  Color _getFillColor(EqThemeData theme) {
    if (widget.onChanged == null) return theme.backgroundBasicColors.color2;

    var filledColor = (this.widget.status != null)
        ? theme.getColorsForStatus(status: widget.status).shade500
        : theme.primary.shade500;
    if (this.widget.value) {
      return filledColor;
    } else {
      if (this.widget.status != null) {
        return theme
            .getColorsForStatus(status: widget.status)
            .shade500
            .withOpacity(0.125);
      } else {
        return theme.backgroundBasicColors.color3;
      }
    }
  }

  Color _getIconColor(EqThemeData theme) {
    if (widget.onChanged == null) return theme.textDisabledColor;

    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    var theme = EqTheme.of(context);
    var borderRadius = 16.0;

    var borderColor = _getBorderColor(theme);

    var fillColor = _getFillColor(theme);

    var list = <Widget>[];
    var description = widget.description != null
        ? Text(
            widget.description,
            style: theme.subtitle2.textStyle
                .copyWith(color: theme.textBasicColor, height: 1.0),
          )
        : null;

    if (description != null && widget.descriptionPosition == Positioning.left) {
      list.addAll([
        description,
        SizedBox(width: 8.0),
      ]);
    }

    list.add(OutlinedWidget(
      outlined: outlined,
      predefinedSize: Size(52.0, 32.0),
      borderRadius: BorderRadius.circular(borderRadius),
      child: AnimatedContainer(
        duration: theme.minorAnimationDuration,
        curve: theme.minorAnimationCurve,
        width: 52.0,
        height: 32.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
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
                      color: _getIconColor(theme),
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                  ),
                ),
          ),
        ),
      ),
    ));

    if (description != null &&
        widget.descriptionPosition == Positioning.right) {
      list.addAll([
        SizedBox(width: 8.0),
        description,
      ]);
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
