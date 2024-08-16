import 'package:flutter/material.dart';
import 'package:travanix/core/styles/text_styles.dart';
import 'package:travanix/core/widgets/custom_text_form_field.dart';
import 'package:travanix/presentation/manger/home_layout_cubit/home_layout_cubit.dart';
import 'package:travanix/presentation/manger/update_item/cubit.dart';
import 'package:travanix/presentation/views/create_items/widgets/custom_dropdown_textfield.dart';

class LocationSection extends StatefulWidget {
  const LocationSection({
    super.key,
    required this.itemName,
  });

  final String itemName;

  @override
  State<LocationSection> createState() => _LocationSectionState();
}

class _LocationSectionState extends State<LocationSection> {

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    UpdateItemCubit cubit = UpdateItemCubit.get(context);

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
            '${widget.itemName} Location',
            style: AppTextStyles.styleRegular14()
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 6.0, top: 6),
                  child: CustomDropDownTextField(
                    filledColor: Colors.grey[200]!,
                    hint: 'Select Country',
                    onChanged: (value) async {
                      selectedValue = null;
                      cubit.citiesModel = null;
                      cubit.countryId = int.parse(value);
                      await cubit.getCityById(cubit.countryId);
                      setState(() {});
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Please fill this field';
                      }
                      return null;
                    },
                    items: HomeLayoutCubit.get(context).countryModel != null
                        ? HomeLayoutCubit.get(context).countryModel!.data!.map((e) {
                      return DropdownMenuItem<String>(
                        value: e.id.toString(),
                        child: Text(e.nationName!),
                      );
                    }).toList()
                        : [],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 6.0, top: 6),
                  child: CustomDropDownTextField(
                    filledColor: Colors.grey[200]!,
                    hint: 'Select City',
                    value: selectedValue,
                    onChanged: (value) {
                      selectedValue = value;
                      cubit.cityId = int.parse(value);
                      setState(() {});
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Please fill this field';
                      }
                      return null;
                    },
                    items: cubit.citiesModel != null
                        ? cubit.citiesModel!.data!.map((e) {
                      return DropdownMenuItem<String>(
                        value: e.id.toString(),
                        child: Text(e.cityName!),
                      );
                    }).toList()
                        : [],
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
              controller: cubit.addressController,
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
                    controller: cubit.coordinateXController,
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
                    controller: cubit.coordinateYController,
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
