import 'package:equinox/equinox.dart';
import 'package:flutter/material.dart';

class EqCalendarWeek extends StatelessWidget {
  final List<DateTime> days;
  final int month;
  final Function(DateTime) onSelected;
  final DateTime selectedDate;

  const EqCalendarWeek({
    Key key,
    this.days,
    this.month,
    this.onSelected,
    this.selectedDate,
  }) : super(key: key);

  bool isDaySelected(DateTime date) {
    if(selectedDate != null) {
      return date.day == selectedDate.day && date.month == selectedDate.month && date.year == selectedDate.year;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: days
          .map(
            (day) => Flexible(
                  child: EqCalendarDay(
                    disabled: day.month != month,
                    workingDay: (day.weekday != DateTime.saturday &&
                        day.weekday != DateTime.sunday),
                    date: day,
                    selected: isDaySelected(day),
                    onSelected:
                        onSelected != null ? () => onSelected(day) : null,
                  ),
                ),
          )
          .toList(),
    );
  }
}
