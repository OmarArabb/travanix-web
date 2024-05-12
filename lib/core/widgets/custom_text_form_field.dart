import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.text,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.prefixIcon,
    required this.controller,
  });

  final String text;
  final IconData? prefixIcon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onSaved: onSaved,
      onChanged: onChanged,
      validator: validator,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefix: Icon(prefixIcon),
        contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
        labelText: text,
      ),
    );
  }
}
