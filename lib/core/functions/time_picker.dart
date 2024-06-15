import 'package:flutter/material.dart';

Future<TimeOfDay?> showTime(BuildContext context) {
  return showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
    builder: (context, child) {
      return Theme(
        data: Theme.of(context),
        child: MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(
              alwaysUse24HourFormat:
              true),
          child: child!,
        ),
      );
    },
  );
}