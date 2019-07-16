import 'package:equinox_visualqa/components/button.dart';
import 'package:equinox_visualqa/components/card.dart';
import 'package:equinox_visualqa/components/checkbox.dart';
import 'package:equinox_visualqa/components/icon_button.dart';
import 'package:equinox_visualqa/components/radio.dart';
import 'package:equinox_visualqa/components/select.dart';
import 'package:equinox_visualqa/components/spinner.dart';
import 'package:equinox_visualqa/components/toggle.dart';
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

class MainPage extends StatelessWidget {
  navigateTo(BuildContext context, WidgetBuilder builder) {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: builder,
      ),
    );
  }

  final List<ShowcaseData> showcases = [
    ShowcaseData(
      builder: (_) => ButtonShowcase(),
      title: 'Buttons',
    ),
    ShowcaseData(
      builder: (_) => CardShowcase(),
      title: 'Cards',
    ),
    ShowcaseData(
      builder: (_) => CheckboxShowcase(),
      title: 'Checkbox',
    ),
    ShowcaseData(
      builder: (_) => IconButtonShowcase(),
      title: 'Icon button',
    ),
    ShowcaseData(
      builder: (_) => RadioShowcase(),
      title: 'Radio',
    ),
    ShowcaseData(
      builder: (_) => ToggleShowcase(),
      title: 'Toggle',
    ),
    ShowcaseData(
      builder: (_) => SpinnerShowcase(),
      title: 'Spinner',
    ),
    ShowcaseData(
      builder: (_) => SelectShowcase(),
      title: 'Select',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return EqLayout(
      appBar: EqAppBar(
        title: 'Showcase app',
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(EvaIcons.sunOutline),
            onPressed: AppState.toggleTheme,
          ),
        ],
      ),
      child: ListView.builder(
          itemCount: showcases.length,
          itemBuilder: (_, index) {
            final item = showcases[index];
            return EqListItem(
              onTap: () => navigateTo(context, item.builder),
              title: item.title,
              icon: EvaIcons.star,
              subtitle: '${item.title} showcase',
            );
          }),
    );
  }
}

class ShowcaseData {
  final String title;
  final WidgetBuilder builder;

  ShowcaseData({this.title, this.builder});
}