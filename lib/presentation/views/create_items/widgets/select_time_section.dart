import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travanix/core/functions/time_picker.dart';
import 'package:travanix/core/widgets/custom_text_form_field.dart';
import 'package:travanix/presentation/manger/create_items_cubit/cubit.dart';

class SelectTimeSection extends StatelessWidget {
  const SelectTimeSection({super.key, required this.cubit});

  final CreateItemsCubit cubit ;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 6.0, top: 6),
            child: CustomTextFormField(
              controller: cubit.openingTimeController,
              validator: validateTextField,
              hintText: 'Opening Time',
              enabledBorder: buildInputBorder(),
              focusedBorder: buildInputBorder(),
              filledColor: Colors.grey[200],
              inputFormatters: [
                LengthLimitingTextInputFormatter(8),
                FilteringTextInputFormatter.allow(
                    RegExp(r'^[0-9:]+$'))
              ],
              onTap: (){
                showTime(context).then((value) {
                  value != null ? cubit.openingTimeController.text =
                      time12to24Format(
                          value.format(context)) : null;
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 6.0, top: 6),
            child: CustomTextFormField(
              controller: cubit.closingTimeController,
              validator: validateTextField,
              hintText: 'Closing Time',
              inputFormatters: [
                LengthLimitingTextInputFormatter(8),
                FilteringTextInputFormatter.allow(
                    RegExp(r'^[0-9:]+$'))
              ],
              enabledBorder: buildInputBorder(),
              focusedBorder: buildInputBorder(),
              filledColor: Colors.grey[200],
              onTap: (){
                showTime(context).then((value) {
                  value != null ? cubit.closingTimeController.text =
                      time12to24Format(
                          value.format(context)) : null;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
  String? validateTextField(String? value) {
    if (value!.isEmpty) {
      return 'Please fill this field';
    }
    return null;
  }

  String time12to24Format(String time) {
    int h = int.parse(time.split(":").first);
    int m = int.parse(time.split(":").last.split(" ").first);
    String meridium = time.split(":").last.split(" ").last.toLowerCase();
    if (meridium == "pm") {
      if (h != 12) {
        h = h + 12;
      }
    }
    if (meridium == "am") {
      if (h == 12) {
        h = 00;
      }
    }
    String newTime = "${h == 0 ? "00" : h}:${m == 0 ? "00" : m}:00";

    return newTime;
  }

  InputBorder buildInputBorder() {
    return InputBorder.none;
  }
}