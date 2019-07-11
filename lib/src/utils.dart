import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';

class EqToggleableDesciptionUtils {
  static List<Widget> buildListWithDescription({Widget main, double padding, Widget description, Positioning descriptionPosition}) {
    if(description == null || descriptionPosition == Positioning.none) {
      return <Widget>[main];
    }
    if(descriptionPosition == Positioning.left) {
      return <Widget>[
        description,
        SizedBox(width: padding),
        main,
      ];
    }
    else if(descriptionPosition == Positioning.right) {
      return <Widget>[
        main,
        SizedBox(width: padding),
        description,
      ];
    }
    return null;
  }
}