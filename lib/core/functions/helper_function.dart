import 'package:flutter/material.dart';

String time12to24Format(String time) {
  int h = int.parse(time.split(":").first);
  int m = int.parse(time.split(":").last.split(" ").first);
  String meridium = time.split(":").last.split(" ").last.toLowerCase();
  if (meridium == "pm") {
    if (h != 12) {
      h = h + 12;
    }
  }
  if (meridium == "am") {
    if (h == 12) {
      h = 00;
    }
  }
  String newTime = "${h == 0 ? "00" : h}:${m == 0 ? "00" : m}:00";

  return newTime;
}


InputBorder buildInputBorder() {
  return InputBorder.none;
}

String? validateTextField(String? value) {
  if (value!.isEmpty) {
    return 'Please fill this field';
  }
  return null;
}