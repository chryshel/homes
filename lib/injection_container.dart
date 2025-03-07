import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:homzes_app/features/get_rentals/data/data_sources/remote_data_source.dart';
import 'package:homzes_app/features/get_rentals/data/repositories/rentals_repository_impl.dart';
import 'package:homzes_app/features/get_rentals/domain/repositories/rental_repository.dart';
import 'package:homzes_app/features/get_rentals/domain/usecases/get_rentals.dart';
import 'package:homzes_app/features/get_rentals/presentation/bloc/rentals_bloc.dart';

final locator = GetIt.instance;

void setupLocator() {
  // bloc
  locator.registerFactory(() => RentalsBloc(locator()));

  // usecase
  locator.registerLazySingleton(() => GetRentalsUseCase(locator()));

  // repository
  locator.registerLazySingleton<RentalRepository>(
      () => RentalsRepositoryImpl(remoteDataSource: locator()));

  // data source
  locator.registerLazySingleton<RentalsRemoteDataSource>(
      () => RentalsRemoteDataSourceImpl(db: locator()));

  // external
  locator.registerLazySingleton(() => FirebaseFirestore.instance);
}
