import 'package:flutter/material.dart';
import 'package:travanix/core/styles/colors.dart';

ThemeData themeData = ThemeData(
  // useMaterial3: false,
  colorSchemeSeed: basicColor,
  // timePickerTheme: TimePickerThemeData(
  //     cancelButtonStyle: const ButtonStyle(
  //       foregroundColor: MaterialStatePropertyAll(basicColor),
  //     ),
  //     dialTextColor: navyBlueColor,
  //     backgroundColor: seaShellPeach,
  //     dialBackgroundColor: seaShellPeach.withOpacity(0.0),
  //     dialHandColor: basicColor,
  //     // hourMinuteColor: navyBlueColor,
  //     hourMinuteTextColor: whiteColor),
  inputDecorationTheme: const InputDecorationTheme(
    focusColor: basicColor,
    border: OutlineInputBorder(),
  ),
);
