import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EquinoxScrollBehavior implements ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }

  @override
  TargetPlatform getPlatform(BuildContext context) {
    return defaultTargetPlatform;
  }

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics();
  }

  @override
  bool shouldNotify(ScrollBehavior oldDelegate) {
    return false;
  }

}