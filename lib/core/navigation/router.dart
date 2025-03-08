import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homzes_app/features/get_rentals/domain/entities/rentals.dart';
import 'package:homzes_app/features/get_rentals/presentation/pages/rentals_page.dart';
import 'package:homzes_app/features/home/presentation/pages/home_page.dart';
import 'package:homzes_app/features/login/presentation/pages/login_page.dart';

GoRouter getRouter() {
  return GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'home',
            builder: (BuildContext context, GoRouterState state) {
              return const HomePage();
            },
          ),
          GoRoute(
            path: 'rentals',
            builder: (BuildContext context, GoRouterState state) {
              final featuredRentals = state.extra as List<RentalsEntity>;
              return RentalsPage(
                featuredRentals: featuredRentals,
              );
            },
          ),
        ],
      ),
    ],
  );
}
