import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homzes_app/features/get_rentals/domain/usecases/get_rentals.dart';
import 'package:homzes_app/features/get_rentals/presentation/bloc/rentals_event.dart';
import 'package:homzes_app/features/get_rentals/presentation/bloc/rentals_state.dart';

class RentalsBloc extends Bloc<RentalsEvent, RentalsState> {
  final GetRentalsUseCase _getRentalsUseCase;

  RentalsBloc(this._getRentalsUseCase) : super(RentalsEmpty()) {
    on<OnGetRentals>((event, emit) async {
      emit(RentalsLoading());
      final result = await _getRentalsUseCase.execute();
      print('result : $result');
      result.fold((failure) {
        emit(RentalsLoadFailure(failure.message));
      }, (data) {
        emit(RentalsLoaded(data));
      });
    });
  }
}
