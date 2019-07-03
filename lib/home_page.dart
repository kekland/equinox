import 'package:eva_design_flutter/eva_design_flutter.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return EqLayout(
      theme: Themes.defaultTheme,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: EqButton(
            label: 'Primary',
            status: WidgetStatus.primary,
            size: WidgetSize.giant,
            shape: WidgetShape.semiRound,
            appearance: ButtonAppearance.filled,
            onTap: () {
              print('hi!');
            },
          ),
        ),
      ),
    );
  }
}
