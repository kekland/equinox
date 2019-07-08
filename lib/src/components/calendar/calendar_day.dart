import 'package:equinox/equinox.dart';
import 'package:equinox/src/components/text/text_params.dart';
import 'package:flutter/material.dart';

class CalendarDay extends StatelessWidget {
  final int number;
  final bool workingDay;
  final bool disabled;

  const CalendarDay({
    Key key,
    this.number,
    this.workingDay = true,
    this.disabled = false,
  }) : super(key: key);

  TextState getTextState() {
    if (disabled && workingDay) return TextState.disabled;
    else if (disabled && !workingDay) return TextState.dangerDisabled;
    else if (!disabled && workingDay) return TextState.basic;
    else if (!disabled && !workingDay) return TextState.danger;
    else return TextState.basic;
  }

  @override
  Widget build(BuildContext context) {
    var theme = EqTheme.of(context);
    return Container(
      constraints: BoxConstraints(minWidth: 32.0, maxWidth: 42.0),
      height: 42.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(theme.borderRadius),
      ),
      alignment: Alignment.center,
      child: EqText.paragraph1(
        number.toString(),
        context: context,
        state: getTextState(),
        style: (disabled) ? null : TextStyle(fontWeight: FontWeight.w500),
      ),
    );
  }
}
