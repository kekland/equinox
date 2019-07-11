import 'package:equinox/equinox.dart';
import 'package:equinox/src/components/icon/icon_theme.dart';
import 'package:flutter/widgets.dart';

class EqIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color color;

  const EqIcon({
    Key key,
    this.icon,
    this.size,
    this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = EqIconThemeData.of(context);
    return Icon(
      icon,
      size: size ?? theme.size,
      color: color ?? theme.color,
    );
  }
}
