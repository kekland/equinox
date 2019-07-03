import 'package:eva_design_flutter/components/icon_button/icon_button.dart';
import 'package:eva_design_flutter/eva_design_flutter.dart';
import 'package:flutter/material.dart';
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
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(64.0),
              child: EqCard(
                child: Text('Hi!'),
                status: WidgetStatus.success,
                statusAppearance: CardStatusAppearance.header,
                shape: WidgetShape.rectangle,
                header: Text('Header'),
                footerPadding: EdgeInsets.zero,
                footer: EqButton(
                  onTap: () {},
                  size: WidgetSize.large,
                  status: WidgetStatus.success,
                  appearance: WidgetAppearance.ghost,
                  label: 'Like'
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
