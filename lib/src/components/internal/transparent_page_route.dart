import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';

class TransparentPageRoute<T> extends PageRoute<T> {
  TransparentPageRoute({
    @required this.builder,
    RouteSettings settings,
  })  : assert(builder != null),
        super(
          settings: settings,
          fullscreenDialog: false,
        );

  final WidgetBuilder builder;

  @override
  bool get opaque => false;

  @override
  Color get barrierColor => null;

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration =>
      EqThemes.defaultLightTheme.majorAnimationDuration;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    final result = builder(context);
    return Semantics(
      scopesRoute: true,
      explicitChildNodes: true,
      child: AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget child) => Opacity(
              opacity: EqThemes.defaultLightTheme.minorAnimationCurve
                  .transform(animation.value),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.75),
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {},
                      child: result,
                    ),
                  ),
                ),
              ),
            ),
      ),
    );
  }
}
