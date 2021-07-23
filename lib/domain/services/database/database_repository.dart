import '../../models/values/user.dart';

/// Database Repository interface
abstract class DatabaseRepository {
  /// Add a new [User] to the database
  Future<void> addNewUser({required User? user});

  ///Add a new [Message] to the database.
  // Future<void> addNewMessage();
}
