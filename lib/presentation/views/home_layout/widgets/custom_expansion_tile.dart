import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/core/styles/colors.dart';
import 'package:travanix/core/styles/text_styles.dart';
import 'package:travanix/data/models/drawer_item/drawer_item_model.dart';
import 'package:travanix/presentation/manger/home_layout_cubit/home_layout_cubit.dart';
import 'package:travanix/presentation/views/home_layout/widgets/drawer_item_list.dart';

class CustomExpansionTile extends StatelessWidget {
  const CustomExpansionTile({
    super.key,
    required this.cubit,
    required this.drawerItemModel,
    required this.title,
    required this.icon,
    required this.navigationShell, required this.displacementRange,
  });

  final String title;
  final IconData icon;
  final HomeLayoutCubit cubit;
  final List<DrawerItemModel> drawerItemModel;
  final StatefulNavigationShell navigationShell;
  final int displacementRange;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.only(left: 8),
      title: Text(
        title,
        style: AppTextStyles.styleRegular12(),
      ),
      leading: Icon(icon),
      iconColor: basicColor,
      textColor: basicColor,
      collapsedIconColor: whiteColor,
      collapsedTextColor: whiteColor,
      children: [
        DrawerItemList(
          displacementRange: displacementRange,
          drawerItemModel: drawerItemModel,
          navigationShell: navigationShell,
        ),
        const SizedBox(
          height: 4,
        ),
      ],
    );
  }
}
