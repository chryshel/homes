import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:homzes_app/core/error/exception.dart';
import 'package:homzes_app/features/get_rentals/data/models/rentals_model.dart';

abstract class RentalsRemoteDataSource {
  Future<List<RentalsModel>> getRentals();
}

class RentalsRemoteDataSourceImpl extends RentalsRemoteDataSource {
  final FirebaseFirestore db;
  RentalsRemoteDataSourceImpl({required this.db});

  @override
  Future<List<RentalsModel>> getRentals() async {
    try {
      print(db.app.name);
      print(db.databaseId);
      final querySnapshot = await db.collection("Rentals").get();
      print('querySnapshot : $querySnapshot');
      // Convert Firestore documents into a list of RentalsModel
      return querySnapshot.docs
          .map((doc) => RentalsModel.fromFireStore(doc))
          .toList();
    } catch (e) {
      print('server error ${e.toString()}');
      throw ServerException();
    }
  }
}
