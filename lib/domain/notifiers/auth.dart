import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'error.dart';
import '../services/database/storage_repository.dart';
import '../services/database/database_repository.dart';
import '../services/device/image_picker.dart';
import '../models/states/auth/auth_state.dart';
import '../models/values/failure.dart';
import '../services/auth/auth.dart';
import '../models/values/user.dart';

/// State Notifer for [User]
class AuthNotifier extends StateNotifier<AuthState> {
  /// State Notifier Constructor
  ///
  /// Here we declare that the initial state of the User being unauthenticated
  AuthNotifier(
      {required AuthRepository authRepo,
      required ImagePickerService pickerService,
      required DatabaseRepository databaseRepository,
      required StorageRepository storageRepo,
      required ErrorNotifier errorNotifier})
      : _authRepo = authRepo,
        _pickerService = pickerService,
        _databaseRepo = databaseRepository,
        _storageRepo = storageRepo,
        _errorNotifier = errorNotifier,
        super(AuthState.unAuthenticated());

  final AuthRepository _authRepo;
  final ImagePickerService _pickerService;
  final DatabaseRepository _databaseRepo;
  final StorageRepository _storageRepo;
  final ErrorNotifier _errorNotifier;

  /// sets the state to the `AuthState.SignUpFirstTime` state
  void setToSignUp({required String email, required String password}) {
    state = AuthState.signedUpFirstTime(
        email: email, password: password, imageFile: null);
  }

  /// Get the Image file from the phone's gallery.
  void getImageFileFromGallery() async {
    final currentState = state;
    final imageFile = await _pickerService.getImageFromGallery();
    if (imageFile != null && currentState is SignedUpFirstTime) {
      state = currentState.copyWith(imageFile: imageFile);
    }
  }

  /// Sign up the current user using their email and password. If successful,
  /// navigate to messaging screen.
  Future<void> signUpNewUser(
      {required String email,
      required String password,
      required String firstName,
      required String lastName,
      required File file}) async {
    try {
      // sign up user
      final uid = await _authRepo.signupWithEmailAndPassword(
          email: email, password: password);
      // set storage images
      final imageUrl = await _storageRepo.uploadImage(file, uid);
      // set firestore documents
      final user = User(
          email: email,
          firstName: firstName,
          lastName: lastName,
          uid: uid,
          profileImageUrl: imageUrl);
      await _databaseRepo.addNewUser(user: user);
      // set user state
      state = AuthState.authenticated(user);
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
          email: email,
          firstName: 'Johnny',
          lastName: 'Nguyen',
          uid: 'uid',
          profileImageUrl: null);
      state = AuthState.authenticated(user);
    } on Failure catch (e) {
      state = AuthState.error(e.message);
      _errorNotifier.setNewError(e);
    }
  }
}
