import 'dart:math';

import 'package:equinox/equinox.dart';
export 'package:equinox/src/components/select/select_theme.dart';
import 'package:equinox/src/equinox_internal.dart';
import 'package:flutter/widgets.dart';

export 'package:equinox/src/components/select/select_overlay.dart';

export 'package:equinox/src/components/select/select_item.dart';

/// This widget is used to select an item in a list of items of type [T].
///
/// [items] must not be null.
class EqSelect<T> extends StatefulWidget {
  /// List of items to select from. Refer to [EqSelectItem].
  final List<EqSelectItem<T>> items;

  /// This method is called when user selects an item in a list. Can be null to make the widget disabled.
  final void Function(T) onSelect;

  /// Label is displayed on top of the widget. Optional.
  final String label;

  /// Hint is displayed inside the widget.
  final String hint;

  /// Description is displayed below the widget. Optional.
  final String description;

  /// Icon is displayed on the left side of the widget. Optional.
  final IconData icon;

  /// WidgetShape controls the borderRadius.
  final WidgetShape shape;

  /// WidgetStatus controls the color.
  final WidgetStatus status;

  /// Index of an item that is selected by default.
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
    final theme = EqTheme.of(context);
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

  EqSelectThemeData getThemeData(BuildContext context) {
    final theme = EqTheme.of(context);
    EqSelectThemeData themeData =
        theme.defaultSelectTheme ?? EqSelectThemeData();

    return themeData.copyWith(
      status: widget.status,
      shape: widget.shape,
    );
  }

  initState() {
    super.initState();
    selectedIndex = widget.selectedIndex ?? null;
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
      if (forced) {
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
    final size = renderBox.size;
    final theme = EqTheme.of(context);

    double containerHeight = size.height;
    if (widget.description != null)
      containerHeight -= theme.paragraph2.lineHeight + 4.0;

    if (widget.label != null) containerHeight -= theme.label.lineHeight + 6.0;

    double verticalOffset = containerHeight;
    final borderRadius = theme.borderRadius *
        WidgetShapeUtils.getMultiplier(shape: widget.shape);

    Size screen = MediaQuery.of(context).size;

    var height = 0.0;
    for (final item in widget.items) {
      height += item.caluclateHeight(theme);
    }

    final position = renderBox.localToGlobal(Offset.zero);

    final bottom = screen.height - position.dy - size.height;
    final top = position.dy;

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
    final theme = EqTheme.of(context);
    final themeData = getThemeData(context);
    final borderRadius = themeData.getBorderRadius(theme: theme);
    final radius = borderRadius.topLeft;

    final normalRadius = radius;
    final topRadius = (!_isOverlayOpen)
        ? normalRadius
        : (!openingFromBottom) ? Radius.zero : normalRadius;
    final bottomRadius = (!_isOverlayOpen)
        ? normalRadius
        : (!openingFromBottom) ? normalRadius : Radius.zero;

    final borderRadiusModified = BorderRadius.vertical(
      top: topRadius,
      bottom: bottomRadius,
    );

    final borderRadiusModifiedOutline = BorderRadius.vertical(
      top: topRadius == Radius.zero ? radius : topRadius,
      bottom: bottomRadius == Radius.zero ? radius : bottomRadius,
    );

    final disabled = widget.onSelect == null;

    final fillColor =
        themeData.getBackgroundColor(theme: theme, disabled: disabled);
    final borderColor = _isOverlayOpen
        ? themeData.getFocusedBorderColor(theme: theme)
        : themeData.getBorderColor(theme: theme, disabled: disabled);

    final textColor = themeData.getTextColor(theme: theme, disabled: disabled);

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
                  color: fillColor,
                  border: Border.all(
                    width: 1.0,
                    color: borderColor,
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
                        color: textColor,
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
                                color: textColor,
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
                            color: textColor,
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
