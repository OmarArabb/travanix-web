import 'package:flutter/material.dart';
import 'package:travanix/core/styles/text_styles.dart';
import 'package:travanix/core/widgets/custom_text_form_field.dart';
import 'package:travanix/presentation/views/create_items/widgets/custom_dropdown_textfield.dart';

class LocationSection extends StatelessWidget {
  const LocationSection({
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
            'Hotel Location',
            style: AppTextStyles.styleRegular14()
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 6.0, top: 6),
                  child: CustomDropDownTextField(
                    hint: 'Select Country',
                    onChanged: (value) {},
                    validator: (value) {
                      if (value == null) {
                        return 'Please fill this field';
                      }
                      return null;
                    },
                    items: ['a', 'b', 'c'].map((e) {
                      return DropdownMenuItem<String>(
                        value: e,
                        child: Text(e),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 6.0, top: 6),
                  child: CustomDropDownTextField(
                    hint: 'Select City',
                    onChanged: (value) {},
                    validator: (value) {
                      if (value == null) {
                        return 'Please fill this field';
                      }
                      return null;
                    },
                    items: [],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6.0, top: 6),
            child: CustomTextFormField(
              validator: validateTextField,
              hintText: 'Hotel Address',
              enabledBorder: buildInputBorder(),
              focusedBorder: buildInputBorder(),
              filledColor: Colors.grey[200],
              controller: TextEditingController(),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 6.0, top: 6),
                  child: CustomTextFormField(
                    hintText: 'Coordinate X',
                    validator: validateTextField,
                    enabledBorder: buildInputBorder(),
                    focusedBorder: buildInputBorder(),
                    filledColor: Colors.grey[200],
                    controller: TextEditingController(),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 6.0, top: 6),
                  child: CustomTextFormField(
                    hintText: 'Coordinate Y',
                    validator: validateTextField,
                    enabledBorder: buildInputBorder(),
                    focusedBorder: buildInputBorder(),
                    filledColor: Colors.grey[200],
                    controller: TextEditingController(),
                  ),
                ),
              ),
            ],
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
