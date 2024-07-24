import 'package:flutter/material.dart';
import 'package:travanix/core/styles/colors.dart';
import 'package:travanix/core/styles/text_styles.dart';
import 'package:travanix/data/models/select_trip_item_model/select_trip_item_model.dart';
import 'package:travanix/presentation/manger/get_items/cubit.dart';

class CustomTapBar extends StatelessWidget {
  const CustomTapBar({super.key, required this.cubit});

  final GetItemsCubit cubit;

  @override
  Widget build(BuildContext context) {
    List<SelectTripItemModel> list = [
      SelectTripItemModel(index: 0, title: 'Select Hotel', icon: Icons.hotel),
      SelectTripItemModel(
          index: 1, title: 'Select Restaurant', icon: Icons.restaurant),
      SelectTripItemModel(
          index: 2, title: 'Select Tourist Dis', icon: Icons.castle),
    ];

    Color selectedColor = basicColor;
    return Row(
      children: list.map(
            (e) {
          selectedColor = cubit.currIndex == e.index ? basicColor : whiteColor;
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: Material(
                  child: InkWell(
                    onTap: () {
                      cubit.changeCurrIndex(e.index);

                    },
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        color: cubit.currIndex == e.index
                            ? whiteColor
                            : basicColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            e.icon,
                            size: 36,
                            color: selectedColor,
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            e.title,
                            style: AppTextStyles.styleRegular14().copyWith(
                              color: selectedColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}