import 'package:equinox/equinox.dart';
import 'package:flutter/material.dart';

class AppBarShowcase extends StatefulWidget {
  @override
  _AppBarShowcaseState createState() => _AppBarShowcaseState();
}

class _AppBarShowcaseState extends State<AppBarShowcase> {
  @override
  Widget build(BuildContext context) {
    return EqLayout(
      child: Container(),
      appBar: EqAppBar.withoutTitle(
          bottom: EqTabs(
            onSelect: (i) {},
        tabs: [
          EqTabData(
            title: 'a',
          ),
          EqTabData(
            title: 'b',
          ),
          EqTabData(
            title: 'c',
          ),
        ],
      )),
    );
  }
}
