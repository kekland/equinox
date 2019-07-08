import 'package:equinox/equinox.dart';
import 'package:flutter/material.dart';

class EqCalendarWeek extends StatelessWidget {
  final List<DateTime> days;
  final int month;

  const EqCalendarWeek({Key key, this.days, this.month}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: days
          .map(
            (day) => Flexible(
                  child: CalendarDay(
                    disabled: day.month != month,
                    workingDay: (day.weekday != DateTime.saturday &&
                        day.weekday != DateTime.sunday),
                    number: day.day,
                  ),
                ),
          )
          .toList(),
    );
  }
}
