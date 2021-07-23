import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../models/values/failure.dart';

/// Error Notifier
class ErrorNotifier extends StateNotifier<Failure?> {
  /// Error Notifier constructor
  ErrorNotifier() : super(Failure(message: ''));

  /// set new error
  void setNewError(Failure? failure) {
    state = failure;
  }
}
