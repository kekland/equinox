import 'package:equinox_visualqa/components/button.dart';
import 'package:equinox_visualqa/components/checkbox.dart';
import 'package:equinox_visualqa/components/radio.dart';
import 'package:equinox_visualqa/main.dart';
import 'package:equinox_visualqa/state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:equinox/equinox.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(EquinoxShowcaseApp());
}

class EquinoxShowcaseApp extends StatefulWidget {
  @override
  _EquinoxShowcaseAppState createState() => _EquinoxShowcaseAppState();
}

class _EquinoxShowcaseAppState extends State<EquinoxShowcaseApp> {
  @override
  Widget build(BuildContext context) {
    AppState.subscribe(() => setState(() => {}));
    print(AppState.theme.get('background-basic-color-1'));
    return EquinoxApp(
      title: 'Flutter Demo',
      theme: AppState.theme,
      home: MainPage(),
    );
  }
}