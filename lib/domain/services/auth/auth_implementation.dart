import 'package:firebase_auth/firebase_auth.dart';
import '../../models/values/failure.dart';
import 'auth.dart';

/// Implementaiton of the Auth Repository
///
/// Here I am using Firebase, however, in can be swapped with whatever
/// service you like.
class AuthRepositoryImplementation implements AuthRepository {
  @override
  Future<String?> loginWithEmailAndPassword(
      {required String? email, required String? password}) async {
    try {
      if (email != null && password != null) {
        final userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        return userCredential.user?.uid;
      }
    } on FirebaseAuthException catch (e) {
      throw Failure(code: e.code, message: e.message);
    }
  }

  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<String?> signupWithEmailAndPassword(
      {required String? email, required String? password}) async {
    try {
      if (email != null && password != null) {
        final userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        return userCredential.user?.uid;
      }
    } on FirebaseAuthException catch (e) {
      throw Failure(code: e.code, message: e.message);
    }
  }
}
