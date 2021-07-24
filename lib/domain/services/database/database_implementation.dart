import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/values/message.dart';
import '../../../constants/database_paths.dart';
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

  @override
  Future<User?> getUser({required String? uid}) async {
    try {
      // get the document from firebase
      final docSnapshot =
          await _database.collection(usersRootCollection).doc(uid).get();
      final docData = docSnapshot.data();
      // convert document to user
      return docData != null
          ? User.fromJson(docData)
          : throw Failure(message: 'Error retrieving your profile details');
    } on FirebaseException catch (e) {
      throw Failure(code: e.code, message: e.message);
    }
  }

  @override
  Future<void> addNewMessage({Message? message}) async {
    print('function called');
    try {
      if (message != null)
        await _database
            .collection(messagesRootCollection)
            .add(message.toJson());
    } on FirebaseException catch (e) {
      throw Failure(code: e.code, message: e.message);
    }
  }

  @override
  Future<Stream<List<Message>>> getMessageStream() async {
    try {
      // get the collection and order by timestamp
      final snapshotStream = _database
          .collection(messagesRootCollection)
          .orderBy('timestamp', descending: true)
          .snapshots();
      // stream conversion
      return snapshotStream.asBroadcastStream().map((querySnapshot) =>
          // convert each doc to a Message object
          querySnapshot.docs
              .map((docSnapshot) => Message.fromJson(docSnapshot.data()))
              .toList());
    } on FirebaseException catch (e) {
      throw Failure(code: e.code, message: e.message);
    }
  }
}
