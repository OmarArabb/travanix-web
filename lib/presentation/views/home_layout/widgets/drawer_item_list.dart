// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/data/models/drawer_item/drawer_item_model.dart';
import 'package:travanix/presentation/manger/home_layout_cubit/home_layout_cubit.dart';
import 'package:travanix/presentation/views/home_layout/widgets/selected_drawer_item.dart';
import 'package:travanix/presentation/views/home_layout/widgets/unselected_drawer_item.dart';

class DrawerItemList extends StatelessWidget {
  const DrawerItemList({
    super.key, required this.displacementRange, required this.drawerItemModel, required this.navigationShell,
  });

  final int displacementRange;
  final StatefulNavigationShell navigationShell;
  final List<DrawerItemModel> drawerItemModel;

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) => InkWell(
        onTap: () {

          HomeLayoutCubit.get(context).changeIndex(index + displacementRange);
          navigationShell.goBranch(HomeLayoutCubit.get(context).currentIndex,);
          print('drawer list');
          print(index);
          print(HomeLayoutCubit.get(context).currentIndex);
        },
        child: HomeLayoutCubit.get(context).currentIndex - displacementRange == index
            ? SelectedDrawerItem(model: drawerItemModel[index],)
            : UnSelectedDrawerItem(model: drawerItemModel[index]),),
      itemCount: drawerItemModel.length,
    );
  }
}