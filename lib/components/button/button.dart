export 'package:eva_design_flutter/components/button/button_appearance.dart';
import 'package:eva_design_flutter/eva_design_flutter.dart';
import 'package:flutter/widgets.dart';

class EqButton extends StatelessWidget {
  final WidgetSize size;
  final WidgetStatus status;
  final ButtonAppearance type;
  final WidgetShape shape;
  final bool disabled;
  

  const EqButton({
    Key key,
    this.size = WidgetSize.medium,
    this.status = WidgetStatus.primary,
    this.type = ButtonAppearance.fill,
    this.shape = WidgetShape.rectangle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
