import 'package:equinox/equinox.dart';
import 'package:flutter/material.dart';

class EqCalendarMonth extends StatelessWidget {
  final DateTime date;

  const EqCalendarMonth({
    Key key,
    this.date,
  }) : super(key: key);

  Row buildDaysRow(List<DateTime> time) {
    List<Widget> widgets = [];
  }

  @override
  Widget build(BuildContext context) {
    var localizations = MaterialLocalizations.of(context);
    var monthYear = localizations.formatMonthYear(date);
    bool sundayIsFirstWeekday =
        !EqCalendarCalculations.isSundayFirstWeekday(localizations);

    var weeks = EqCalendarCalculations.getWeeks(
      date: date,
      sundayIsFirstWeekday: sundayIsFirstWeekday,
    );

    return EqCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EqText.heading4(monthYear, context: context),
          CalendarWeekdays(
            sundayIsFirstWeekday: sundayIsFirstWeekday,
          ),
          for (final week in weeks)
            EqCalendarWeek(days: week, month: date.month),
        ],
      ),
    );
  }
}
