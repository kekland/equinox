import 'package:equinox/equinox.dart';
import 'package:equinox/src/equinox_internal.dart';
import 'package:flutter/widgets.dart';

class EqIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color color;
  final EqWidgetStatus status;

  const EqIcon(
    this.icon,{
    Key key,
    this.size,
    this.color,
    this.status,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final style = StaticStyle.of(context);

    final statusColor = style.get(generateSelector(['color', status, '500']));
    return Icon(
      icon,
      size: size ?? style.get('icon-size'),
      color: statusColor ?? color ?? style.get('icon-color'),
    );
  }
}
