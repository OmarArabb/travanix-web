import 'package:flutter/material.dart';
import 'package:travanix/core/styles/colors.dart';
import 'package:travanix/core/styles/text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      this.text,
      this.filledColor = whiteColor,
      this.validator,
      this.onChanged,
      this.onSaved,
      this.prefixIcon,
      required this.controller,
      this.focusedBorder,
      this.enabledBorder,
      this.hintText,
      this.maxLines = 1});

  final String? text;
  final String? hintText;
  final int? maxLines;

  final IconData? prefixIcon;
  final Color? filledColor;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      controller: controller,
      onSaved: onSaved,
      onChanged: onChanged,
      validator: validator,
      textInputAction: TextInputAction.next,
      cursorColor: navyBlueColor,
      decoration: InputDecoration(
        fillColor: filledColor,
        filled: true,
        hintText: hintText,
        hintStyle: AppTextStyles.styleRegular14().copyWith(
          fontWeight: FontWeight.w700,
        ),
        floatingLabelStyle: const TextStyle(color: basicColor),
        prefix: prefixIcon != null ? Icon(prefixIcon) : null,
        focusedBorder: focusedBorder,
        enabledBorder: enabledBorder,
        contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
        labelText: text,
      ),
    );
  }
}
