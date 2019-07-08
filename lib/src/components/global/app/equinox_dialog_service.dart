import 'package:equinox/equinox.dart';
import 'package:equinox/src/equinox_internal.dart';
import 'package:flutter/material.dart';

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

  Future<T> pushDialog<T>(
      {BuildContext context, String title, Widget body, List<Widget> actions}) {
    return Navigator.of(context).push(
      TransparentPageRoute(
        builder: (context) => EqDialog(
              child: body,
              header: Text(title),
              status: WidgetStatus.info,
              footerPadding: EdgeInsets.zero,
              footer: Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: actions,
              ),
            ),
      ),
    );
  }

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

  Future pushInformationDialog({
    @required BuildContext context,
    @required String title,
    @required Widget body,
    WidgetStatus status = WidgetStatus.info,
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
                appearance: WidgetAppearance.ghost,
                label: 'Close',
                status: status,
              ),
            ),
      ),
    );
  }

  pushLoadingDialog({
    @required BuildContext context,
    WidgetStatus status = WidgetStatus.primary,
  }) {
    return Navigator.of(context).push(
      TransparentPageRoute(
        builder: (context) => EqCard(
              shape: WidgetShape.round,
              child: EqSpinner(
                status: status,
              ),
            ),
      ),
    );
  }

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
