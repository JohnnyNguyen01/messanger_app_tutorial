import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/values/failure.dart';
import '../../models/values/user.dart';
import 'database_repository.dart';

/// Database Repository implemnation
class DatabaseImplementation implements DatabaseRepository {
  final _database = FirebaseFirestore.instance;

  @override
  Future<void> addNewUser({required User? user}) async {
    try {
      if (user != null) {
        await _database.collection('Users').doc(user.uid).set(user.toJson());
      }
    } on FirebaseException catch (e) {
      throw Failure(code: e.code, message: e.message);
    }
  }
}
