import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:homzes_app/core/error/exception.dart';
import 'package:homzes_app/core/error/faliure.dart';
import 'package:homzes_app/features/get_rentals/data/data_sources/remote_data_source.dart';
import 'package:homzes_app/features/get_rentals/domain/entities/rentals.dart';
import 'package:homzes_app/features/get_rentals/domain/repositories/rental_repository.dart';

class RentalsRepositoryImpl extends RentalRepository {
  final RentalsRemoteDataSource remoteDataSource;
  RentalsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<RentalsEntity>>> getRentals() async {
    try {
      final result = await remoteDataSource.getRentals();
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
