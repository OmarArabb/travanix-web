import 'package:flutter/material.dart';
import 'package:travanix/presentation/manger/create_items_cubit/cubit.dart';
import 'package:travanix/presentation/manger/get_items/cubit.dart';
import 'package:travanix/presentation/views/create_items/widgets/grid_item.dart';

class GridTripItems extends StatelessWidget {
  const GridTripItems({
    super.key,
    required this.getItemsCubit,
    required this.createItemsCubit, required this.type,
  });

  final GetItemsCubit getItemsCubit;
  final CreateItemsCubit createItemsCubit;
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
            childAspectRatio: 1 / 1.05),
        itemBuilder: (context, index) {
          return GridItem(
            createItemsCubit: createItemsCubit,
            index: index,
            selectedItems: createItemsCubit.selectedHotels,
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
            createItemsCubit: createItemsCubit,
            index: index,
            selectedItems: createItemsCubit.selectedRestaurants,
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
            createItemsCubit: createItemsCubit,
            index: index,
            selectedItems: createItemsCubit.selectedAttractions,
            model: getItemsCubit.attractionsModel!,
          );
        },
      );
    }
  }
}