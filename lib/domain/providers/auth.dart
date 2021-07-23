import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'repositories.dart';
import '../models/states/auth/auth_state.dart';
import '../notifiers/auth.dart';

/// Auth Repository Provider
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authRepo = ref.watch(authRepoProvider);
  return AuthNotifier(authRepo: authRepo);
});
