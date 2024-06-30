import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/core/styles/colors.dart';
import 'package:travanix/data/models/drawer_item/drawer_item_model.dart';
import 'package:travanix/presentation/manger/home_layout_cubit/home_layout_cubit.dart';
import 'package:travanix/presentation/views/home_layout/widgets/custom_expansion_tile.dart';
import 'package:travanix/presentation/views/home_layout/widgets/drawer_item_list.dart';
import 'package:travanix/presentation/views/home_layout/widgets/drawer_tail.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.cubit,
    required this.navigationShell,
  });

  final HomeLayoutCubit cubit;
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    List<DrawerItemModel> drawerItemModel = [
      DrawerItemModel(itemName: 'HOME', itemIcon: Icons.home),
      DrawerItemModel(itemName: 'WALLET RECHARGE', itemIcon: Icons.wallet),
      DrawerItemModel(itemName: 'NOTIFICATION', itemIcon: Icons.notifications),
      DrawerItemModel(itemName: 'PLAN', itemIcon: Icons.maps_home_work),
      DrawerItemModel(itemName: 'HOTEL', itemIcon: Icons.hotel),
      DrawerItemModel(itemName: 'RESTAURANT', itemIcon: Icons.restaurant),
      DrawerItemModel(itemName: 'TOURIST DESTINATION', itemIcon: Icons.castle),
    ];
    return Container(
      color: navyBlueColor,
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 6,
            ),
          ),
          SliverToBoxAdapter(
            child: DrawerItemList(
              displacementRange: 0,
              drawerItemModel: drawerItemModel.getRange(0, 3).toList(),
              navigationShell: navigationShell,
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 4,
            ),
          ),
          SliverToBoxAdapter(
            child: CustomExpansionTile(
              cubit: cubit,
              navigationShell: navigationShell,
              drawerItemModel: drawerItemModel.getRange(3, 7).toList(),
              title: 'ADD',
              icon: Icons.add,
            ),
          ),
          const SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 15,
                  ),
                ),
                DrawerTail(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

