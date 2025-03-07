import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homzes_app/features/get_rentals/domain/entities/rentals.dart';

class RentalsModel extends RentalsEntity {
  const RentalsModel({
    required title,
    required price,
    required images,
    required location,
    required bathRoomCount,
    required bedRoomCount,
  }) : super(
          title: title,
          price: price,
          images: images,
          location: location,
          bathRoomCount: bathRoomCount,
          bedRoomCount: bedRoomCount,
        );

  factory RentalsModel.fromFireStore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return RentalsModel(
        title: data?['title'],
        price: data?['price'],
        images: data?['images'],
        location: data?['location'] as GeoPoint,
        bathRoomCount: data?['bathRoomCount'],
        bedRoomCount: data?['bedRoomCount']);
  }

  Map<String, dynamic> toFireStore() {
    return {
      "title": title,
      "price": price,
      "images": images,
      "location": location,
      "bathRoomCount": bathRoomCount,
      "bedRoomCount": bedRoomCount,
    };
  }
}
