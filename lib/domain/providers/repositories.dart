import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:youtube_messenger_tutorial/domain/services/auth/auth.dart';
import 'package:youtube_messenger_tutorial/domain/services/auth/auth_implementation.dart';

/// Auth Repository Provider
final authRepoProvider =
    Provider<AuthRepository>((ref) => AuthRepositoryImplementation());
