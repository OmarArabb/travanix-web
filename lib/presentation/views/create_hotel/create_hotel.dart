import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travanix/core/styles/text_styles.dart';
import 'package:travanix/core/widgets/custom_text_form_field.dart';

class CreateNewHotel extends StatelessWidget {
  const CreateNewHotel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'New Hotel',
          style: AppTextStyles.styleSemiBold24(),
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          children: [
            Expanded(
              flex: 6,
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: TextEditingController(),
                    text: 'Name',
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            const Expanded(flex: 5, child: Column()),
          ],
        ),
      ],
    );
  }
}
