import 'package:firebase_auth/firebase_auth.dart';
import '../../models/values/failure.dart';
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
