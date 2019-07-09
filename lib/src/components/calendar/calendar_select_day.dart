import 'package:equinox/equinox.dart';
import 'package:flutter/material.dart';

class EqCalendarSelectDay extends StatefulWidget {
  final void Function(DateTime) onSelected;
  final DateTime selectedDate;

  const EqCalendarSelectDay({Key key, this.onSelected, this.selectedDate})
      : super(key: key);
  @override
  _EqCalendarSelectDayState createState() => _EqCalendarSelectDayState();
}

class _EqCalendarSelectDayState extends State<EqCalendarSelectDay> {
  @override
  Widget build(BuildContext context) {
    return EqCard(
      child: SizedBox(
        width: 200.0,
        height: 200.0,
        child: PageView.builder(
          itemCount: null,
          itemBuilder: (context, i) {
            print(i);
            return Container(
              width: 200.0,
              height: 200.0,
              color: i % 2 == 0
                  ? EqThemes.defaultLightTheme.primary.shade500
                  : EqThemes.defaultLightTheme.success.shade500,
            );
          },
        ),
      ),
    );
  }
}
