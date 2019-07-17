import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EqBackgroundColors {
  final Color color1;
  final Color color2;
  final Color color3;
  final Color color4;

  EqBackgroundColors({
    @required this.color1,
    @required this.color2,
    @required this.color3,
    @required this.color4,
  });

  EqBackgroundColors copyWith({
    Color color1,
    Color color2,
    Color color3,
    Color color4,
  }) {
    return EqBackgroundColors(
      color1: color1 ?? this.color1,
      color2: color2 ?? this.color2,
      color3: color3 ?? this.color3,
      color4: color4 ?? this.color4,
    );
  }

  EqBackgroundColors merge(EqBackgroundColors other) {
    if (other == null) return this;
    return copyWith(
      color1: other.color1,
      color2: other.color2,
      color3: other.color3,
      color4: other.color4,
    );
  }
}

class EqBorderColors {
  final Color color1;
  final Color color2;
  final Color color3;
  final Color color4;
  final Color color5;

  EqBorderColors({
    @required this.color1,
    @required this.color2,
    @required this.color3,
    @required this.color4,
    @required this.color5,
  });

  EqBorderColors copyWith({
    Color color1,
    Color color2,
    Color color3,
    Color color4,
    Color color5,
  }) {
    return EqBorderColors(
      color1: color1 ?? this.color1,
      color2: color2 ?? this.color2,
      color3: color3 ?? this.color3,
      color4: color4 ?? this.color4,
      color5: color5 ?? this.color5,
    );
  }

  EqBorderColors merge(EqBorderColors other) {
    if (other == null) return this;
    return copyWith(
      color1: other.color1,
      color2: other.color2,
      color3: other.color3,
      color4: other.color4,
      color5: other.color5,
    );
  }
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

  factory ColorGroup.fromJson(List<String> data) {
    return ColorGroup(
      shade100: Color(int.parse("0xFF${data[0].substring(1)}")),
      shade200: Color(int.parse("0xFF${data[1].substring(1)}")),
      shade300: Color(int.parse("0xFF${data[2].substring(1)}")),
      shade400: Color(int.parse("0xFF${data[3].substring(1)}")),
      shade500: Color(int.parse("0xFF${data[4].substring(1)}")),
      shade600: Color(int.parse("0xFF${data[5].substring(1)}")),
      shade700: Color(int.parse("0xFF${data[6].substring(1)}")),
      shade800: Color(int.parse("0xFF${data[7].substring(1)}")),
      shade900: Color(int.parse("0xFF${data[8].substring(1)}")),
      shade1000: Color(int.parse("0xFF${data[8].substring(1)}")),
      shade1100: Color(int.parse("0xFF${data[8].substring(1)}")),
      shade1200: Color(int.parse("0xFF${data[8].substring(1)}")),
    );
  }

  factory ColorGroup.fromMaterialColor(MaterialColor color) {
    return ColorGroup(
      shade100: color.shade100,
      shade200: color.shade200,
      shade300: color.shade300,
      shade400: color.shade400,
      shade500: color.shade500,
      shade600: color.shade600,
      shade700: color.shade700,
      shade800: color.shade800,
      shade900: color.shade900,
      shade1000: color.shade900,
      shade1100: color.shade900,
      shade1200: color.shade900,
    );
  }
}
