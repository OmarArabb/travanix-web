import 'package:flutter/material.dart';
import 'package:travanix/core/styles/text_styles.dart';

class CustomDropDownTextField extends StatelessWidget {
  const CustomDropDownTextField({
    super.key,
    this.hint,
    required this.onChanged,
    required this.items, this.validator, this.onTap, this.value, required this.filledColor,
  });

  final String? hint;
  final void Function(dynamic)? onChanged;
  final List<DropdownMenuItem> items;
  final String? Function(dynamic)? validator;
  final void Function()? onTap;
  final dynamic value;
  final Color filledColor ;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: value,
      isExpanded: true,
      validator: validator,
      onTap: onTap,
      hint: hint != null ?  Text(
        hint!,
        style: AppTextStyles.styleRegular14().copyWith(
          fontWeight: FontWeight.w700,
        ),
      ) : null,
      decoration: InputDecoration(
          fillColor: filledColor,
          filled: true,
          border: InputBorder.none,
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red))),
      icon: const Icon(Icons.expand_more),
      items: items,
      onChanged: onChanged,
    );
  }
}