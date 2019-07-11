import 'package:equinox/equinox.dart';
import 'package:equinox/src/components/calendar/calendar_scrollable.dart';
import 'package:flutter/material.dart';

class EqCalendarSelectDay extends StatefulWidget {
  final void Function(DateTime) onSelected;
  final DateTime selectedDate;

  EqCalendarSelectDay({
    Key key,
    this.onSelected,
    this.selectedDate,
  }) : super(key: key);
  @override
  _EqCalendarSelectDayState createState() => _EqCalendarSelectDayState();
}

class _EqCalendarSelectDayState extends State<EqCalendarSelectDay> {
  DateTime today;
  DateTime month;

  @override
  void initState() {
    today = DateTime.now();
    today = DateTime(today.year, today.month, 1);
    month = today;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = EqTheme.of(context);
    var localizations = MaterialLocalizations.of(context);
    var monthYear = localizations.formatMonthYear(month);

    return EqCard(
      statusAppearance: CardStatusAppearance.none,
      child: Center(
        widthFactor: 1.0,
        heightFactor: 1.0,
        child: ScrollableCalendar(
          onChanged: (dateTime) => setState(() => month = dateTime),
          defaultDate: today,
        ),
      ),
    );
  }
}
