import 'package:equinox/equinox.dart';
import 'package:flutter/material.dart';

class CalendarShowcase extends StatefulWidget {
  @override
  _CalendarShowcaseState createState() => _CalendarShowcaseState();
}

class _CalendarShowcaseState extends State<CalendarShowcase> {
  @override
  Widget build(BuildContext context) {
    return EqLayout(
      child: Center(
        child: EqCalendar(),
      ),
    );
  }
}