import 'package:equinox/src/components/calendar/calendar_month.dart';
import 'package:flutter/cupertino.dart';

class EqCalendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: EqCalendarMonth(
        date: DateTime(2020, 7),
      ),
    );
  }
}