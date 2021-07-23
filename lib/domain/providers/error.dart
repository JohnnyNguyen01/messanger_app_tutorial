import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../models/values/failure.dart';
import '../notifiers/error.dart';

/// Error Provider
final errorProvider =
    StateNotifierProvider<ErrorNotifier, Failure?>((ref) => ErrorNotifier());
