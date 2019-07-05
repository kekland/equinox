import 'package:eva_design_flutter/components/global/equinox_app.dart';
import 'package:eva_design_flutter/eva_design_flutter.dart';
import 'package:eva_design_flutter/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return EquinoxApp(
      theme: Themes.defaultTheme,
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}
