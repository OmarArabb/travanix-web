import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/core/styles/text_styles.dart';
import 'package:travanix/presentation/manger/search_cubit/cubit.dart';

class HotelItem extends StatelessWidget {
  const HotelItem({
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
          context.push('/hotel_details',extra: cubit.searchHotelsModel!.hotels![index]);
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
                    'http://127.0.0.1:8000/api${cubit.searchHotelsModel!.hotels![index].images![0]}',
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
                  cubit.searchHotelsModel!.hotels![index].hotelName!,
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
                      '${cubit.searchHotelsModel!.hotels![index].nationName} / ${cubit.searchHotelsModel!.hotels![index].cityName} / ${cubit.searchHotelsModel!.hotels![index].address}',
                      style: AppTextStyles.styleRegular12().copyWith(
                        fontWeight: FontWeight.w800,
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  const SizedBox(
                    width: 6,
                  ),
                  for (int i = 0;
                  i < cubit.searchHotelsModel!.hotels![index].hotelClass!;
                  i++)
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 20,
                    )
                ],
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