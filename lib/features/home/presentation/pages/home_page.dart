import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:homzes_app/components/app_bar/common_app_bar.dart';
import 'package:homzes_app/features/get_rentals/presentation/bloc/rentals_bloc.dart';
import 'package:homzes_app/features/get_rentals/presentation/bloc/rentals_state.dart';
import 'package:homzes_app/features/get_rentals/presentation/pages/rentals_page.dart';
import 'package:homzes_app/features/home/presentation/components/featured_rentals_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const pathName = '/home';

  static final route = GoRoute(
    path: pathName,
    builder: (context, state) => MultiBlocProvider(
      providers: const [],
      child: HomePage(
        key: state.pageKey,
      ),
    ),
  );

  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: HomzesAppBar(
          username: "Jerom",
          appBarBackgroundColor: const Color(0xFFF6E781),
          onMenuPressed: () {
            context.go('/');
          }),
      body: SafeArea(
        child: Column(
          children: [
            BlocBuilder<RentalsBloc, RentalsState>(builder: (context, state) {
              if (state is RentalsLoading) {
                return const Expanded(
                  child: Center(
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    ),
                  ),
                );
              }
              if (state is RentalsLoaded) {
                return FeaturedRentalsHomeCardView(
                    featuredRentals: state.result,
                    onViewAllPressed: () {
                      context.go(RentalsPage.pathName, extra: state.result);
                    });
              }
              return Container();
            }),
          ],
        ),
      ),
    );
  }
}
