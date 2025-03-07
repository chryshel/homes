import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:homzes_app/features/get_rentals/domain/entities/rentals.dart';
import 'package:homzes_app/features/get_rentals/domain/usecases/get_rentals.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../helpers/test_helper.mocks.dart';
import 'package:mockito/mockito.dart';

void main() {
  late GetRentalsUseCase getRentalsUseCase;
  late MockRentalRepository mockRentalRepository;

  setUp(() {
    mockRentalRepository = MockRentalRepository();
    getRentalsUseCase = GetRentalsUseCase(mockRentalRepository);
  });

  const testRentals = RentalsEntity(
      title: 'Charuki Hotel',
      price: 10000,
      images: [
        "https://example.com/image1.jpg",
        "https://example.com/image2.jpg"
      ],
      location: GeoPoint(40.712776, -74.005974),
      bathRoomCount: 3,
      bedRoomCount: 2);

  test('should get rentals options from repository', () async {
    // arrange
    when(mockRentalRepository.getRentals())
        .thenAnswer((_) async => const Right([testRentals]));
    //act
    final result = await getRentalsUseCase.execute();

    // assert
    expect(result, const Right([testRentals]));
  });
}
