import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/core/routes/error_routing_page.dart';
import 'package:travanix/data/models/trip_model/TripModel.dart';
import 'package:travanix/presentation/views/create_items/create_hotel.dart';
import 'package:travanix/presentation/views/create_items/create_restaurant.dart';
import 'package:travanix/presentation/views/create_items/create_tourist_dis.dart';
import 'package:travanix/presentation/views/create_items/create_trip.dart';
import 'package:travanix/presentation/views/home/home.dart';
import 'package:travanix/presentation/views/home_layout/home_layout.dart';
import 'package:travanix/presentation/views/item_details/restaurant_details.dart';
import 'package:travanix/presentation/views/item_details/tourist_dis_details.dart';
import 'package:travanix/presentation/views/item_details/trip_details.dart';
import 'package:travanix/presentation/views/login/login.dart';
import 'package:travanix/presentation/views/reservations/reservations.dart';
import 'package:travanix/presentation/views/search_items/search_hotels.dart';
import 'package:travanix/presentation/views/search_items/search_plans.dart';
import 'package:travanix/presentation/views/search_items/search_restaurants.dart';
import 'package:travanix/presentation/views/search_items/search_tourist_dis.dart';
import 'package:travanix/presentation/views/item_details/hotel_details.dart';
import 'package:travanix/presentation/views/update_item/update_trip.dart';
import 'package:travanix/presentation/views/wallet_recharge/wallet_recharge.dart';

abstract class AppRouter {
  static bool canExitFromLoginScreen = false;

  static const String loginRouteName = 'login';
  static const String loginRoute = '/login';

  static const String homeLayoutRoute = '/';
  static const String homeRouteName = 'home';
  static const String notificationRouteName = 'reservations';
  static const String usersRouteName = 'users';
  static const String newPlanRouteName = 'new_plan';
  static const String newHotelRouteName = 'new_hotel';
  static const String newRestaurantRouteName = 'new_restaurant';
  static const String newTouristDisRouteName = 'new_tourist_dis';

  static const String getPlanRouteName = 'get_plan';
  static const String getHotelRouteName = 'get_hotel';
  static const String getRestaurantRouteName = 'get_restaurant';
  static const String getTouristDisRouteName = 'get_tourist_dis';

  static const List<String> routesOfHomeLayoutBranches = [
    'home',
    'wallet_recharge',
    'reservations',
    'new_plan',
    'new_hotel',
    'new_restaurant',
    'new_tourist_dis',
    'get_plan',
    'get_hotel',
    'get_restaurant',
    'get_tourist_dis',
  ];

