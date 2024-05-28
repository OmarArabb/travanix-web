import 'package:flutter/material.dart';
import 'package:travanix/core/styles/colors.dart';

class SecretTextFormField extends StatefulWidget {
  const SecretTextFormField({
    super.key,
    this.validator,
    required this.obscureText,
    this.suffixIcon,
    this.prefixIcon,
    this.onPressedSuffixIcon,
    required this.text,
    required this.controller, this.focusedBorder,
  });

  final String? Function(String?)? validator;
  final TextEditingController controller;
  final ValueNotifier<bool> obscureText;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final void Function()? onPressedSuffixIcon;
  final InputBorder? focusedBorder;

  final String text;

  @override
  State<SecretTextFormField> createState() => _SecretTextFormFieldState();
}

class _SecretTextFormFieldState extends State<SecretTextFormField> {
  @override
  void initState() {
    widget.obscureText.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    widget.obscureText.removeListener(() { });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.obscureText.value,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        floatingLabelStyle: const TextStyle(color: basicColor),
        fillColor: whiteColor,
        filled: true,
        focusedBorder: widget.focusedBorder,
        suffix: IconButton(
          icon: widget.obscureText.value
              ? const Icon(Icons.remove_red_eye_sharp)
              : const Icon(Icons.visibility_off_sharp),
          onPressed: widget.onPressedSuffixIcon,
        ),
        prefix: Icon(widget.prefixIcon,),
        contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
        labelText: widget.text,
      ),
    );
  }
  OutlineInputBorder buildOutlineInputBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(
        color: basicColor,
      ),
    );
  }
}