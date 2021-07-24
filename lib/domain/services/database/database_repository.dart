import '../../models/values/message.dart';

import '../../models/values/user.dart';

/// Database Repository interface
///
/// A 'Contract' that states what the implementation should do, and what it
/// needs to achieve it.
abstract class DatabaseRepository {
  /// Add a new [User] to the database
  Future<void> addNewUser({required User? user});

  /// Fetch a [User] from the database
  Future<User?> getUser({required String? uid});

  /// Add a new [Message] to the database.
  Future<void> addNewMessage({Message? message});

  /// Returns a stream of all the messages within the chat room
  Stream<List<Message>> getMessageStream();
}
