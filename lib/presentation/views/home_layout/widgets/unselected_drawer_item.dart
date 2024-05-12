import 'package:flutter/material.dart';
import 'package:travanix/core/styles/colors.dart';
import 'package:travanix/core/styles/text_styles.dart';
import 'package:travanix/data/models/drawer_item/drawer_item_model.dart';

class UnSelectedDrawerItem extends StatelessWidget {
  const UnSelectedDrawerItem({
    super.key, required this.model,
  });

  final DrawerItemModel model ;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(top: 8),
      child: Material(
        color: navyBlueColor,
        child: Row(
          children: [
            const SizedBox(
              width: 8,
            ),
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
              Icons.expand_more,
              size: 24,
              color: whiteColor,
            ),
          ],
        ),
      ),
    );
  }
}