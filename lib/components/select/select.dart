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

  const EqSelect(
      {Key key,
      @required this.items,
      @required this.onSelect,
      @required this.hint,
      this.label,
      this.description,
      this.icon,
      this.shape = WidgetShape.rectangle,
      this.status})
      : super(key: key);

  @override
  _EqSelectState<T> createState() => _EqSelectState<T>();
}

class _EqSelectState<T> extends State<EqSelect> {
  bool outlined = false;
  OverlayEntry _overlayEntry;
  final LayerLink _layerLink = LayerLink();

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
    }
  }

  hideOverlay() {
    if (this._overlayEntry != null) {
      this._overlayEntry.remove();
      this._overlayEntry = null;
    }
  }

  toggleOverlay() {
    if (this._overlayEntry == null)
      showOverlay();
    else
      hideOverlay();
  }

  OverlayEntry createOverlay() {
    RenderBox renderBox = context.findRenderObject();
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);
    var theme = EqTheme.of(context);
    double verticalOffset = size.height;
    if(widget.description != null) {
      verticalOffset -= theme.paragraph2.lineHeight + 4.0;
    }
    if(widget.label != null) {
      verticalOffset -= theme.label.lineHeight + 6.0;
    }
    print(size);
    print(verticalOffset);
    return OverlayEntry(
        builder: (context) => Positioned(
              width: size.width,
              child: CompositedTransformFollower(
                showWhenUnlinked: false,
                link: this._layerLink,
                offset: Offset(0.0, verticalOffset),
                child: EqCard(
                  padding: EdgeInsets.zero,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    children: <Widget>[
                      EqListItem(
                        title: 'Syria',
                      ),
                      EqListItem(
                        title: 'Lebanon',
                      ),
                    ],
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
            outlined: outlined,
            borderRadius: BorderRadius.circular(borderRadius),
            child: CompositedTransformTarget(
              link: _layerLink,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius),
                  color: theme.backgroundBasicColors.color2,
                  border: Border.all(
                    width: 1.0,
                    color: _getBorderColor(theme),
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
                  children: [
                    Text(
                      widget.hint,
                      style: theme.paragraph1.textStyle
                          .copyWith(color: theme.textHintColor),
                    ),
                    Spacer(flex: 1),
                    SizedBox(width: 16.0),
                    Icon(EvaIcons.chevronDown, color: theme.textHintColor),
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

class EqSelectItem<T> {
  final String title;
  final T value;

  EqSelectItem({this.title, this.value});
}
