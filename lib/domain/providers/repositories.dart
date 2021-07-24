import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../services/database/storage_implementation.dart';
import '../services/database/storage_repository.dart';
import '../services/auth/auth.dart';
import '../services/auth/auth_implementation.dart';
import '../services/database/database_implementation.dart';
import '../services/database/database_repository.dart';

/// Auth Repository Provider
final authRepoProvider =
    Provider<AuthRepository>((_) => AuthRepositoryImplementation());

/// Database Repo Provider
final databaseRepoProvider =
    Provider<DatabaseRepository>((_) => DatabaseImplementation());

/// Storage Repo Provider
final storageRepoProvider =
    Provider<StorageRepository>((_) => StorageRepositoryImplementation());
