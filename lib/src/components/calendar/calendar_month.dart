import 'package:equinox/equinox.dart';
import 'package:flutter/material.dart';

class EqCalendarMonth extends StatelessWidget {
  final DateTime date;
  final DateTime selectedDate;
  final void Function(DateTime) onSelected;

  const EqCalendarMonth({
    Key key,
    this.date,
    this.selectedDate,
    this.onSelected,
  }) : super(key: key);

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
            EqCalendarWeek(
              days: week,
              month: date.month,
              onSelected: onSelected,
              selectedDate: selectedDate,
            ),
        ],
      ),
    );
  }
}
