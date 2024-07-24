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
import 'package:travanix/presentation/views/create_items/widgets/select_time_section.dart';

class CreateRestaurant extends StatelessWidget {
  const CreateRestaurant({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();

    return BlocProvider<CreateItemsCubit>(
      create: (context) => CreateItemsCubit(),
      child: BlocConsumer<CreateItemsCubit, CreateItemsStates>(
        listener: (context, state) {
          if (state is ErrorToAddMultiImagesState) {
            errorToast(state.errorMessage);
          }else if (state is ErrorGetCountryState) {
            errorToast(state.errorMessage);
          } else if(state is SuccessCreateRestaurantState){
            successToast(state.successMessage);
          }
        },
        builder: (context, state) {
          CreateItemsCubit cubit = CreateItemsCubit.get(context);
          List<String> foodTypes = ['Syrian', 'Chinese', 'Japanese'];

          List<Widget> additional = [
            Padding(
              padding: const EdgeInsets.only(left: 6.0, top: 6),
              child: CustomTextFormField(
                hintText: 'Restaurant Number',
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
                  hint: 'Select food type',
                  validator: (value) {
                    return value == null ? 'Please fill this field' : null;
                  },
                  onChanged: (value) {
                    cubit.foodType = value;
                  },
                  items: foodTypes.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    );
                  }).toList()),
            ),
            SelectTimeSection(cubit: cubit),
          ];

          return Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'New Restaurant',
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
                            itemType: 'Restaurant',
                            additional: additional,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const LocationSection(
                            itemName: 'Restaurant',
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          if(state is ! LoadingCreateRestaurantState)
                          CustomMaterialButton(
                            // width: 200,
                            child: const Text('Create',style: TextStyle(color: whiteColor),),
                            onPressed: () {
                              if(!formKey.currentState!.validate() || cubit.pickedImages.isEmpty){
                                errorToast('Please Fill The Empty Field');
                              }else if(formKey.currentState!.validate()){
                                cubit.createRestaurant().then((value){
                                  cubit.reInitialize();
                                });
                              }
                            },
                          ),
                          if(state is LoadingCreateRestaurantState)
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

  InputBorder buildInputBorder() {
    return InputBorder.none;
  }
}
