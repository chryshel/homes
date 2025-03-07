import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:homzes_app/features/get_rentals/data/models/rentals_model.dart';
import 'package:homzes_app/features/get_rentals/domain/entities/rentals.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/json_reader.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main() {
  const testRentalModel = RentalsModel(
      title: 'Charuki Hotel',
      price: 10000,
      images: [
        "https://example.com/image1.jpg",
        "https://example.com/image2.jpg"
      ],
      location: GeoPoint(40.712776, -74.005974),
      bathRoomCount: 3,
      bedRoomCount: 2);

  test('should be a subclass of rentals entity', () async {
    expect(testRentalModel, isA<RentalsEntity>());
  });

  test('should return a valid model from json', () async {
    // arrange
    final Map<String, dynamic> jsonMap =
        json.decode(readJson('helpers/dummy_data/dummy_rentals_response.json'));

    // Convert 'location' to a Firestore GeoPoint manually
    jsonMap['location'] = GeoPoint(
      jsonMap['location']['latitude'],
      jsonMap['location']['longitude'],
    );

    // act
    final mockSnapshot = MockDocumentSnapshot<Map<String, dynamic>>();
    when(mockSnapshot.data()).thenReturn(jsonMap);

    final result = RentalsModel.fromFireStore(mockSnapshot);

    // assert
    expect(result, equals(testRentalModel));
  });

  test('should return a proper map containing proper data for Firestore', () {
    // arrange
    const testRentalModel = RentalsModel(
      title: "Charuki Hotel",
      price: 10000,
      images: [
        "https://example.com/image1.jpg",
        "https://example.com/image2.jpg"
      ],
      location: GeoPoint(40.712776, -74.005974),
      bathRoomCount: 3,
      bedRoomCount: 2,
    );

    // act
    final result = testRentalModel.toFireStore();

    result['location'] = {
      "latitude": (result['location'] as GeoPoint).latitude,
      "longitude": (result['location'] as GeoPoint).longitude
    };

    // expected JSON structure
    final expectedJsonMap = {
      "title": "Charuki Hotel",
      "price": 10000,
      "images": [
        "https://example.com/image1.jpg",
        "https://example.com/image2.jpg"
      ],
      "location": {"latitude": 40.712776, "longitude": -74.005974},
      "bathRoomCount": 3,
      "bedRoomCount": 2
    };

    // assert
    expect(result, equals(expectedJsonMap));
  });
}
