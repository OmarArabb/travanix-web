import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/core/functions/toast.dart';
import 'package:travanix/core/styles/text_styles.dart';
import 'package:travanix/core/widgets/custom_material_button.dart';
import 'package:travanix/presentation/manger/create_items_cubit/cubit.dart';
import 'package:travanix/presentation/manger/create_items_cubit/states.dart';
import 'package:travanix/presentation/views/create_items/widgets/add_images_section.dart';
import 'package:travanix/presentation/views/create_items/widgets/information_section.dart';
import 'package:travanix/presentation/views/create_items/widgets/location_section.dart';
import 'package:travanix/presentation/views/create_items/widgets/select_time_section.dart';

class CreateNewTouristDis extends StatelessWidget {
  const CreateNewTouristDis({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();

    return BlocProvider(
      create: (context) => CreateItemsCubit(),
      child: BlocConsumer<CreateItemsCubit, CreateItemsStates>(
        listener: (context, state) {
          if (state is ErrorToAddMultiImagesState) {
            errorToast(state.errorMessage);
          }else if (state is ErrorGetCountryState) {
            errorToast(state.errorMessage);
          } else if(state is SuccessCreateTouristDisState){
            successToast(state.successMessage);
          }
        },
        builder: (context, state) {
          CreateItemsCubit cubit = CreateItemsCubit.get(context);

          return Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'New Tourist Destination',
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
                            itemType: 'Tourist Destination',
                            additional: [
                              SelectTimeSection(cubit: cubit),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const LocationSection(itemName: 'Tourist Destination',),
                          const SizedBox(
                            height: 32,
                          ),
                          if(state is ! LoadingCreateTouristDisState)
                          CustomMaterialButton(
                            // width: 200,
                            child: const Text('Create'),
                            onPressed: () {
                              if(!formKey.currentState!.validate() || cubit.pickedImages.isEmpty){
                                errorToast('Please Fill The Empty Field');
                              }else if(formKey.currentState!.validate()){
                                cubit.createTouristDis().then((value){
                                  cubit.cityId = 0;
                                  cubit.countryId = 0;
                                  cubit.pickedImages.clear();
                                  cubit.nameController.clear();
                                  cubit.aboutController.clear();
                                  cubit.addressController.clear();
                                  cubit.openingTimeController.clear();
                                  cubit.closingTimeController.clear();
                                  cubit.coordinateXController.clear();
                                  cubit.coordinateYController.clear();
                                });
                              }
                            },
                          ),

                          if(state is LoadingCreateTouristDisState)
                            const CircularProgressIndicator()

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
