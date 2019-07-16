import 'dart:math';

import 'package:equinox/equinox.dart';
export 'package:equinox/src/components/select/select_style.dart';
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
  final EqWidgetShape shape;

  /// WidgetStatus controls the color.
  final EqWidgetStatus status;

  /// Controls the appearance.
  final EqWidgetAppearance appearance;

  /// Controls the size.
  final EqWidgetSize size;

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
    this.shape,
    this.status,
    this.selectedIndex,
    this.appearance = EqWidgetAppearance.outline,
    this.size = EqWidgetSize.medium,
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
    final style = StaticStyle.of(context);
    animationDuration = style.get('minor-animation-duration');

    if (animationController != null) {
      animationController.duration = animationDuration;
    } else {
      animationController =
          AnimationController(vsync: this, duration: animationDuration);
    }
    animation = CurvedAnimation(
        parent: animationController, curve: style.get('minor-animation-curve'));
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
    final style = StaticStyle.of(context);

    double containerHeight = size.height;
    if (widget.description != null)
      containerHeight -= style.get('select-description-font-size') + 4.0;

    if (widget.label != null)
      containerHeight -= style.get('select-label-font-size') + 6.0;

    double verticalOffset = containerHeight - 2.0;
    final borderRadius = EqWidgetShapeUtils.getRadius(
      style: style.style,
      shape: widget.shape,
    ).x;

    Size screen = MediaQuery.of(context).size;

    var height = 0.0;
    for (final item in widget.items) {
      height += item.caluclateHeight(style);
      print(height);
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
                  height: height,
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
                ),
              ),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final style = StaticStyle.of(context);

    final borderRadius = BorderRadius.all(EqWidgetShapeUtils.getRadius(
      style: style.style,
      shape: widget.shape,
    ));

    final active = outlined || _overlayEntry != null;
    final disabled = widget.onSelect == null;

    final selectorBase = [
      'select',
      widget.status,
      widget.appearance,
      (disabled) ? 'disabled' : (active) ? 'active' : null,
    ];
    final selectorSize = [
      'select',
      widget.size,
    ];

    var finalBorderRadius = borderRadius;
    var finalOutlineBorderRadius = borderRadius;

    if (openingFromBottom != null && !openingFromBottom) {
      finalBorderRadius = BorderRadius.vertical(
          top: Radius.zero, bottom: borderRadius.bottomLeft);
      finalOutlineBorderRadius = BorderRadius.vertical(
          top: Radius.circular(style.get('border-radius-rectangle')),
          bottom: borderRadius.bottomLeft);
    } else if (openingFromBottom != null && openingFromBottom) {
      finalBorderRadius =
          BorderRadius.vertical(top: borderRadius.topLeft, bottom: Radius.zero);

      finalOutlineBorderRadius = BorderRadius.vertical(
          top: borderRadius.topLeft,
          bottom: Radius.circular(style.get('border-radius-rectangle')));
    }

    final fillColor =
        style.get(generateSelector([...selectorBase, 'background-color']));
    print(selectorBase);
    final borderColor =
        style.get(generateSelector([...selectorBase, 'border-color']));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (widget.label != null) ...[
          Text(
            widget.label.toUpperCase(),
            style: TextStyle(
              color: style.get('select-label-color'),
              fontSize: style.get('select-label-font-size'),
              fontWeight: style.get('select-label-font-weight'),
              fontFamily: style.get('select-label-font-family'),
            ),
          ),
          SizedBox(height: 6.0),
        ],
        OutlinedGestureDetector(
          onOutlineChange: (v) => setState(() => outlined = v),
          onTap: (widget.onSelect != null) ? toggleOverlay : null,
          child: OutlinedWidget(
            outlined: outlined || (_overlayEntry != null),
            borderRadius: finalOutlineBorderRadius,
            child: CompositedTransformTarget(
              link: _layerLink,
              child: AnimatedContainer(
                duration: style.get('minor-animation-duration'),
                curve: style.get('minor-animation-curve'),
                decoration: BoxDecoration(
                  borderRadius: finalBorderRadius,
                  color: fillColor,
                  border: Border.all(
                    width: 1.0,
                    color: borderColor,
                  ),
                ),
                alignment: Alignment.centerLeft,
                padding:
                    style.get(generateSelector([...selectorSize, 'padding'])),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (widget.icon != null) ...[
                      Icon(
                        widget.icon,
                        color: style.get(
                            generateSelector([...selectorBase, 'hint-color'])),
                      ),
                      SizedBox(width: 16.0),
                    ],
                    Expanded(
                      child: Text(
                          selectedIndex != null
                              ? widget.items[selectedIndex].title
                              : widget.hint,
                          style: (selectedIndex != null)
                              ? TextStyle(
                                  color: style.get(generateSelector(
                                      [...selectorBase, 'text-color'])),
                                  fontFamily: style.get(generateSelector(
                                      [...selectorSize, 'text-font-family'])),
                                  fontWeight: style.get(generateSelector(
                                      [...selectorSize, 'text-font-weight'])),
                                  fontSize: style.get(generateSelector(
                                      [...selectorSize, 'text-font-size'])),
                                )
                              : TextStyle(
                                  color: style.get(generateSelector(
                                      [...selectorBase, 'hint-color'])),
                                  fontFamily:
                                      style.get('select-hint-font-family'),
                                  fontSize: style.get('select-hint-font-size'),
                                  fontWeight:
                                      style.get('select-hint-font-weight'),
                                )),
                    ),
                    SizedBox(width: 16.0),
                    AnimatedBuilder(
                      animation: animation,
                      builder: (context, _) {
                        return Transform.rotate(
                          angle: (animation.value) * pi,
                          child: Icon(
                            EvaIcons.chevronDown,
                            color: style.get(generateSelector(
                                [...selectorBase, 'hint-color'])),
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
            style: TextStyle(
              color: style.get('select-description-color'),
              fontSize: style.get('select-description-font-size'),
              fontFamily: style.get('select-description-font-family'),
              fontWeight: style.get('select-description-fony-weight'),
            ),
          ),
        ],
      ],
    );
  }
}
