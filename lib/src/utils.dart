import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';

class EqToggleableDesciptionUtils {
  static List<Widget> buildListWithDescription({Widget main, double padding, Widget description, EqPositioning descriptionPosition}) {
    if(description == null || descriptionPosition == EqPositioning.none) {
      return <Widget>[main];
    }
    if(descriptionPosition == EqPositioning.left) {
      return <Widget>[
        description,
        SizedBox(width: padding),
        main,
      ];
    }
    else if(descriptionPosition == EqPositioning.right) {
      return <Widget>[
        main,
        SizedBox(width: padding),
        description,
      ];
    }
    return null;
  }
}