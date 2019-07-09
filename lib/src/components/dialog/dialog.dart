import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';

/// Dialogs are used to show modal content for user to take action on.
class EqDialog extends StatelessWidget {
  /// A widget to use as dialog's body. Gets padded by [padding].
  final Widget child;

  /// A widget to use as dialog's header. Gets padded by [headerPadding] or [padding].
  /// Set [headerPadding] to `EdgeInsets.zero` if you want no padding.
  final Widget header;
  
  /// A widget to use as dialog's header. Gets padded by [footerPadding] or [padding].
  /// Set [footerPadding] to `EdgeInsets.zero` if you want no padding.
  final Widget footer;
  
  /// A dialog's status. It will be dispalyed according to [statusAppearance].
  /// - If [statusAppearance] is [CardStatusAppearance.body], entire dialog will be painted in
  /// the status's color.
  /// - If [statusAppearance] is [CardStatusAppearance.header], only the header will be painted in
  /// the status's color.
  /// - If [statusAppearance] is [CardStatusAppearance.strip], the status will be displayed as
  /// tiny line on top of the dialog.
  /// - Otherwise, no status will be displayed.
  final WidgetStatus status;

  /// Controls the dialog's border radius. If none is passed, uses [EqThemeData.defaultWidgetShape].
  final WidgetShape shape;

  /// Controls the dialog's status appearance. See [status] for more details.
  final CardStatusAppearance statusAppearance;

  /// Controls the padding of the child. Also sets the [headerPadding] and [footerPadding] if they're null.
  final EdgeInsets padding;

  /// Controls the padding for the header. Gets set by [padding] if it's `null`. See [header].
  final EdgeInsets headerPadding;
  
  /// Controls the padding for the footer. Gets set by [padding] if it's `null`. See [footer].
  final EdgeInsets footerPadding;

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
      constraints: BoxConstraints(
          minWidth: size.width * 0.6, maxWidth: size.width * 0.9),
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
