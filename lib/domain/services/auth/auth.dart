/// Auth Repository Interface
abstract class AuthRepository {
  /// Sign up the user with an email and password.
  ///
  /// Returns the uid of the new user
  Future<String?> signupWithEmailAndPassword(
      {required String? email, required String? password});

  /// Login the user with an email and password
  Future<String?> loginWithEmailAndPassword(
      {required String? email, required String? password});

  /// Sign the user out
  Future<void> signOut();
}
