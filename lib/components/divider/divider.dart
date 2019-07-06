import 'package:equinox/equinox.dart';

import 'package:flutter/widgets.dart';

class EqDivider extends StatelessWidget {
  final bool brightBackground;

  const EqDivider({
    Key key,
    this.brightBackground = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var theme = EqTheme.of(context);
    return Container(color: theme.dividerColor, height: theme.dividerWidth);
  }
}
