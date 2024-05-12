import 'package:flutter/material.dart';

const Color basicColor=Color(0xffff7122);
const Color navyBlueColor=Color(0xFF17273D);
const Color blackColor=Color(0xff000000);
const Color greyColor=Color(0xffaaaaaa);
const Color seaShellPeach = Color(0xfffff5ee);
const Color whiteColor = Colors.white;

MaterialColor basiColor = buildMaterialColor(const Color(0xffff7122));

MaterialColor buildMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value,swatch);
}