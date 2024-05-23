import 'package:flutter/material.dart';
import 'package:travanix/core/styles/colors.dart';
import 'package:travanix/core/styles/text_styles.dart';
import 'package:travanix/data/models/drawer_item/drawer_item_model.dart';

class SelectedDrawerItem extends StatelessWidget {
  const SelectedDrawerItem({
    super.key, required this.model,
  });
  final DrawerItemModel model ;

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: const BoxDecoration(
        color: basicColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18), bottomLeft: Radius.circular(18)),
      ),
      margin: const EdgeInsets.only(top: 8, left: 8),
      height: 40,
      padding: const EdgeInsets.only(left: 8),
      child:  Row(
        children: [
          Icon(
            model.itemIcon,
            size: 20,
            color: whiteColor,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            model.itemName,
            style: AppTextStyles.styleRegular12().copyWith(color: whiteColor,),
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios_outlined,
            size: 16,
            color: whiteColor,
          )
        ],
      ),
    );
  }
}