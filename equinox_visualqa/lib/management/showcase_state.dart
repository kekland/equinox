import 'package:equinox/equinox.dart';
import 'package:equinox_visualqa/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
export 'package:equinox_visualqa/management/interactive_playground.dart';

class ShowcaseWidgetData {
  final String title;
  final Widget Function() builder;
  final bool override;

  ShowcaseWidgetData({
    this.title,
    this.builder,
    this.override = false,
  });
}

abstract class ShowcaseState<T extends StatefulWidget> extends State<T> {
  List<ShowcaseWidgetData> get showcases;
  String get showcaseName;
  Widget playgroundBuilder();

  List<Widget> get children {
    var items = <Widget>[];

    showcases.forEach((showcase) {
      items.add(
        showcase.override
            ? showcase.builder()
            : EqCard(
                statusAppearance: EqCardStatusAppearance.none,
                header: Text(showcase.title),
                child: showcase.builder(),
              ),
      );
      items.add(SizedBox(height: 16.0));
    });

    items.add(playgroundBuilder());
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return EqLayout(
      appBar: EqAppBar(
        title: 'Showcase',
        subtitle: showcaseName,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(EvaIcons.sunOutline),
            onPressed: AppState.toggleTheme,
          ),
        ],
      ),
      child: ListView(
        padding: const EdgeInsets.all(16.0),
        children: children,
      ),
    );
  }
}
