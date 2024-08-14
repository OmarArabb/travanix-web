import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/core/functions/toast.dart';
import 'package:travanix/core/styles/text_styles.dart';
import 'package:travanix/presentation/manger/get_items/cubit.dart';
import 'package:travanix/presentation/manger/get_items/states.dart';
import 'package:travanix/presentation/views/item_details/widgets/comment_section.dart';
import 'package:travanix/presentation/views/item_details/widgets/images_section.dart';
import 'package:travanix/presentation/views/item_details/widgets/location_section.dart';
import 'package:travanix/presentation/views/item_details/widgets/opening_closing_section.dart';
import 'package:travanix/presentation/views/item_details/widgets/text_section.dart';

class TouristDisDetails extends StatelessWidget {
  const TouristDisDetails({
    super.key,
    required this.touristDisId,
  });

  final int touristDisId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetItemsCubit>(
      create: (context) => GetItemsCubit()..getAttractionById(id: touristDisId),
      child: BlocConsumer<GetItemsCubit, GetItemStates>(
        listener: (context, state) {
          if (state is GetAttractionsErrorState) {
            successToast(state.errMessage);
          }
        },
        builder: (context, state) {
          GetItemsCubit cubit = GetItemsCubit.get(context);

          if (state is GetAttractionsSuccessState) {
            print(cubit.attractionsModel!.data![0].description);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                        cubit
                            .attractionsModel!.data![0].attractionActivityName!,
                        style: AppTextStyles.styleSemiBold24()),
                    const SizedBox(
                      width: 12,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                ImagesSection(images: cubit.attractionsModel!.data![0].images!),
                const SizedBox(
                  height: 16,
                ),
                TextSection(
                  text: cubit.attractionsModel!.data![0].description!,
                ),
                const SizedBox(
                  height: 16,
                ),
                OpeningAndClosingTime(
                  openingTime: cubit.attractionsModel!.data![0].openingTime!,
                  closingTime: cubit.attractionsModel!.data![0].closingTime!,
                ),
                const SizedBox(
                  height: 16,
                ),
                LocationSection(
                  location:'${cubit.attractionsModel!.data![0].nationName} / ${cubit.attractionsModel!.data![0].cityName} / ${cubit.attractionsModel!.data![0].address}',
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
                      'attraction_activity_id=${cubit.attractionsModel!.data![0].id!}',
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            );
          } else if (state is GetAttractionsLoadingState) {
            return const CircularProgressIndicator();
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

