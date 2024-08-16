import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/core/functions/toast.dart';
import 'package:travanix/core/styles/text_styles.dart';
import 'package:travanix/presentation/manger/delete_item_cubit/cubit.dart';
import 'package:travanix/presentation/manger/get_items/cubit.dart';
import 'package:travanix/presentation/manger/get_items/states.dart';
import 'package:travanix/presentation/views/item_details/widgets/comment_section.dart';
import 'package:travanix/presentation/views/item_details/widgets/images_section.dart';
import 'package:travanix/presentation/views/item_details/widgets/location_section.dart';
import 'package:travanix/presentation/views/item_details/widgets/text_section.dart';

class TripDetails extends StatelessWidget {
  const TripDetails({
    super.key,
    required this.tripId,
  });

  final int tripId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetItemsCubit>(
      create: (context) => GetItemsCubit()..getTripById(id: tripId),
      child: BlocConsumer<GetItemsCubit, GetItemStates>(
        listener: (context, state) {
          if (state is GetTripErrorState) {
            successToast(state.errMessage);
          }
        },
        builder: (context, state) {
          GetItemsCubit cubit = GetItemsCubit.get(context);

          if (state is GetTripSuccessState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    PopupMenuButton(
                      child: const Icon(Icons.menu),
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                              onTap: () {
                                context.pushNamed('trip_update',
                                    extra: cubit.tripModel);
                              },
                              child: const Row(
                                children: [
                                  Icon(Icons.edit),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text('Edit Trip'),
                                ],
                              )),
                          PopupMenuItem(
                              onTap: () {

                              },
                              child: const Row(
                                children: [
                                  Icon(Icons.delete),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text('Delete Trip'),
                                ],
                              )),
                        ];
                      },
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(cubit.tripModel!.data!.tripName!,
                        style: AppTextStyles.styleSemiBold24()),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                ImagesSection(images: [cubit.tripModel!.data!.image!]),
                const SizedBox(
                  height: 16,
                ),
                TextSection(
                  text: cubit.tripModel!.data!.description!,
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text('Starting Location : '),
                          LocationSection(
                            location:
                                '${cubit.tripModel!.data!.nationName} / ${cubit.tripModel!.data!.cityName} / ${cubit.tripModel!.data!.address}',
                          ),
                        ],
                      ),
                      Text(
                          'Starting Time : ${cubit.tripModel!.data!.tripStartTime}'),
                      Text(
                          'Ending Time : ${cubit.tripModel!.data!.tripEndTime}'),
                      Text(
                          'Number Of Seats : ${cubit.tripModel!.data!.numberOfAllSeat}'),
                      Text(
                          'Number Of Available Seats : ${cubit.tripModel!.data!.numberOfSeatsAvailable}'),
                      Text(
                          'Price Per Seat : ${cubit.tripModel!.data!.priceTrip}'),
                    ],
                  ),
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
                  endPoint: 'trip_id=${cubit.tripModel!.data!.id!}',
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            );
          } else if (state is GetTripLoadingState) {
            return const CircularProgressIndicator();
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
