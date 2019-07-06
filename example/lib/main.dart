import 'package:equinox/equinox.dart';
import './home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return EquinoxApp(
      theme: Themes.darkTheme,
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}
