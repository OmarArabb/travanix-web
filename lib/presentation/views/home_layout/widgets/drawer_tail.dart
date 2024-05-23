import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travanix/core/generated/assets.dart';
import 'package:travanix/core/styles/colors.dart';

class DrawerTail extends StatelessWidget {
  const DrawerTail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(
          width: 4,
        ),
        Opacity(
          opacity: 0.75,
          child: Image.asset(
            Assets.imagesLogo,
            color: whiteColor,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 6.0),
          child: Text(
            'T R A V A N I X',
            style: GoogleFonts.italiana().copyWith(
                color: whiteColor,
                fontWeight: FontWeight.w500,
                fontSize: 20,
                wordSpacing: 0.5,
                fontStyle: FontStyle.italic
            ),
          ),
        ),
      ],
    );
  }
}