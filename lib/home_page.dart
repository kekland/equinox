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
      appBar: ,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(64.0),
          child: EqCard(
            status: WidgetStatus.danger,
            statusAppearance: CardStatusAppearance.header,
            shape: WidgetShape.rectangle,
            header: Text('Nebula'),
            child: Text(
                'A nebula is an interstellar cloud of dust, hydrogen, helium and other ionized gases. Originally, nebula was a name for any diffuse astronomical object, including galaxies beyond the Milky Way.'),
            footer: Text('By Wikipedia'),
          ),
        ),
      ),
    );
  }
}
