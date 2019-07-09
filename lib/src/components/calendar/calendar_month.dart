import 'package:equinox/equinox.dart';
import 'package:flutter/material.dart';

class EqCalendarMonth extends StatelessWidget {
  final DateTime date;
  final DateTime selectedDate;
  final void Function(DateTime) onSelected;
  final bool displayHeader;

  const EqCalendarMonth({
    Key key,
    this.date,
    this.selectedDate,
    this.onSelected,
    this.displayHeader = true,
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (displayHeader) EqText.heading4(monthYear),
        EqCalendarWeekdays(
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
    );
  }
}