  static final GoRouter router = GoRouter(
    initialLocation: loginRoute,
    routes: [
      GoRoute(
        name: loginRouteName,
        path: loginRoute,
        onExit: (context, state) => canExitFromLoginScreen,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: homeLayoutRoute,
        onExit: (context, state) => false,
        builder: (context, state) {
          return const ErrorRoutingPage();
        },
        routes: [
          StatefulShellRoute.indexedStack(
            builder: (BuildContext context, GoRouterState state,
                StatefulNavigationShell navigationShell) {
              return HomeLayout(navigationShell: navigationShell);
            },
            branches: [
              StatefulShellBranch(routes: [
                GoRoute(
                    name: homeRouteName,
                    path: routesOfHomeLayoutBranches[0],
                    pageBuilder: (context, state) {
                      return MaterialPage(child: HomeScreen());
                    }),
              ]),
              StatefulShellBranch(routes: [
                GoRoute(
                    name: usersRouteName,
                    path: routesOfHomeLayoutBranches[1],
                    pageBuilder: (context, state) {
                      return const MaterialPage(child: WalletRecharge());
                    }),
              ]),
              StatefulShellBranch(routes: [
                GoRoute(
                    name: notificationRouteName,
                    path: routesOfHomeLayoutBranches[2],
                    pageBuilder: (context, state) {
                      return const MaterialPage(
                        child: ReservationsScreen()
                      );
                    }),
              ]),
              StatefulShellBranch(routes: [
                GoRoute(
                    name: newPlanRouteName,
                    path: routesOfHomeLayoutBranches[3],
                    pageBuilder: (context, state) {
                      return const MaterialPage(
                        child: CreateTrip(),
                      );
                    }),
              ]),
              StatefulShellBranch(routes: [
                GoRoute(
                    name: newHotelRouteName,
                    path: routesOfHomeLayoutBranches[4],
                    pageBuilder: (context, state) {
                      return const MaterialPage(
                        child: CreateNewHotel(),
                      );
                    }),
              ]),
              StatefulShellBranch(routes: [
                GoRoute(
                    name: newRestaurantRouteName,
                    path: routesOfHomeLayoutBranches[5],
                    pageBuilder: (context, state) {
                      return const MaterialPage(
                        child: CreateRestaurant(),
                      );
                    }),
              ]),
              StatefulShellBranch(routes: [
                GoRoute(
                    name: newTouristDisRouteName,
                    path: routesOfHomeLayoutBranches[6],
                    pageBuilder: (context, state) {
                      return const MaterialPage(child: CreateNewTouristDis());
                    }),
              ]),
              StatefulShellBranch(routes: [
                GoRoute(
                    name: getPlanRouteName,
                    path: routesOfHomeLayoutBranches[7],
                    pageBuilder: (context, state) {
                      return const MaterialPage(
                        child: SearchTrip(),
                      );
                    }),
                GoRoute(
                    name: 'trip_details/:id',
                    path: 'trip_details/:id',
                    pageBuilder: (context, state) {
                      return MaterialPage(
                        child: TripDetails(tripId: int.parse(state.pathParameters['id']!),),
                      );
                    }),
                GoRoute(
                    name: 'trip_update',
                    path: 'trip_update',
                    pageBuilder: (context, state) {
                      return MaterialPage(
                        child: UpdateTrip(tripModel: state.extra as TripModel,),
                      );
                    }),
              ]),
              StatefulShellBranch(routes: [
                GoRoute(
                    name: getHotelRouteName,
                    path: routesOfHomeLayoutBranches[8],
                    pageBuilder: (context, state) {
                      return const MaterialPage(
                        child: SearchHotel(),
                      );
                    }),
                GoRoute(
                    name: 'hotel_details/:id',
                    path: 'hotel_details/:id',
                    pageBuilder: (context, state) {
                      return MaterialPage(
                        child: HotelDetails(hotelId: int.parse(state.pathParameters['id']!),),
                      );
                    }),
              ]),
              StatefulShellBranch(routes: [
                GoRoute(
                    name: getRestaurantRouteName,
                    path: routesOfHomeLayoutBranches[9],
                    pageBuilder: (context, state) {
                      return const MaterialPage(
                        child: SearchRestaurant(),
                      );
                    }),
                GoRoute(
                    name: 'restaurant_details',
                    path: 'restaurant_details/:id',
                    pageBuilder: (context, state) {

                      return MaterialPage(
                        child: RestaurantDetails(restaurantId: int.parse(state.pathParameters['id']!),),
                      );
                    }),
              ]),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    name: getTouristDisRouteName,
                    path: routesOfHomeLayoutBranches[10],
                    pageBuilder: (context, state) {
                      return const MaterialPage(
                        child: SearchTouristDis(),
                      );
                    },
                  ),
                  GoRoute(
                      name: 'tourist_dis_details/:id',
                      path: 'tourist_dis_details/:id',
                      pageBuilder: (context, state) {
                        print(int.parse(state.pathParameters['id']!));
                        return MaterialPage(
                          child: TouristDisDetails(touristDisId: int.parse(state.pathParameters['id']!),),
                        );
                      }),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
    errorPageBuilder: (context, state) {
      return const MaterialPage(child: ErrorRoutingPage());
    },
  );
}
