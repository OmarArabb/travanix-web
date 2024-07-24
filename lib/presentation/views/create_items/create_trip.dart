import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:travanix/core/functions/helper_function.dart';
import 'package:travanix/core/functions/toast.dart';
import 'package:travanix/core/styles/colors.dart';
import 'package:travanix/core/styles/text_styles.dart';
import 'package:travanix/core/widgets/custom_material_button.dart';
import 'package:travanix/core/widgets/custom_text_form_field.dart';
import 'package:travanix/presentation/manger/create_items_cubit/cubit.dart';
import 'package:travanix/presentation/manger/create_items_cubit/states.dart';
import 'package:travanix/presentation/manger/get_items/cubit.dart';
import 'package:travanix/presentation/manger/get_items/states.dart';
import 'package:travanix/presentation/views/create_items/widgets/information_section.dart';
import 'package:travanix/presentation/views/create_items/widgets/location_section.dart';
import 'package:travanix/presentation/views/create_items/widgets/select_trip_item_section.dart';

class CreateTrip extends StatelessWidget {
  const CreateTrip({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();

    return BlocProvider(
      create: (context) => CreateItemsCubit(),
      child: BlocConsumer<CreateItemsCubit, CreateItemsStates>(
        listener: (context, state) {
          if(state is ErrorCreateTripState) {
            errorToast(state.errorMessage);
          }else if(state is SuccessCreateTripState){
            successToast(state.successMessage);
          }

        },
        builder: (context, state) {
          CreateItemsCubit createItemsCubit = CreateItemsCubit.get(context);

          List<Widget> additional = [
            Padding(
              padding: const EdgeInsets.only(left: 6.0, top: 6.0),
              child: CustomTextFormField(
                hintText: 'Number Of Seats',
                validator: validateTextField,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ],
                enabledBorder: buildInputBorder(),
                focusedBorder: buildInputBorder(),
                filledColor: Colors.grey[200],
                controller: createItemsCubit.numberOfSeatController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6.0, top: 6.0),
              child: CustomTextFormField(
                hintText: 'Price Per Person',
                validator: validateTextField,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ],
                enabledBorder: buildInputBorder(),
                focusedBorder: buildInputBorder(),
                filledColor: Colors.grey[200],
                controller: createItemsCubit.priceController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6.0, top: 6.0),
              child: CustomTextFormField(
                hintText: 'Departure time',
                validator: validateTextField,
                enabledBorder: buildInputBorder(),
                focusedBorder: buildInputBorder(),
                filledColor: Colors.grey[200],
                controller: createItemsCubit.openingTimeController,
                onTap: () async {
                  await showOmniDateTimeRangePicker(
                    context: context,
                    startInitialDate: DateTime.now(),
                    startFirstDate:
                        DateTime(1600).subtract(const Duration(days: 3652)),
                    startLastDate: DateTime.now().add(
                      const Duration(days: 3652),
                    ),
                    endInitialDate: DateTime.now().add(const Duration(days: 1)),
                    endFirstDate:
                        DateTime(1600).subtract(const Duration(days: 3652)),
                    endLastDate: DateTime.now().add(
                      const Duration(days: 3652),
                    ),
                    is24HourMode: true,
                    isShowSeconds: false,
                    minutesInterval: 1,
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    constraints: const BoxConstraints(
                      maxWidth: 350,
                      maxHeight: 650,
                    ),
                    transitionBuilder: (context, anim1, anim2, child) {
                      return FadeTransition(
                        opacity: anim1.drive(
                          Tween(
                            begin: 0,
                            end: 1,
                          ),
                        ),
                        child: child,
                      );
                    },
                    transitionDuration: const Duration(milliseconds: 200),
                    barrierDismissible: true,
                  ).then(
                    (value) {
                      if (value != null) {
                        createItemsCubit.openingTimeController.text = value[0]
                            .toString()
                            .substring(0, value[0].toString().length - 7);
                        createItemsCubit.closingTimeController.text = value[1]
                            .toString()
                            .substring(0, value[1].toString().length - 7);
                      }
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6.0, top: 6.0),
              child: CustomTextFormField(
                hintText: 'End Time',
                validator: validateTextField,
                enabledBorder: buildInputBorder(),
                focusedBorder: buildInputBorder(),
                filledColor: Colors.grey[200],
                controller: createItemsCubit.closingTimeController,
              ),
            ),
          ];

          return Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'New Trip',
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InformationSection(
                            itemType: 'Trip',
                            additional: additional,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const LocationSection(itemName: 'Starting'),
                          const SizedBox(
                            height: 32,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: CustomMaterialButton(
                              child: const Text(
                                'Create',
                                style: TextStyle(color: whiteColor),
                              ),
                              onPressed: () {
                                if (!formKey.currentState!.validate() ||
                                    createItemsCubit.selectedHotels.isEmpty ||
                                    createItemsCubit
                                        .selectedRestaurants.isEmpty ||
                                    createItemsCubit
                                        .selectedAttractions.isEmpty) {
                                  errorToast('Please Fill Empty Fields');
                                }
                                else if(formKey.currentState!.validate()){
                                  createItemsCubit.createTrip().then((value) {
                                    // createItemsCubit.
                                  },);
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      flex: 5,
                      child: BlocProvider(
                        create: (context) => GetItemsCubit()
                          ..getHotels()
                          ..getRestaurants()
                          ..getAttractions(),
                        child: BlocConsumer<GetItemsCubit, GetItemStates>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            GetItemsCubit getItemsCubit =
                                GetItemsCubit.get(context);
                            return SelectTripItemSection(
                              getItemsCubit: getItemsCubit,
                              createItemsCubit: createItemsCubit,
                            );
                          },
                        ),
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
