import 'package:equinox/components/global/theming.dart';
import 'package:equinox/equinox.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OutlinedGestureDetector extends StatelessWidget {
  final Widget child;
  final Function(bool) onOutlineChange;
  final VoidCallback onTap;

  const OutlinedGestureDetector(
      {Key key, this.onOutlineChange, this.onTap, this.child})
      : super(key: key);

  void onTapDown(data) {
    print('ontapdown');
    onOutlineChange(true);
  }

  void clearOutline(EqThemeData theme) {
    //onOutlineChange(false);
    print('clear');
    Future.delayed(theme.minorAnimationDuration, () => onOutlineChange(false));
  }

  @override
  Widget build(BuildContext context) {
    var theme = EqTheme.of(context);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      onTapDown: (onTap != null) ? onTapDown : null,
      onTapUp: (onTap != null) ? (_) => clearOutline(theme) : null,
      onTapCancel: (onTap != null) ? () => clearOutline(theme) : null,
      child: child,
    );
  }
}
