import 'package:dartz/dartz.dart';
import 'package:homzes_app/core/error/faliure.dart';
import 'package:homzes_app/features/get_rentals/domain/entities/rentals.dart';

abstract class RentalRepository {
  Future<Either<Failure, List<RentalsEntity>>> getRentals();
}
