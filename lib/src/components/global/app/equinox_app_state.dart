import 'package:equinox/src/components/toast/toast_data.dart';
import 'package:flutter/material.dart';

class EquinoxAppInheritedState extends InheritedWidget {
  final Widget child;
  final List<EqToast> _toastQueue = [];

  EquinoxAppInheritedState({Key key, this.child})
      : super(key: key, child: child);

  void pushToast({BuildContext context, EqToast toast}) {
    _toastQueue.add(toast);

  }

  @override
  bool updateShouldNotify(EquinoxAppInheritedState oldWidget) => false;
}
