import 'package:eva_design_flutter/components/global/theming.dart';
import 'package:eva_design_flutter/data/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EqCard extends StatelessWidget {
  final Widget child;
  final Widget header;
  final Widget footer;
  final Status status;
  final Color backgroundColor;
  final Color foregroundColor;
  final bool accent;

  const EqCard({
    Key key,
    this.header,
    this.footer,
    this.status,
    this.accent,
    @required this.child,
    this.backgroundColor,
    this.foregroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = EqTheme.of(context);
    return Container(
      decoration: BoxDecoration(),
      child: Material(
        type: MaterialType.transparency,
        child: Column(
          children: [
            if (header != null)
              Container(
                child: header,
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 18.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(theme.borderRadius)),
                  color: theme.getColorsForStatus(status: status).shade500,
                ),
              ),
            child,
            if (footer != null) footer,
          ],
        ),
      ),
    );
  }
}
