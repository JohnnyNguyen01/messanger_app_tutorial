import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'device_services.dart';
import 'repositories.dart';
import '../models/states/auth/auth_state.dart';
import '../notifiers/auth.dart';

/// Auth Repository Provider
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authRepo = ref.read(authRepoProvider);
  final pickerService = ref.read(imagePickerServiceProvider);
  return AuthNotifier(authRepo: authRepo, pickerService: pickerService);
});
