import 'package:equinox/equinox.dart';
import 'package:equinox/src/equinox_internal.dart';
import 'package:flutter/material.dart';

/// This is used to show dialogs. Use it with [EqDialogService.of()].
class EqDialogService extends StatefulWidget {
  final Widget child;

  const EqDialogService({Key key, this.child}) : super(key: key);

  @override
  EqDialogServiceState createState() => EqDialogServiceState();

  static EqDialogServiceState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_EqDialogServiceInherited)
            as _EqDialogServiceInherited)
        .data;
  }
}

class EqDialogServiceState extends State<EqDialogService> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// Pushes a general dialog with title, body, and actions. [title], [body], [context], [actions] must not be null.
  /*Future<T> pushDialog<T>({
    @required BuildContext context,
    @required String title,
    @required Widget body,
    List<Widget> actions = const [],
    EqWidgetStatus status = EqWidgetStatus.primary,
  }) {
    return Navigator.of(context).push(
      TransparentPageRoute(
        builder: (context) => EqDialog(
              child: body,
              header: Text(title),
              status: status,
              footerPadding: EdgeInsets.zero,
              footer: actions != null
                  ? Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      alignment: WrapAlignment.end,
                      children: actions,
                    )
                  : null,
            ),
      ),
    );
  }

  /// Pushes a custom dialog. Refer to [EqDialog] for styling info. [dialog] and [context] must not be null.
  Future<T> pushCustomDialog<T>({
    @required BuildContext context,
    @required EqDialog dialog,
  }) {
    return Navigator.of(context).push(
      TransparentPageRoute<T>(
        builder: (_) => dialog,
      ),
    );
  }

  /// Pushes an informational dialog. [title], [body], [context] must not be null. Provides 'close' button on bottom.
  Future pushInformationDialog({
    @required BuildContext context,
    @required String title,
    @required Widget body,
    EqWidgetStatus status = EqWidgetStatus.info,
  }) async {
    return Navigator.of(context).push(
      TransparentPageRoute(
        builder: (context) => EqDialog(
              child: body,
              header: Text(title),
              footerPadding: EdgeInsets.zero,
              status: status,
              footer: EqButton(
                onTap: () => Navigator.of(context).pop(),
                appearance: EqWidgetAppearance.ghost,
                label: 'Close',
                status: status,
              ),
            ),
      ),
    );
  }*/

  /// Pushes a loading dialog. [context] must not be null.
  /*pushLoadingDialog({
    @required BuildContext context,
    EqWidgetStatus status = EqWidgetStatus.primary,
  }) {
    return Navigator.of(context).push(
      TransparentPageRoute(
        builder: (context) => EqCard(
              shape: EqWidgetShape.round,
              child: EqSpinner(
                status: status,
              ),
            ),
      ),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return _EqDialogServiceInherited(
      data: this,
      child: widget.child,
    );
  }
}

class _EqDialogServiceInherited extends InheritedWidget {
  final EqDialogServiceState data;
  final Widget child;

  _EqDialogServiceInherited({Key key, this.child, this.data})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(_EqDialogServiceInherited oldWidget) => false;
}
