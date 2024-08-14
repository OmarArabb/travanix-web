import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/core/functions/toast.dart';
import 'package:travanix/core/widgets/custom_material_button.dart';
import 'package:travanix/core/widgets/custom_text_form_field.dart';
import 'package:travanix/presentation/manger/create_room/cubit.dart';
import 'package:travanix/presentation/manger/create_room/states.dart';

class CreateRoomSection extends StatelessWidget {
  const CreateRoomSection({
    super.key, required this.hotelId,

  });

  final int hotelId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateRoomCubit>(
      create: (context) => CreateRoomCubit(),
      child: BlocConsumer<CreateRoomCubit, CreateRoomStates>(
        listener: (context, state) {
          if (state is SuccessCreateRoomState) {
            successToast(state.successMessage);
          } else if (state is ErrorCreateRoomState) {
            errorToast(state.errMessage);
          }
        },
        builder: (context, state) {
          CreateRoomCubit createRoomCubit = CreateRoomCubit.get(context);

          return Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                Expanded(
                    child: CustomTextFormField(
                      controller: createRoomCubit.sizeController,
                      hintText: 'Size',
                    )),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: CustomTextFormField(
                      controller: createRoomCubit.quantityController,
                      hintText: 'Quantity',
                    )),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: CustomTextFormField(
                      controller: createRoomCubit.priceController,
                      hintText: 'Price',
                    )),
                const SizedBox(
                  width: 16,
                ),
                CustomMaterialButton(
                  child: const Text('Create'),
                  onPressed: () {
                    createRoomCubit.createNewRoom(hotelId: hotelId).then(
                          (value) {
                        createRoomCubit.priceController.clear();
                        createRoomCubit.quantityController.clear();
                        createRoomCubit.sizeController.clear();
                      },
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}