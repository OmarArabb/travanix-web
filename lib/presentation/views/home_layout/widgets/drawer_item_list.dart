import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/data/models/drawer_item/drawer_item_model.dart';
import 'package:travanix/presentation/manger/home_layout_cubit/home_layout_cubit.dart';
import 'package:travanix/presentation/views/home_layout/widgets/selected_drawer_item.dart';
import 'package:travanix/presentation/views/home_layout/widgets/unselected_drawer_item.dart';

class DrawerItemList extends StatelessWidget {
  const DrawerItemList({
    super.key,
    required this.displacementRange,
    required this.drawerItemModel,
    required this.navigationShell,
  });

  final int displacementRange;
  final StatefulNavigationShell navigationShell;
  final List<DrawerItemModel> drawerItemModel;

  @override
  Widget build(BuildContext context) {
    int ind = navigationShell.currentIndex;

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            HomeLayoutCubit.get(context).changeIndex(
              index + displacementRange,
            );
            navigationShell.goBranch(
              HomeLayoutCubit.get(context).currentIndex,
            );
          },
          child: ind - displacementRange == index
              ? SelectedDrawerItem(
                  model: drawerItemModel[index],
                )
              : UnSelectedDrawerItem(
                  model: drawerItemModel[index],
                ),
        );
      },
      itemCount: drawerItemModel.length,
    );
  }
}
