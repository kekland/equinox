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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: EqButton(
                    icon: Icons.time_to_leave,
                    size: WidgetSize.large,
                    iconPosition: IconPositioning.right,
                    label: 'Primary',
                    onTap: () {
                      print('hi!');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
