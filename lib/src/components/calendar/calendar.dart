import 'package:equinox/src/components/calendar/calendar_month.dart';
import 'package:flutter/cupertino.dart';

export 'package:equinox/src/components/calendar/calendar_calculations.dart';
export 'package:equinox/src/components/calendar/calendar_day.dart';
export 'package:equinox/src/components/calendar/calendar_month.dart';
export 'package:equinox/src/components/calendar/calendar_week.dart';
export 'package:equinox/src/components/calendar/calendar_weekdays.dart';
export 'package:equinox/src/components/calendar/calendar_select_day.dart';

class EqCalendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: EqCalendarMonth(
        date: DateTime(2019, 7),
      ),
    );
  }
}