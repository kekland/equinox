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
  ScrollController _toastScrollController;

  @override
  void initState() {
    _toastQueue = [];
    _toastScrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _toastScrollController.dispose();
    super.dispose();
  }

  void removeToast(EqToast toast) {
    _toastQueue.remove(toast);
    setState(() {});
  }

  void pushToast({EqToast toast}) {
    _toastQueue.add(toast);
    _toastScrollController.animateTo(0.0, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    setState(() {});
  }

  Widget _buildOverlay(BuildContext context) {
    var children = <Widget>[];
    for (var toast in _toastQueue) {
      children.add(
        EqToastWidget(
          key: ValueKey(toast),
          data: toast,
          padding: const EdgeInsets.only(top: 16.0),
          serviceRemoveToastCallback: () => removeToast(toast),
        ),
      );
    }

    return Container(
      alignment: Alignment.bottomRight,
      padding: const EdgeInsets.only(
        bottom: 48.0,
        top: 128.0,
      ),
      child: SingleChildScrollView(
        controller: _toastScrollController,
        reverse: true,
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: children,
        ),
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

class _EqToastColumnClipper extends CustomClipper<Rect> {
  final double screenHeight;

  _EqToastColumnClipper({this.screenHeight});
  @override
  Rect getClip(Size size) {
    if (size.height > screenHeight) {
      return Rect.fromLTWH(0.0, 0.0, size.width, screenHeight);
    }
    return Rect.fromLTWH(0.0, 0.0, size.width, size.height);
  }

  @override
  bool shouldReclip(_EqToastColumnClipper oldClipper) =>
      oldClipper.screenHeight != screenHeight;
}
