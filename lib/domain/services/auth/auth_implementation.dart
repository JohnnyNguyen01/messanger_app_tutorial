import 'package:firebase_auth/firebase_auth.dart';
import 'package:youtube_messenger_tutorial/domain/models/values/failure.dart';
import 'auth.dart';

class AuthRepositoryImplementation implements AuthRepository {
  @override
  User? getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<void> loginWithEmailAndPassword(
      {required String? email, required String? password}) async {
    try {
      if (email != null && password != null) {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
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
  Future<void> signupWithEmailAndPassword(
      {required String? email, required String? password}) async {
    try {
      if (email != null && password != null) {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
      }
    } on FirebaseAuthException catch (e) {
      throw Failure(code: e.code, message: e.message);
    }
  }
}
