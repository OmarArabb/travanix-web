import 'package:flutter/material.dart';
import 'package:travanix/presentation/manger/create_items_cubit/cubit.dart';
import 'package:travanix/presentation/manger/get_items/cubit.dart';
import 'package:travanix/presentation/views/create_items/widgets/custom_tap_bar.dart';
import 'package:travanix/presentation/views/create_items/widgets/grid_trip_items.dart';

class SelectTripItemSection extends StatelessWidget {
  const SelectTripItemSection({
    super.key,
    required this.getItemsCubit,
    required this.createItemsCubit,
  });

  final GetItemsCubit getItemsCubit;
  final CreateItemsCubit createItemsCubit;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        CustomTapBar(
          cubit: getItemsCubit,
        ),
        const SizedBox(
          height: 16,
        ),
        if (getItemsCubit.currIndex == 0 && getItemsCubit.hotelsModel != null)
          GridTripItems(getItemsCubit: getItemsCubit, createItemsCubit: createItemsCubit, type: 'Hotels',)
        else if(getItemsCubit.currIndex == 1 && getItemsCubit.restaurantsModel != null)
          GridTripItems(getItemsCubit: getItemsCubit, createItemsCubit: createItemsCubit, type: 'Restaurants',)
        else if(getItemsCubit.currIndex == 2 && getItemsCubit.attractionsModel != null)
            GridTripItems(getItemsCubit: getItemsCubit, createItemsCubit: createItemsCubit, type: 'Attractions',)
      ],
    );
  }
}