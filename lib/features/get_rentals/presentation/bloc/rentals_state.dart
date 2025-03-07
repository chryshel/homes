import 'package:equatable/equatable.dart';
import 'package:homzes_app/features/get_rentals/domain/entities/rentals.dart';

abstract class RentalsState extends Equatable {
  const RentalsState();

  @override
  List<Object?> get props => [];
}

class RentalsEmpty extends RentalsState {}

class RentalsLoading extends RentalsState {}

class RentalsLoaded extends RentalsState {
  final List<RentalsEntity> result;

  const RentalsLoaded(this.result);

  @override
  List<Object?> get props => [result];
}

class RentalsLoadFailure extends RentalsState {
  final String message;

  const RentalsLoadFailure(this.message);

  @override
  List<Object?> get props => [message];
}
