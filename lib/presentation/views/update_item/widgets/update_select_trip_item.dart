import 'package:flutter/material.dart';
import 'package:travanix/presentation/manger/get_items/cubit.dart';
import 'package:travanix/presentation/manger/update_item/cubit.dart';
import 'package:travanix/presentation/views/create_items/widgets/custom_tap_bar.dart';
import 'package:travanix/presentation/views/update_item/widgets/update_grid_trip.dart';


class SelectTripItemSection extends StatelessWidget {
  const SelectTripItemSection({
    super.key,
    required this.getItemsCubit, required this.updateItemCubit,
  });

  final GetItemsCubit getItemsCubit;
  final UpdateItemCubit updateItemCubit;

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
          UpdateGridTrip(getItemsCubit: getItemsCubit, updateCubit: updateItemCubit, type: 'Hotels',)
        else if(getItemsCubit.currIndex == 1 && getItemsCubit.restaurantsModel != null)
          UpdateGridTrip(getItemsCubit: getItemsCubit, updateCubit: updateItemCubit, type: 'Restaurants',)
        else if(getItemsCubit.currIndex == 2 && getItemsCubit.attractionsModel != null)
            UpdateGridTrip(getItemsCubit: getItemsCubit, updateCubit: updateItemCubit, type: 'Attractions',)
      ],
    );
  }
}