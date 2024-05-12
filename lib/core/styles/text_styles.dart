import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static TextStyle styleRegular16(context) {
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleBold16() {
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleMedium16() {
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleMedium20() {
    return const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleSemiBold16() {
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold20() {
    return const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleRegular12() {
    return const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleSemiBold24() {
    return const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleRegular14() {
    return const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleSemiBold18() {
    return const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
    );
  }
}