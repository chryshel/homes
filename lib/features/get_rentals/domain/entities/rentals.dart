import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class RentalsEntity extends Equatable {
  const RentalsEntity({
    required this.title,
    required this.price,
    required this.images,
    required this.location,
    required this.bathRoomCount,
    required this.bedRoomCount,
  });

  final String title;
  final int price;
  final List<dynamic> images;
  final GeoPoint location;
  final int bathRoomCount;
  final int bedRoomCount;

  @override
  List<Object?> get props => [
        title,
        price,
        images,
        location,
        bathRoomCount,
        bedRoomCount,
      ];
}
