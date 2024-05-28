import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/core/functions/toast.dart';
import 'package:travanix/core/styles/text_styles.dart';
import 'package:travanix/core/widgets/custom_material_button.dart';
import 'package:travanix/presentation/manger/create_items_cubit/cubit.dart';
import 'package:travanix/presentation/manger/create_items_cubit/states.dart';
import 'package:travanix/presentation/views/create_items/widgets/add_images_section.dart';
import 'package:travanix/presentation/views/create_items/widgets/information_section.dart';
import 'package:travanix/presentation/views/create_items/widgets/location_section.dart';

class CreateNewHotel extends StatelessWidget {
  const CreateNewHotel({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();

    return BlocProvider(
      create: (context) => CreateItemsCubit(),
      child: BlocConsumer<CreateItemsCubit, CreateItemsStates>(
        listener: (context, state) {
          if(state is ErrorToAddMultiImagesState){
            errorToast(state.errorMessage);
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
                          const InformationSection(),
                          const SizedBox(
                            height: 16,
                          ),
                          const LocationSection(),
                          CustomMaterialButton(
                            child: const Text('Click'),
                            onPressed: () {
                              if (!formKey.currentState!.validate()) {}
                            },
                          )
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
