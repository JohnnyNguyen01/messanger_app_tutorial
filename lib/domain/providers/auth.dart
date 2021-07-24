import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'error.dart';
import 'device_services.dart';
import 'repositories.dart';
import '../models/states/auth/auth_state.dart';
import '../notifiers/auth.dart';

/// Auth Notifier Provider
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authRepo = ref.read(authRepoProvider);
  final pickerService = ref.read(imagePickerServiceProvider);
  final databaseRepository = ref.read(databaseRepoProvider);
  final storageRepo = ref.read(storageRepoProvider);
  final errorNotifier = ref.read(errorProvider.notifier);
  return AuthNotifier(
      authRepo: authRepo,
      databaseRepository: databaseRepository,
      pickerService: pickerService,
      storageRepo: storageRepo,
      errorNotifier: errorNotifier);
});
