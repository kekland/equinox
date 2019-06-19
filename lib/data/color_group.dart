import 'package:flutter/widgets.dart';

class BackgroundColors {
  final Color color1;
  final Color color2;
  final Color color3;
  final Color color4;

  BackgroundColors({
    @required this.color1,
    @required this.color2,
    @required this.color3,
    @required this.color4,
  });
}

class BorderColors {
  final Color color1;
  final Color color2;
  final Color color3;
  final Color color4;
  final Color color5;

  BorderColors({
    @required this.color1,
    @required this.color2,
    @required this.color3,
    @required this.color4,
    @required this.color5,
  });
}

class ColorStates {
  final Color focus;
  final Color hover;
  final Color normal;
  final Color active;
  final Color disabled;

  ColorStates({
    @required this.focus,
    @required this.hover,
    @required this.normal,
    @required this.active,
    @required this.disabled,
  });
}

class ColorGroup {
  final Color shade100;
  final Color shade200;
  final Color shade300;
  final Color shade400;
  final Color shade500;
  final Color shade600;
  final Color shade700;
  final Color shade800;
  final Color shade900;
  final Color shade1000;
  final Color shade1100;
  final Color shade1200;
  final List<Color> shades;

  ColorGroup({
    @required this.shade100,
    @required this.shade200,
    @required this.shade300,
    @required this.shade400,
    @required this.shade500,
    @required this.shade600,
    @required this.shade700,
    @required this.shade800,
    @required this.shade900,
    this.shade1000,
    this.shade1100,
    this.shade1200,
  }) : shades = [
          shade100,
          shade200,
          shade300,
          shade400,
          shade500,
          shade600,
          shade700,
          shade800,
          shade900,
          shade1000,
          shade1100,
          shade1200,
        ];
}
