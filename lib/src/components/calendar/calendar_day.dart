import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';

class CalendarDay extends StatefulWidget {
  final DateTime date;
  final bool workingDay;
  final bool disabled;
  final bool selected;
  final VoidCallback onSelected;

  const CalendarDay({
    Key key,
    this.date,
    this.workingDay = true,
    this.disabled = false,
    this.selected = false,
    this.onSelected,
  }) : super(key: key);

  @override
  _CalendarDayState createState() => _CalendarDayState();
}

class _CalendarDayState extends State<CalendarDay> {
  bool outlined = false;

  bool get isToday {
    var today = DateTime.now().toLocal();

    return widget.date.day == today.day &&
        widget.date.month == today.month &&
        widget.date.year == today.year;
  }

  TextState getTextState() {
    if (widget.disabled && isToday) {
      return TextState.primaryDisabled;
    } else if (!widget.disabled && isToday) {
      return TextState.primary;
    } else if (widget.disabled)
      return TextState.disabled;
    else if (widget.workingDay)
      return TextState.basic;
    else if (!widget.workingDay)
      return TextState.danger;
    else
      return TextState.basic;
  }

  TextStyle getTextStyle() {
    if (widget.selected)
      return TextStyle(color: Colors.white, fontWeight: FontWeight.w500);

    return (widget.disabled) ? null : TextStyle(fontWeight: FontWeight.w500);
  }

  Color getBackground(EqThemeData theme) {
    return (widget.selected) ? theme.primary.shade500 : null;
  }

  @override
  Widget build(BuildContext context) {
    var theme = EqTheme.of(context);
    return OutlinedWidget(
      outlined: outlined,
      borderRadius: BorderRadius.circular(theme.borderRadius),
      child: OutlinedGestureDetector(
        onTap: widget.onSelected,
        onOutlineChange: (v) => setState(() => outlined = v),
        child: Container(
          constraints: BoxConstraints(minWidth: 32.0, maxWidth: 42.0),
          height: 42.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(theme.borderRadius),
            color: getBackground(theme),
          ),
          alignment: Alignment.center,
          child: EqText.paragraph1(
            widget.date.day.toString(),
            context: context,
            state: getTextState(),
            style: getTextStyle(),
          ),
        ),
      ),
    );
  }
}
