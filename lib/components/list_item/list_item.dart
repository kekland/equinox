import 'package:eva_design_flutter/eva_design_flutter.dart';
import 'package:flutter/material.dart';

class EqListItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const EqListItem({
    Key key,
    this.icon,
    @required this.title,
    @required this.onTap,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = EqTheme.of(context);
    var enabled = onTap != null;
    var textColor = (enabled)? theme.textBasicColor : theme.textDisabledColor;
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style: theme.subtitle1.textStyle.copyWith(
          color: textColor,
        ),
      ),
    );
  }
}
