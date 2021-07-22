import 'package:firebase_auth/firebase_auth.dart';

/// Auth Repository Interface
abstract class AuthRepository {
  /// Sign up the user with an email and password
  Future<void> signupWithEmailAndPassword(
      {required String? email, required String? password});

  /// Login the user with an email and password
  Future<void> loginWithEmailAndPassword(
      {required String? email, required String? password});

  /// Sign the user out
  Future<void> signOut();

  /// Return an instance of the user
  User? getUser();
}
