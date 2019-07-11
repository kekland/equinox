import 'package:flutter/material.dart';

class EqCalendarCalculations {
  static bool isSundayFirstWeekday(MaterialLocalizations localizations) {
    return localizations.firstDayOfWeekIndex == 0;
  }

  static List<List<DateTime>> getWeeks(
      {DateTime date, bool sundayIsFirstWeekday = true}) {
    final firstDayOfThisMonth = DateTime(date.year, date.month, 1);
    final daysInThisMonth = DateTime(date.year, date.month + 1, 0).day;
    final firstDayWeekday = DateTime(date.year, date.month, 1).weekday;

    List<DateTime> days = [];
    List<List<DateTime>> weeks = [[]];

    // Add days that are before this month
    int daysToAddBeforeThisMonth =
        (sundayIsFirstWeekday) ? firstDayWeekday % 7 : firstDayWeekday - 1;

    for (int i = 1; i <= daysToAddBeforeThisMonth; i++) {
      days.insert(0, firstDayOfThisMonth.add(Duration(days: -i)));
    }

    // Add days that are in this month
    for (int i = 0; i < daysInThisMonth; i++) {
      days.add(firstDayOfThisMonth.add(Duration(days: i)));
    }

    // Add days that are after this math
    DateTime lastDay = days.last;
    int daysToAddAfter = (days.length / 7.0).ceil() * 7 - days.length;

    for (int i = 0; i < daysToAddAfter; i++) {
      days.add(lastDay.add(Duration(days: i + 1)));
    }

    // Calculate the weeks
    for (final day in days) {
      if (weeks.last.length == 7) weeks.add([]);
      weeks.last.add(day);
    }

    return weeks;
  }
}
