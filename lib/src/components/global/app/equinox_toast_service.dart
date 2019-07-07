import 'package:equinox/equinox.dart';
import 'package:equinox/src/components/toast/toast_data.dart';
import 'package:flutter/material.dart';

class EqToastService extends StatefulWidget {
  final Widget child;

  const EqToastService({Key key, this.child}) : super(key: key);

  @override
  EqToastServiceState createState() => EqToastServiceState();

  static EqToastServiceState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_EqToastServiceInherited)
            as _EqToastServiceInherited)
        .data;
  }
}

class EqToastServiceState extends State<EqToastService> {
  List<EqToast> _toastQueue;

  @override
  void initState() {
    _toastQueue = [];
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void removeToast(EqToast toast) {
    _toastQueue.remove(toast);
    setState(() {});
  }

  void pushToast({EqToast toast}) {
    _toastQueue.add(toast);
    setState(() {});
  }

  Widget _buildOverlay(BuildContext context) {
    var children = <Widget>[];
    for (var toast in _toastQueue) {
      children.add(
        EqToastWidget(
          key: ValueKey(toast),
          data: toast,
          serviceRemoveToastCallback: () =>
            removeToast(toast),
        ),
      );
    }

    return Container(
      alignment: Alignment.bottomRight,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: children,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _EqToastServiceInherited(
      data: this,
      child: Stack(
        children: <Widget>[
          widget.child,
          Align(
            alignment: Alignment.bottomRight,
            child: _buildOverlay(context),
          ),
        ],
      ),
    );
  }
}

class _EqToastServiceInherited extends InheritedWidget {
  final EqToastServiceState data;
  final Widget child;

  _EqToastServiceInherited({Key key, this.child, this.data})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(_EqToastServiceInherited oldWidget) => false;
}
