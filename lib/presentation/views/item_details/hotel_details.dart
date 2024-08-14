import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/constant.dart';
import 'package:travanix/core/styles/text_styles.dart';
import 'package:travanix/presentation/manger/get_items/cubit.dart';
import 'package:travanix/presentation/manger/get_items/states.dart';
import 'package:travanix/presentation/views/item_details/widgets/comment_section.dart';
import 'package:travanix/presentation/views/item_details/widgets/create_room_section.dart';
import 'package:travanix/presentation/views/item_details/widgets/get_rooms_section.dart';
import 'package:travanix/presentation/views/item_details/widgets/images_section.dart';
import 'package:travanix/presentation/views/item_details/widgets/most_popular_facilities_section.dart';
import 'package:travanix/presentation/views/item_details/widgets/text_section.dart';

class HotelDetails extends StatelessWidget {
  const HotelDetails({
    super.key, required this.hotelId,

  });

  final int hotelId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetItemsCubit>(
      create: (context) => GetItemsCubit()..getHotelById(id: hotelId),
      child: BlocConsumer<GetItemsCubit, GetItemStates>(
        listener: (context, state) {},
        builder: (context, state) {
          GetItemsCubit cubit = GetItemsCubit.get(context);

          if (state is GetHotelsSuccessState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(cubit.hotelsModel!.data![0].hotelName!,
                        style: AppTextStyles.styleSemiBold24()),
                    const SizedBox(
                      width: 12,
                    ),
                    for (int i = 0;
                        i < cubit.hotelsModel!.data![0].hotelClass;
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
                ImagesSection(images: cubit.hotelsModel!.data![0].images!),
                const SizedBox(
                  height: 16,
                ),
                TextSection(
                  text:
                      cubit.hotelsModel!.data![0].simpleDescriptionAboutHotel!,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Most popular facilities',
                  style: AppTextStyles.styleSemiBold18(),
                ),
                const SizedBox(
                  height: 8,
                ),
                MostPopularFacilities(
                  hotelServicesIcons: hotelServicesIcons,
                  services: cubit.hotelsModel!.data![0].services!,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Create Rooms',
                  style: AppTextStyles.styleSemiBold18(),
                ),
                const SizedBox(
                  height: 8,
                ),
                CreateRoomSection(hotelId: cubit.hotelsModel!.data![0].id!),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Rooms',
                  style: AppTextStyles.styleSemiBold18(),
                ),
                GetRoomsSection(
                  id: cubit.hotelsModel!.data![0].id!,
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
                  endPoint: 'hotel_id=${cubit.hotelsModel!.data![0].id!}',
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            );
          } else if (state is GetHotelsLoadingState) {
            return const CircularProgressIndicator();
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
