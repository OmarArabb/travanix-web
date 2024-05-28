import 'package:flutter/material.dart';
import 'package:travanix/core/styles/text_styles.dart';
import 'package:travanix/core/widgets/custom_text_form_field.dart';
import 'package:travanix/presentation/views/create_items/widgets/custom_dropdown_textfield.dart';

class InformationSection extends StatelessWidget {
  const InformationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: Colors.grey[400]!, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hotel Information',
            style: AppTextStyles.styleRegular14()
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6.0, top: 6),
            child: CustomTextFormField(
              hintText: 'Hotel Name',
              validator: validateTextField,
              enabledBorder: buildInputBorder(),
              focusedBorder: buildInputBorder(),
              filledColor: Colors.grey[200],
              controller: TextEditingController(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6.0, top: 6),
            child: CustomDropDownTextField(
                hint: 'Hotel Class',
                onChanged: (value) {},
                validator:  (value) {
                  if (value == null) {
                    return 'Please fill this field';
                  }
                  return null;
                },
                items: [1, 2, 3, 4, 5].map((e) {
                  List<Widget> list = [];
                  for (var i = 0; i < e; i++) {
                    list.add(const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ));
                  }
                  return DropdownMenuItem(
                    value: e,
                    child: Row(
                      children: list,
                    ),
                  );
                }).toList()),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6.0, top: 6),
            child: CustomTextFormField(
              hintText: 'About Hotel',
              validator: validateTextField,
              enabledBorder: buildInputBorder(),
              focusedBorder: buildInputBorder(),
              filledColor: Colors.grey[200],
              maxLines: null,
              controller: TextEditingController(),
            ),
          ),
        ],
      ),
    );
  }

  String? validateTextField(String? value) {
    if (value!.isEmpty) {
      return 'Please fill this field';
    }
    return null;
  }

  InputBorder buildInputBorder() {
    return InputBorder.none;
  }
}
