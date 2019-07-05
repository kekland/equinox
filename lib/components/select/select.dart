import 'dart:math';

import 'package:eva_design_flutter/components/global/internal_card.dart';
import 'package:eva_design_flutter/components/global/vertical_rectangle_clipper.dart';
export 'package:eva_design_flutter/components/select/select_item.dart';
import 'package:eva_design_flutter/eva_design_flutter.dart';
import 'package:flutter/material.dart';

class EqSelect<T> extends StatefulWidget {
  final List<EqSelectItem<T>> items;
  final void Function(T) onSelect;
  final String label;
  final String hint;
  final String description;
  final IconData icon;
  final WidgetShape shape;
  final WidgetStatus status;
  final int selectedIndex;

  const EqSelect({
    Key key,
    @required this.items,
    @required this.onSelect,
    @required this.hint,
    this.label,
    this.description,
    this.icon,
    this.shape = WidgetShape.rectangle,
    this.status,
    this.selectedIndex,
  }) : super(key: key);

  @override
  _EqSelectState<T> createState() => _EqSelectState<T>();
}

class _EqSelectState<T> extends State<EqSelect>
    with SingleTickerProviderStateMixin {
  int selectedIndex;
  bool outlined = false;
  OverlayEntry _overlayEntry;
  final LayerLink _layerLink = LayerLink();

  AnimationController animationController;
  Animation<double> animation;
  Duration animationDuration;

  didChangeDependencies() {
    super.didChangeDependencies();
    var theme = EqTheme.of(context);
    animationDuration = EqTheme.of(context).minorAnimationDuration;

    if (animationController != null) {
      animationController.duration = animationDuration;
    } else {
      animationController =
          AnimationController(vsync: this, duration: animationDuration);
    }
    animation = CurvedAnimation(
        parent: animationController, curve: theme.minorAnimationCurve);
  }

  dispose() {
    animationController.dispose();
    super.dispose();
  }

  initState() {
    super.initState();
    selectedIndex = widget.selectedIndex ?? null;
  }

  Color _getBorderColor(EqThemeData theme) {
    return (widget.status != null)
        ? theme.getColorsForStatus(status: widget.status).shade500
        : theme.borderBasicColors.color3;
  }

  Color _getFocusedBorderColor(EqThemeData theme) {
    return (widget.status != null)
        ? theme.getColorsForStatus(status: widget.status).shade500
        : theme.primary.shade500;
  }

  showOverlay() {
    if (this._overlayEntry == null) {
      this._overlayEntry = createOverlay();
      Overlay.of(context).insert(this._overlayEntry);
      animationController.forward();
      setState(() {});
    }
  }

  hideOverlay() {
    if (this._overlayEntry != null) {
      animationController.reverse();

      Future.delayed(animationDuration, () {
        if (!mounted) return;

        this._overlayEntry.remove();
        this._overlayEntry = null;
        setState(() {});
      });
    }
  }

  toggleOverlay() {
    if (this._overlayEntry == null)
      showOverlay();
    else
      hideOverlay();
  }

  bool get _isOverlayOpen => _overlayEntry != null;

  OverlayEntry createOverlay() {
    RenderBox renderBox = context.findRenderObject();
    var size = renderBox.size;
    var theme = EqTheme.of(context);
    double verticalOffset = size.height - 2.0;
    if (widget.description != null)
      verticalOffset -= theme.paragraph2.lineHeight + 4.0;
    if (widget.label != null) verticalOffset -= theme.label.lineHeight + 6.0;
    var borderRadius = theme.borderRadius *
        WidgetShapeUtils.getMultiplier(shape: widget.shape);
    return OverlayEntry(
        builder: (context) => Positioned(
              width: size.width,
              child: CompositedTransformFollower(
                showWhenUnlinked: false,
                link: this._layerLink,
                offset: Offset(0.0, verticalOffset),
                child: AnimatedBuilder(
                  animation: animation,
                  builder: (context, _) => EqInternalCard(
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(borderRadius)),
                        child: SizeTransition(
                          axis: Axis.vertical,
                          sizeFactor: animation,
                          child: ListView(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            children: widget.items.map((item) {
                              int index = widget.items.indexOf(item);
                              return EqListItem(
                                title: item.title,
                                subtitle: item.subtitle,
                                icon: item.icon,
                                onTap: () {
                                  widget.onSelect(item.value);
                                  setState(() => selectedIndex = index);
                                  hideOverlay();
                                },
                                status: widget.status,
                                active: index == selectedIndex,
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    var theme = EqTheme.of(context);
    var borderRadius = WidgetShapeUtils.getMultiplier(shape: widget.shape) *
        theme.borderRadius;

    var borderRadiusModified = BorderRadius.vertical(
      top: Radius.circular(borderRadius),
      bottom: (!_isOverlayOpen) ? Radius.circular(borderRadius) : Radius.zero,
    );

    var borderRadiusModifiedOutline = BorderRadius.vertical(
      top: Radius.circular(borderRadius),
      bottom: (!_isOverlayOpen)
          ? Radius.circular(borderRadius)
          : Radius.circular(theme.borderRadius),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (widget.label != null) ...[
          Text(
            widget.label.toUpperCase(),
            style: theme.label.textStyle.copyWith(color: theme.textHintColor),
          ),
          SizedBox(height: 6.0),
        ],
        OutlinedGestureDetector(
          onOutlineChange: (v) => setState(() => outlined = v),
          onTap: toggleOverlay,
          child: OutlinedWidget(
            outlined: outlined || (_overlayEntry != null),
            borderRadius: borderRadiusModifiedOutline,
            child: CompositedTransformTarget(
              link: _layerLink,
              child: AnimatedContainer(
                duration: theme.minorAnimationDuration,
                curve: theme.minorAnimationCurve,
                decoration: BoxDecoration(
                  borderRadius: borderRadiusModified,
                  color: theme.backgroundBasicColors.color2,
                  border: Border.all(
                    width: 1.0,
                    color: _isOverlayOpen
                        ? _getFocusedBorderColor(theme)
                        : _getBorderColor(theme),
                  ),
                ),
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(
                  left: 18.0,
                  right: 12.0,
                  top: 8.0,
                  bottom: 8.0,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        selectedIndex != null
                            ? widget.items[selectedIndex].title
                            : widget.hint,
                        style: (selectedIndex != null)
                            ? theme.subtitle1.textStyle
                            : theme.paragraph1.textStyle.copyWith(
                                color: theme.textHintColor,
                              ),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    AnimatedBuilder(
                      animation: animation,
                      builder: (context, _) {
                        return Transform.rotate(
                          angle: (animation.value) * pi,
                          child: Icon(EvaIcons.chevronDown,
                              color: theme.textHintColor),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (widget.description != null) ...[
          SizedBox(height: 4.0),
          Text(
            widget.description,
            style:
                theme.paragraph2.textStyle.copyWith(color: theme.textHintColor),
          ),
        ],
      ],
    );
  }
}
