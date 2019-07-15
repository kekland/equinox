import 'package:equinox_visualqa/components/button.dart';
import 'package:equinox_visualqa/components/checkbox.dart';
import 'package:equinox_visualqa/components/radio.dart';
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
    return EquinoxApp(
      title: 'Flutter Demo',
      theme: AppState.theme,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool val = false;
  navigateTo(BuildContext context, WidgetBuilder builder) {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: builder,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final style = StaticStyle.of(context);
    return EqLayout(
      child: Center(
        child: Column(
          children: <Widget>[
            EqButton(
              onTap: () => navigateTo(context, (_) => ButtonShowcase()),
              label: 'Buttons',
            ),
            EqButton(
              onTap: () => navigateTo(context, (_) => RadioShowcase()),
              label: 'Radio',
            ),
            EqButton(
              onTap: () => navigateTo(context, (_) => CheckboxShowcase()),
              label: 'Checkbox',
            ),
          ],
        ),
      ),
    );
  }
}

class ShowcaseData {
  final String title;
  final WidgetBuilder builder;

  ShowcaseData({this.title, this.builder});
}
