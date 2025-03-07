import 'package:dartz/dartz.dart';
import 'package:homzes_app/core/error/faliure.dart';
import 'package:homzes_app/features/get_rentals/domain/entities/rentals.dart';
import 'package:homzes_app/features/get_rentals/domain/repositories/rental_repository.dart';

class GetRentalsUseCase {
  final RentalRepository rentalRepository;

  GetRentalsUseCase(this.rentalRepository);

  Future<Either<Failure, List<RentalsEntity>>> execute() {
    return rentalRepository.getRentals();
  }
}
