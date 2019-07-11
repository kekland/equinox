import 'package:equinox/equinox.dart';
import 'package:equinox/src/components/icon/icon_theme.dart';
import 'package:flutter/widgets.dart';

class EqIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color color;
  final EqWidgetStatus status;

  const EqIcon({
    Key key,
    this.icon,
    this.size,
    this.color,
    this.status,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = EqTheme.of(context);
    final iconTheme = EqIconThemeData.of(context);

    final statusColor = theme.getColorsForStatus(status: status);
    return Icon(
      icon,
      size: size ?? iconTheme.size,
      color: statusColor ?? color ?? iconTheme.color,
    );
  }
}
