import 'package:flutter/material.dart';
import 'package:travanix/core/styles/colors.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({
    super.key,
    this.formKey,
    required this.child,
    this.width = 376,
    this.height = 50, required this.onPressed, this.color = basicColor,
  });

  final GlobalKey<FormState>? formKey;
  final void Function() onPressed;
  final Widget child;
  final double width;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: width,
      height: height,
      color: color,
      child: child,);
  }
}