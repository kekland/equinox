import 'package:equinox_visualqa/state.dart';
import 'package:flutter/material.dart';
import 'package:equinox/equinox.dart';

void main() => runApp(EquinoxShowcaseApp());

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
        child: Container(
          color: style.get('background-basic-color-2'),
          child: Column(
            children: EqWidgetStatus.values
                .map((value) => EqRadio(
                      description: value.toString(),
                      onSelected: () => setState(() => val = !val),
                      value: val,
                    ))
                .toList(),
          ),
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
