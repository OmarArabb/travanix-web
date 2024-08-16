import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/core/styles/text_styles.dart';
import 'package:travanix/presentation/manger/search_cubit/cubit.dart';

class TripItem extends StatelessWidget {
  const TripItem({
    super.key,
    required this.cubit,
    required this.index,
  });

  final SearchCubit cubit;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: InkWell(
        onTap: () {
          context.pushNamed('trip_details/:id',pathParameters: {'id': cubit.tripsModel!.trips![index].id.toString()});
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: Border.all(color: Colors.grey[400]!, width: 2),
          ),
          padding: const EdgeInsets.all(1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(7.0),
                    topLeft: Radius.circular(7.0)),
                child: AspectRatio(
                  aspectRatio: 1080 / 780,
                  child: Image.network(
                    'http://127.0.0.1:8000${cubit.tripsModel!.trips![index].image!}',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Text(
                  cubit.tripsModel!.trips![index].tripName!,
                  style: AppTextStyles.styleSemiBold16(),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 4,
                  ),
                  Icon(
                    Icons.pin_drop_rounded,
                    size: 18,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Flexible(
                    child: Text(
                      'Starting Locations : ${cubit.tripsModel!.trips![index].nationName} / ${cubit.tripsModel!.trips![index].cityName} / ${cubit.tripsModel!.trips![index].address}',
                      style: AppTextStyles.styleRegular12().copyWith(
                        fontWeight: FontWeight.w800,
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                '   Available Seats : ${cubit.tripsModel!.trips![index].numberOfSeatsAvailable}',
                style: AppTextStyles.styleRegular12().copyWith(
                  fontWeight: FontWeight.w800,
                  color: Colors.grey[400],
                ),
              ),
              Text(
                  '   Price Per Person : ${cubit.tripsModel!.trips![index].priceTrip}',
                style: AppTextStyles.styleRegular12().copyWith(
                  fontWeight: FontWeight.w800,
                  color: Colors.grey[400],
                ),
              ),
              const Expanded(
                child: SizedBox(
                  height: 8,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}