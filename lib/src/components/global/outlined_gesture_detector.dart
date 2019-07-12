import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';

class OutlinedGestureDetector extends StatelessWidget {
  final Widget child;
  final Function(bool) onOutlineChange;
  final VoidCallback onTap;

  const OutlinedGestureDetector(
      {Key key, this.onOutlineChange, this.onTap, this.child})
      : super(key: key);

  void onTapDown(data) {
    onOutlineChange(true);
  }

  void clearOutline(Duration delay) {
    Future.delayed(delay, () => onOutlineChange(false));
  }

  @override
  Widget build(BuildContext context) {
    var style = StaticStyle.of(context);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      onTapDown: (onTap != null) ? onTapDown : null,
      onTapUp: (onTap != null) ? (_) => clearOutline(style.get('minor-animation-duration')) : null,
      onTapCancel: (onTap != null) ? () => clearOutline(style.get('minor-animation-duration')) : null,
      child: child,
    );
  }
}
