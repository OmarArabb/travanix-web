import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/core/styles/text_styles.dart';
import 'package:travanix/presentation/manger/search_cubit/cubit.dart';

class AttractionItem extends StatelessWidget {
  const AttractionItem({
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
          context.pushNamed('tourist_dis_details/:id',pathParameters: {'id': cubit.searchTouristDisModel!.attractionActivities![index].id.toString()});
          print(cubit.searchTouristDisModel!.attractionActivities![0].description);
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
                    'http://127.0.0.1:8000${cubit.searchTouristDisModel!.attractionActivities![index].images![0]}',
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
                  cubit.searchTouristDisModel!.attractionActivities![index].attractionActivityName!,
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
                      '${cubit.searchTouristDisModel!.attractionActivities![index].nationName} / ${cubit.searchTouristDisModel!.attractionActivities![index].cityName} / ${cubit.searchTouristDisModel!.attractionActivities![index].address}',
                      style: AppTextStyles.styleRegular12().copyWith(
                        fontWeight: FontWeight.w800,
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
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