import 'package:flutter/material.dart';

class OutlinedGestureDetector extends StatelessWidget {
  final Widget child;
  final Function(bool) onOutlineChange;
  final VoidCallback onTap;

  const OutlinedGestureDetector(
      {Key key, this.onOutlineChange, this.onTap, this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      onTapDown: (onTap != null) ? (_) => onOutlineChange(true) : null,
      onTapUp: (onTap != null) ? (_) => onOutlineChange(false) : null,
      onTapCancel: (onTap != null) ? () => onOutlineChange(false) : null,
      child: child,
    );
  }
}
