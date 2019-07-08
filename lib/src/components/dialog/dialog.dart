import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';

class EqDialog extends StatelessWidget {
  final Widget header;
  final Widget child;
  final Widget footer;
  final EdgeInsets headerPadding;
  final EdgeInsets footerPadding;
  final EdgeInsets padding;
  final WidgetStatus status;
  final WidgetShape shape;
  final CardStatusAppearance statusAppearance;

  const EqDialog({
    Key key,
    this.header,
    this.footer,
    this.headerPadding,
    this.footerPadding,
    this.padding = const EdgeInsets.all(16.0),
    this.status = WidgetStatus.primary,
    this.shape = WidgetShape.rectangle,
    this.statusAppearance = CardStatusAppearance.header,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      constraints: BoxConstraints(minWidth: size.width * 0.6, maxWidth: size.width * 0.9),
      padding: const EdgeInsets.all(16.0),
          child: EqCard(
        header: header,
        child: child,
        footer: footer,
        footerPadding: footerPadding,
        headerPadding: headerPadding,
        padding: padding,
        shape: shape,
        status: status,
        statusAppearance: statusAppearance,
      ),
    );
  }
}
