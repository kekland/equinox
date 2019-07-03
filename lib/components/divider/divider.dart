import 'package:eva_design_flutter/eva_design_flutter.dart';
import 'package:flutter/widgets.dart';

class EqDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = EqTheme.of(context);
    return Container(color: theme.dividerColor, height: theme.dividerWidth);
  }
}