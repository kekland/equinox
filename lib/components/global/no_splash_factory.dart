import 'package:flutter/material.dart';

class NoSplashFactory implements InteractiveInkFeatureFactory {
  const NoSplashFactory();

  InteractiveInkFeature create(
      {MaterialInkController controller,
      RenderBox referenceBox,
      Offset position,
      Color color,
      TextDirection textDirection,
      bool containedInkWell = false,
      rectCallback,
      BorderRadius borderRadius,
      ShapeBorder customBorder,
      double radius,
      VoidCallback onRemoved}) {
    return new NoSplash(
      controller: controller,
      referenceBox: referenceBox,
    );
  }
}

class NoSplash extends InteractiveInkFeature {
  NoSplash({
    @required MaterialInkController controller,
    @required RenderBox referenceBox,
  }) : super(
          controller: controller,
          referenceBox: referenceBox,
        ) {
    assert(controller != null);
    assert(referenceBox != null);
    controller.addInkFeature(this);
  }

  @override
  void paintFeature(Canvas canvas, Matrix4 transform) {}
}
