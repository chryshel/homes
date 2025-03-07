import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homzes_app/features/get_rentals/presentation/bloc/rentals_bloc.dart';
import 'package:homzes_app/features/get_rentals/presentation/bloc/rentals_event.dart';
import 'package:homzes_app/features/get_rentals/presentation/bloc/rentals_state.dart';

class RentalsPage extends StatelessWidget {
  const RentalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1D1E22),
        title: const Text(
          'Rentals',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                context.read<RentalsBloc>().add(OnGetRentals());
              },
              child: const Text('Get Rentals'),
            ),

            //

            const SizedBox(height: 30),

            //

            BlocBuilder<RentalsBloc, RentalsState>(builder: (context, state) {
              if (state is RentalsLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is RentalsLoaded) {
                if (kDebugMode) {
                  print('Hello, Flutter!');
                  print(state.result.length);
                }

                return Expanded(
                  // ✅ Add Expanded to constrain ListView height
                  child: ListView.builder(
                    itemCount: state.result.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          children: [
                            Text(
                              "Title: ${state.result[index].title},",
                              style: TextStyle(color: Colors.amber),
                            ),
                            Text(
                              "Bathroom count: ${state.result[index].bathRoomCount}",
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              }
              if (kDebugMode) {
                print('state : $state');
              }
              return Container();
            })
          ],
        ),
      ),
    );
  }
}
