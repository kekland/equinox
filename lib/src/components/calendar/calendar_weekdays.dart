import 'package:equinox/equinox.dart';
import 'package:flutter/material.dart';

class EqCalendarWeekdays extends StatelessWidget {
  final bool sundayIsFirstWeekday;

  const EqCalendarWeekdays({
    Key key,
    this.sundayIsFirstWeekday = true,
  }) : super(key: key);

  bool isColored(int index) {
    if (sundayIsFirstWeekday)
      return index == 0 || index == 6;
    else
      return index == 5 || index == 6;
  }

  @override
  Widget build(BuildContext context) {
    var theme = EqTheme.of(context);
    var localizations = MaterialLocalizations.of(context);
    var weekdays = List.from(localizations.narrowWeekdays);

    if (!sundayIsFirstWeekday) {
      var sunday = weekdays[0];
      weekdays.removeAt(0);
      weekdays.add(sunday);
    }

    return Container(
      child: Row(
          mainAxisSize: MainAxisSize.min,
          children: weekdays.map((weekdayName) {
            int index = weekdays.indexOf(weekdayName);
            bool colored = isColored(index);
            return Flexible(
              child: Container(
                constraints: BoxConstraints(minWidth: 32.0, maxWidth: 42.0),
                height: 32.0,
                alignment: Alignment.center,
                child: EqText.paragraph1(
                  weekdayName,
                  context: context,
                  state: colored ? TextState.danger : TextState.hint,
                ),
              ),
            );
          }).toList()),
    );
  }
}
