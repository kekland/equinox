import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';

/// Divider is used to divide parts of content.
class EqDivider extends StatelessWidget {
  final Color color;
  final double width;
  const EqDivider({
    Key key,
    this.color,
    this.width,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final style = StaticStyle.of(context);
    return Container(
      color: color ?? style.get('divider-color'),
      height: width ?? style.get('divider-width'),
    );
  }
}
