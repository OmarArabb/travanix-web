import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/core/routes/error_routing_page.dart';
import 'package:travanix/presentation/views/home_layout/home_layout.dart';
import 'package:travanix/presentation/views/login/login.dart';

abstract class AppRouter {
  static bool canExitFromLoginScreen = false;

  static const String loginRouteName = 'login';
  static const String loginRoute = '/login';

  static const String homeLayoutRoute = '/';
  static const String homeRouteName = 'home';
  static const String notificationRouteName = 'notification';
  static const String newPlanRouteName = 'new_plan';
  static const String newHotelRouteName = 'new_hotel';
  static const String newRestaurantRouteName = 'new_restaurant';
  static const String newTouristDisRouteName = 'new_tourist_dis';

  static const List<String> routesOfHomeLayoutBranches = [
    'home',
    'notification',
    'new_plan',
    'new_hotel',
    'new_restaurant',
    'new_tourist_dis',
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
                        return MaterialPage(
                          child: Container(
                            color: Colors.indigo,
                          ),
                        );
                      }),
                ]),
                StatefulShellBranch(routes: [
                  GoRoute(
                      name: notificationRouteName,
                      path: routesOfHomeLayoutBranches[1],
                      pageBuilder: (context, state) {
                        return MaterialPage(
                          child: Container(
                            color: Colors.black,
                          ),
                        );
                      }),
                ]),
                StatefulShellBranch(routes: [
                  GoRoute(
                      name: newPlanRouteName,
                      path: routesOfHomeLayoutBranches[2],
                      pageBuilder: (context, state) {
                        return MaterialPage(
                          child: Container(
                            color: Colors.grey,
                          ),
                        );
                      }),
                ]),
                StatefulShellBranch(routes: [
                  GoRoute(
                      name: newHotelRouteName,
                      path: routesOfHomeLayoutBranches[3],
                      pageBuilder: (context, state) {
                        return MaterialPage(
                          child: Container(
                            color: Colors.red,
                          ),
                        );
                      }),
                ]),
                StatefulShellBranch(routes: [
                  GoRoute(
                      name: newRestaurantRouteName,
                      path: routesOfHomeLayoutBranches[4],
                      pageBuilder: (context, state) {
                        return MaterialPage(
                          child: Container(
                            color: Colors.pink,
                          ),
                        );
                      }),
                ]),
                StatefulShellBranch(routes: [
                  GoRoute(
                      name: newTouristDisRouteName,
                      path: routesOfHomeLayoutBranches[5],
                      pageBuilder: (context, state) {
                        return MaterialPage(
                          child: Container(
                            color: Colors.orangeAccent,
                          ),
                        );
                      }),
                ]),
              ]),
        ],
      ),
    ],
    errorPageBuilder: (context, state) {
      return const MaterialPage(child: ErrorRoutingPage());
    },
  );
}

/*
* GoRouter(initialLocation: '/', routes: [
    StatefulShellRoute.indexedStack(
        builder: (BuildContext context, GoRouterState state,
            StatefulNavigationShell navigationShell) {
          return ScaffoldWithSideBar(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(routes: [
            GoRoute(
                name: 'root',
                path: '/',
                pageBuilder: (context, state) {
                  return const MaterialPage(child: DashboardScreen());
                }),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
                name: 'units',
                path: '/units',
                pageBuilder: (context, state) {
                  return const MaterialPage(child: UnitsScreen());
                }),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
                name: 'tenants',
                path: '/tenants',
                pageBuilder: (context, state) {
                  return const MaterialPage(child: TenantsScreen());
                }),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
                name: 'notices',
                path: '/notices',
                pageBuilder: (context, state) {
                  return const MaterialPage(child: NoticesScreen());
                }),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
                name: 'settings',
                path: '/settings',
                pageBuilder: (context, state) {
                  return const MaterialPage(child: SettingsScreen());
                }),
          ]),
        ]),
  ]);
});
* */
