import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/core/functions/toast.dart';

import 'package:travanix/presentation/manger/home_layout_cubit/home_layout_cubit.dart';
import 'package:travanix/presentation/manger/home_layout_cubit/home_layout_states.dart';
import 'package:travanix/presentation/views/home_layout/widgets/custom_drawer.dart';


class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell ;

  @override
  Widget build(BuildContext context) {


    return BlocProvider<HomeLayoutCubit>(
      create: (context) => HomeLayoutCubit()..getCountry(),
      child: BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
        listener: (context, state) {
          if(state is ErrorGetCountryState){
            errorToast(state.errorMessage);
          }
        },
        builder: (context, state) {
          HomeLayoutCubit cubit = HomeLayoutCubit.get(context);
          return Scaffold(
            body: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: CustomDrawer(cubit: cubit,navigationShell: navigationShell,),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  flex: 15,
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: navigationShell,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

