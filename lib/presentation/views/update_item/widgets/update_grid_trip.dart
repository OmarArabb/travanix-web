import 'package:flutter/material.dart';
import 'package:travanix/presentation/manger/get_items/cubit.dart';
import 'package:travanix/presentation/manger/update_item/cubit.dart';
import 'package:travanix/presentation/views/update_item/widgets/update_grid_item.dart';

class UpdateGridTrip extends StatelessWidget {
  const UpdateGridTrip({
    super.key,
    required this.getItemsCubit,
    required this.updateCubit, required this.type,
  });

  final GetItemsCubit getItemsCubit;
  final UpdateItemCubit updateCubit;
  final String type;

  @override
  Widget build(BuildContext context) {
    if(type == 'Hotels') {
      return GridView.builder(
        itemCount: getItemsCubit.hotelsModel!.data!.length,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            childAspectRatio: 1 / 1.1),
        itemBuilder: (context, index) {
          return GridItem(
            updateItemsCubit: updateCubit,
            index: index,
            selectedItems: updateCubit.selectedHotels,
            model: getItemsCubit.hotelsModel!,
          );
        },
      );
    }else if(type == 'Restaurants'){
      return GridView.builder(
        itemCount: getItemsCubit.restaurantsModel!.data!.length,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            childAspectRatio: 1 / 1.05),
        itemBuilder: (context, index) {
          return GridItem(
            updateItemsCubit: updateCubit,
            index: index,
            selectedItems: updateCubit.selectedRestaurants,
            model: getItemsCubit.restaurantsModel!,
          );
        },
      );
    }else{
      return GridView.builder(
        itemCount: getItemsCubit.attractionsModel!.data!.length,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            childAspectRatio: 1 / 1.05),
        itemBuilder: (context, index) {
          return GridItem(
            updateItemsCubit: updateCubit,
            index: index,
            selectedItems: updateCubit.selectedAttractions,
            model: getItemsCubit.attractionsModel!,
          );
        },
      );
    }
  }
}