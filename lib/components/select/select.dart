import 'dart:math';

import 'package:equinox/equinox.dart';
import 'package:equinox/equinox_internal.dart';
import 'package:flutter/widgets.dart';

import 'package:equinox/components/select/select_overlay.dart';

export 'package:equinox/components/select/select_item.dart';

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
  bool openingFromBottom;

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
    hideOverlay(true);
    super.dispose();
  }

  initState() {
    super.initState();
    selectedIndex = widget.selectedIndex ?? null;
  }

  Color _getBorderColor(EqThemeData theme) {
    if (widget.onSelect == null) return theme.borderBasicColors.color4;
    return (widget.status != null)
        ? theme.getColorsForStatus(status: widget.status).shade500
        : theme.borderBasicColors.color3;
  }

  Color _getFocusedBorderColor(EqThemeData theme) {
    if (widget.onSelect == null) return theme.borderBasicColors.color4;
    return (widget.status != null)
        ? theme.getColorsForStatus(status: widget.status).shade500
        : theme.primary.shade500;
  }

  Color _getFillColor(EqThemeData theme) {
    if (widget.onSelect == null) return theme.backgroundBasicColors.color3;

    return theme.backgroundBasicColors.color2;
  }

  Color _getTextColor(EqThemeData theme) {
    if (widget.onSelect == null) return theme.textDisabledColor;
    return theme.textHintColor;
  }

  showOverlay() {
    if (this._overlayEntry == null) {
      this._overlayEntry = createOverlay();
      Overlay.of(context).insert(this._overlayEntry);
      animationController.forward();
      setState(() {});
    }
  }

  hideOverlay([bool forced = false]) {
    if (this._overlayEntry != null) {
      if(forced) {
        this._overlayEntry.remove();
        return;
      }
      animationController.reverse();

      Future.delayed(animationDuration, () {
        if (!mounted) return;

        this._overlayEntry.remove();
        this._overlayEntry = null;
        this.openingFromBottom = null;
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

    double containerHeight = size.height;
    if (widget.description != null)
      containerHeight -= theme.paragraph2.lineHeight + 4.0;

    if (widget.label != null) containerHeight -= theme.label.lineHeight + 6.0;

    double verticalOffset = containerHeight;
    var borderRadius = theme.borderRadius *
        WidgetShapeUtils.getMultiplier(shape: widget.shape);

    Size screen = MediaQuery.of(context).size;

    var height = 0.0;
    for (var item in widget.items) {
      height += item.caluclateHeight(theme);
    }

    var position = renderBox.localToGlobal(Offset.zero);

    var bottom = screen.height - position.dy - size.height;
    var top = position.dy;

    openingFromBottom = true;

    if (height > bottom && height < top) {
      verticalOffset = -height;
      openingFromBottom = false;
    } else if (height > bottom && height > top) {
      openingFromBottom = true;
      height = bottom - 16.0;
    }

    return OverlayEntry(
      builder: (context) => Positioned(
            width: size.width,
            child: CompositedTransformFollower(
              showWhenUnlinked: false,
              link: this._layerLink,
              offset: Offset(0.0, verticalOffset),
              child: Container(
                height: height,
                alignment: (openingFromBottom)
                    ? Alignment.topCenter
                    : Alignment.bottomCenter,
                child: EqSelectOverlay(
                  openingFromBottom: openingFromBottom,
                  animation: animation,
                  borderRadius: borderRadius,
                  items: widget.items,
                  onSelect: (index, item) {
                    widget.onSelect(item.value);
                    setState(() => selectedIndex = index);
                    hideOverlay();
                  },
                  selectedIndex: selectedIndex,
                  status: widget.status,
                  theme: theme,
                ),
              ),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var theme = EqTheme.of(context);
    var borderRadius = WidgetShapeUtils.getMultiplier(shape: widget.shape) *
        theme.borderRadius;

    var normalRadius = Radius.circular(borderRadius);
    var topRadius = (!_isOverlayOpen)
        ? normalRadius
        : (!openingFromBottom) ? Radius.zero : normalRadius;
    var bottomRadius = (!_isOverlayOpen)
        ? normalRadius
        : (!openingFromBottom) ? normalRadius : Radius.zero;

    var borderRadiusModified = BorderRadius.vertical(
      top: topRadius,
      bottom: bottomRadius,
    );

    var borderRadiusModifiedOutline = BorderRadius.vertical(
      top: topRadius == Radius.zero ? Radius.circular(borderRadius) : topRadius,
      bottom: bottomRadius == Radius.zero
          ? Radius.circular(borderRadius)
          : bottomRadius,
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
          onTap: (widget.onSelect != null) ? toggleOverlay : null,
          child: OutlinedWidget(
            outlined: outlined || (_overlayEntry != null),
            borderRadius: (openingFromBottom == null)
                ? borderRadiusModified
                : borderRadiusModifiedOutline,
            child: CompositedTransformTarget(
              link: _layerLink,
              child: AnimatedContainer(
                duration: theme.minorAnimationDuration,
                curve: theme.minorAnimationCurve,
                decoration: BoxDecoration(
                  borderRadius: borderRadiusModified,
                  color: _getFillColor(theme),
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
                    if (widget.icon != null) ...[
                      Icon(
                        widget.icon,
                        color: _getTextColor(theme),
                      ),
                      SizedBox(width: 16.0),
                    ],
                    Expanded(
                      child: Text(
                        selectedIndex != null
                            ? widget.items[selectedIndex].title
                            : widget.hint,
                        style: (selectedIndex != null)
                            ? theme.subtitle1.textStyle
                            : theme.paragraph1.textStyle.copyWith(
                                color: _getTextColor(theme),
                              ),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    AnimatedBuilder(
                      animation: animation,
                      builder: (context, _) {
                        return Transform.rotate(
                          angle: (animation.value) * pi,
                          child: Icon(
                            EvaIcons.chevronDown,
                            color: _getTextColor(theme),
                          ),
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
