import 'package:equinox/components/global/equinox_app.dart';
import 'package:equinox/equinox.dart';
import 'package:equinox/home_page.dart';
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
