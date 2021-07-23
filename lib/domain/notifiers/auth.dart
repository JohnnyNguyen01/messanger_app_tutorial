import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../models/states/auth/auth_state.dart';
import '../models/values/failure.dart';
import '../services/auth/auth.dart';
import '../models/values/user.dart';

/// State Notifer for [User]
class AuthNotifier extends StateNotifier<AuthState> {
  /// State Notifier Constructor
  ///
  /// Here we declare that the initial state of the User being unauthenticated
  AuthNotifier({required AuthRepository authRepo})
      : _authRepo = authRepo,
        super(AuthState.unAuthenticated());

  final AuthRepository _authRepo;

  /// Sign up the current user using their email and password. If successful,
  /// navigate to messaging screen.
  Future<void> signUpWithEmailAndPassword(
      {required String? email, required String? password}) async {
    try {
      // sign up user
      await _authRepo.signupWithEmailAndPassword(
          email: email, password: password);
      // set firestore documents

      // set storage images

      // set user state

    } on Failure catch (e) {
      state = AuthState.error(e.message);
    }
  }

  /// Login the user with an email and password
  Future<void> loginWithEmailPassword(
      {required String? email, required String? password}) async {
    try {
      await _authRepo.loginWithEmailAndPassword(
          email: email, password: password);
      //todo: change to values from firebase
      final user = User(
          email: email, firstName: 'Johnny', lastName: 'Nguyen', uid: 'uid');
      state = AuthState.authenticated(user);
    } on Failure catch (e) {
      state = AuthState.error(e.message);
    }
  }
}
