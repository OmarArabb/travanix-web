import 'package:flutter/material.dart';
import 'package:travanix/core/functions/helper_function.dart';
import 'package:travanix/core/styles/text_styles.dart';
import 'package:travanix/core/widgets/custom_text_form_field.dart';
import 'package:travanix/presentation/manger/create_items_cubit/cubit.dart';

class InformationSection extends StatelessWidget {
  const InformationSection({
    super.key,
    required this.itemType,
    this.additional,
  });

  final String itemType;
  final List<Widget>? additional;

  @override
  Widget build(BuildContext context) {
    CreateItemsCubit cubit = CreateItemsCubit.get(context);

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
            '$itemType Information',
            style: AppTextStyles.styleRegular14()
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6.0, top: 6),
            child: CustomTextFormField(
              hintText: '$itemType Name',
              validator: validateTextField,
              enabledBorder: buildInputBorder(),
              focusedBorder: buildInputBorder(),
              filledColor: Colors.grey[200],
              controller: cubit.nameController,
            ),
          ),

          if(additional != null)
          for(Widget widget in additional!)
            widget,
          Padding(
            padding: const EdgeInsets.only(left: 6.0, top: 6),
            child: CustomTextFormField(
              hintText: 'About $itemType',
              validator: validateTextField,
              enabledBorder: buildInputBorder(),
              focusedBorder: buildInputBorder(),
              filledColor: Colors.grey[200],
              maxLines: null,
              controller: cubit.aboutController,
            ),
          ),
        ],
      ),
    );
  }

  InputBorder buildInputBorder() {
    return InputBorder.none;
  }
}
