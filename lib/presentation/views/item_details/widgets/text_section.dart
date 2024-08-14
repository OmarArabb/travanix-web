import 'package:flutter/material.dart';

class TextSection extends StatelessWidget {
  const TextSection({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.6,
        child: Text(
          text,
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}