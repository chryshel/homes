import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homzes_app/features/get_rentals/domain/repositories/rental_repository.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([RentalRepository, DocumentSnapshot],
    customMocks: [MockSpec<FirebaseFirestore>(as: #MockFireStore)])
void main() {}
