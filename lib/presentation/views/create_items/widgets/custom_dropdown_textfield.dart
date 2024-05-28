import 'package:flutter/material.dart';
import 'package:travanix/core/styles/text_styles.dart';

class CustomDropDownTextField extends StatelessWidget {
  const CustomDropDownTextField({
    super.key,
    required this.hint,
    required this.onChanged,
    required this.items, this.validator,
  });

  final String hint;
  final void Function(dynamic)? onChanged;
  final List<DropdownMenuItem> items;
  final String? Function(dynamic)? validator;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      validator: validator,
      onTap: () {},
      hint: Text(
        hint,
        style: AppTextStyles.styleRegular14().copyWith(
          fontWeight: FontWeight.w700,
        ),
      ),
      decoration: InputDecoration(
          fillColor: Colors.grey[200],
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