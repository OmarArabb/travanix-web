import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/core/styles/text_styles.dart';
import 'package:travanix/presentation/manger/get_items/cubit.dart';
import 'package:travanix/presentation/manger/get_items/states.dart';
import 'package:travanix/presentation/views/item_details/widgets/comment_section.dart';
import 'package:travanix/presentation/views/item_details/widgets/images_section.dart';
import 'package:travanix/presentation/views/item_details/widgets/location_section.dart';
import 'package:travanix/presentation/views/item_details/widgets/opening_closing_section.dart';
import 'package:travanix/presentation/views/item_details/widgets/text_section.dart';

class RestaurantDetails extends StatelessWidget {
  const RestaurantDetails({
    super.key,
    required this.restaurantId,
  });

  final int restaurantId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetItemsCubit>(
      create: (context) => GetItemsCubit()..getRestaurantById(id: restaurantId),
      child: BlocConsumer<GetItemsCubit, GetItemStates>(
        listener: (context, state) {},
        builder: (context, state) {
          GetItemsCubit cubit = GetItemsCubit.get(context);

          if (state is GetRestaurantsSuccessState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(cubit.restaurantsModel!.data![0].resturantName!,
                        style: AppTextStyles.styleSemiBold24()),
                    const SizedBox(
                      width: 12,
                    ),
                    for (int i = 0;
                        i < cubit.restaurantsModel!.data![0].resturantClass!;
                        i++)
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 24,
                      )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                ImagesSection(images: cubit.restaurantsModel!.data![0].images!),
                const SizedBox(
                  height: 16,
                ),
                TextSection(
                  text: cubit.restaurantsModel!.data![0].descreption!,
                ),
                const SizedBox(
                  height: 16,
                ),
                OpeningAndClosingTime(
                  openingTime: cubit.restaurantsModel!.data![0].opiningTime!,
                  closingTime: cubit.restaurantsModel!.data![0].closingTime!,
                ),
                const SizedBox(
                  height: 16,
                ),
                LocationSection(
                  location:
                      '${cubit.restaurantsModel!.data![0].nationName} / ${cubit.restaurantsModel!.data![0].cityName} / ${cubit.restaurantsModel!.data![0].address}',
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Reviews',
                  style: AppTextStyles.styleSemiBold18(),
                ),
                const SizedBox(
                  height: 8,
                ),
                CommentsSection(
                  endPoint:
                      'restaurant_id=${cubit.restaurantsModel!.data![0].id!}',
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            );
          } else if (state is GetRestaurantsLoadingState) {
            return const CircularProgressIndicator();
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
