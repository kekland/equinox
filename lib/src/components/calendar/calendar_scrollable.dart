import 'package:equinox/equinox.dart';
import 'package:equinox/src/equinox_internal.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ScrollableCalendar extends StatefulWidget {
  final DateTime defaultDate;
  final void Function(DateTime) onChanged;

  const ScrollableCalendar({
    Key key,
    this.defaultDate,
    this.onChanged,
  }) : super(key: key);
  @override
  _ScrollableCalendarState createState() => _ScrollableCalendarState();
}

class _ScrollableCalendarState extends State<ScrollableCalendar> {
  PageController controller = PageController(initialPage: 150);
  int currentIndex = 150;

  DateTime getDateWithAddedMonth(int index) {
    return DateTime(widget.defaultDate.year, widget.defaultDate.month + index);
  }

  double calculatePageHeight() {
    var localizations = MaterialLocalizations.of(context);

    bool sundayIsFirstWeekday =
        !EqCalendarCalculations.isSundayFirstWeekday(localizations);

    List weeks = EqCalendarCalculations.getWeeks(
      date: getDateWithAddedMonth(currentIndex),
      sundayIsFirstWeekday: sundayIsFirstWeekday,
    );
    print(weeks.length);
    return 32.0 + weeks.length * 42.0;
  }

  void onPageChanged(int index) {
    currentIndex = index;
    setState(() {});

    if (widget.onChanged != null) {
      widget.onChanged(getDateWithAddedMonth(index));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = EqTheme.of(context);

    return AnimatedContainer(
      duration: theme.minorAnimationDuration,
      curve: theme.minorAnimationCurve,
      constraints: BoxConstraints(
        minWidth: 32.0 * 7,
        maxWidth: 42.0 * 7,
      ),
      height: calculatePageHeight(),
      child: PageView.builder(
        itemCount: null,
        onPageChanged: onPageChanged,
        controller: controller,
        itemBuilder: (context, index) {
          return ClipRect(
            clipper: _CalendarClipper(calculatePageHeight()),
            child: EqCalendarMonth(
              displayHeader: false,
              date: getDateWithAddedMonth(index),
            ),
          );
        },
      ),
    );
  }
}

class _CalendarClipper extends CustomClipper<Rect> {
  final double height;

  _CalendarClipper(this.height);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0.0, 0.0, size.width, height);
  }

  @override
  bool shouldReclip(_CalendarClipper oldClipper) => height != oldClipper.height;
}