import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:homzes_app/components/app_bar/common_app_bar.dart';
import 'package:homzes_app/features/get_rentals/domain/entities/rentals.dart';
import 'package:homzes_app/features/get_rentals/presentation/components/rentals_detailed_card.dart';

class RentalsPage extends StatelessWidget {
  final List<RentalsEntity> featuredRentals;
  const RentalsPage({super.key, required this.featuredRentals});

  static const pathName = '/rentals';

  static final route = GoRoute(
    path: pathName,
    builder: (context, state) => MultiBlocProvider(
      providers: const [],
      child: RentalsPage(
        key: state.pageKey,
        featuredRentals: state.extra as List<RentalsEntity>,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: HomzesAppBar(
          username: "",
          appBarBackgroundColor: const Color.fromARGB(158, 130, 181, 146),
          onMenuPressed: () {
            context.go('/');
          },
          hideUserProfile: true,
        ),
        body: SafeArea(
          child: ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: featuredRentals.length,
            itemBuilder: (context, index) {
              final rental = featuredRentals[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: RentalCard(rental: rental),
              );
            },
          ),
        ));
  }
}
