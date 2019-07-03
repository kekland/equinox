import 'package:eva_design_flutter/components/global/card.dart';
import 'package:eva_design_flutter/components/global/layout.dart';
import 'package:eva_design_flutter/components/global/themes/light_theme.dart';
import 'package:eva_design_flutter/components/global/theming.dart';
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
        ),
      ),
    );
  }
}
