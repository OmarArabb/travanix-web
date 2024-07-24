import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/core/functions/helper_function.dart';
import 'package:travanix/core/functions/toast.dart';
import 'package:travanix/core/styles/colors.dart';
import 'package:travanix/core/styles/text_styles.dart';
import 'package:travanix/core/widgets/custom_material_button.dart';
import 'package:travanix/core/widgets/custom_text_form_field.dart';
import 'package:travanix/presentation/manger/create_items_cubit/cubit.dart';
import 'package:travanix/presentation/manger/create_items_cubit/states.dart';
import 'package:travanix/presentation/views/create_items/widgets/add_images_section.dart';
import 'package:travanix/presentation/views/create_items/widgets/custom_dropdown_textfield.dart';
import 'package:travanix/presentation/views/create_items/widgets/information_section.dart';
import 'package:travanix/presentation/views/create_items/widgets/location_section.dart';
import 'package:travanix/presentation/views/create_items/widgets/select_facilities_section.dart';

class CreateNewHotel extends StatelessWidget {
  const CreateNewHotel({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();

    return BlocProvider(
      create: (context) => CreateItemsCubit()
        ..getServices(),
      child: BlocConsumer<CreateItemsCubit, CreateItemsStates>(
        listener: (context, state) {
          if (state is ErrorToAddMultiImagesState) {
            errorToast(state.errorMessage);
          } else if (state is ErrorGetCountryState) {
            errorToast(state.errorMessage);
          } else if (state is ErrorGetServicesState) {
            errorToast(state.errorMessage);
          }else if(state is SuccessCreateHotelState){
            successToast(state.successMessage);
          }
        },
        builder: (context, state) {
          CreateItemsCubit cubit = CreateItemsCubit.get(context);

          int? hotelClassValue;

          List<Widget> additional = [
            Padding(
              padding: const EdgeInsets.only(left: 6.0, top: 6),
              child: CustomTextFormField(
                hintText: 'Hotel Number',
                validator: validateTextField,
                enabledBorder: buildInputBorder(),
                focusedBorder: buildInputBorder(),
                filledColor: Colors.grey[200],
                controller: cubit.phoneNumberController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6.0, top: 6),
              child: CustomDropDownTextField(
                  hint: 'Hotel Class',
                  value: hotelClassValue,
                  onChanged: (value) {
                    cubit.rate = value;
                  },
                  validator: (value) {
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
          ];

          return Form(
            key: formKey,
            child: Column(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 6,
                      child: Column(
                        children: [
                          InformationSection(
                            itemType: 'Hotel',
                            additional: additional,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          SelectFacilitiesSection(cubit: cubit),
                          const SizedBox(
                            height: 16,
                          ),
                          const LocationSection(
                            itemName: 'Hotel',
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          if(state is ! LoadingCreateHotelState)
                          CustomMaterialButton(
                            child: const Text('Create',style: TextStyle(color: whiteColor),),
                            onPressed: () {
                              if(!formKey.currentState!.validate() || cubit.pickedImages.isEmpty || cubit.selectedFacilities.isEmpty){
                                errorToast('Please Fill The Empty Field');
                              }else if(formKey.currentState!.validate()){
                                cubit.createHotel().then((value){
                                  cubit.reInitialize();
                                });
                              }
                            },
                          ),
                          if(state is LoadingCreateHotelState)
                            const CircularProgressIndicator(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          AddImagesSection(
                            cubit: cubit,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

}
