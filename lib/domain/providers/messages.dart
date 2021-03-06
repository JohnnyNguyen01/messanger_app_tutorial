import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../models/states/auth/auth_state.dart';
import '../models/values/user.dart';
import 'auth.dart';
import 'error.dart';
import '../models/states/messaging/message.dart';
import '../notifiers/messaging.dart';
import 'repositories.dart';
import '../models/values/message.dart';

/// Provides a stream of all the messages within the database.
final messagesProvider =
    StreamProvider.autoDispose<List<Message>>((ref) async* {
  final databaseRepo = ref.read(databaseRepoProvider);
  final messageStream = await databaseRepo.getMessageStream();
  await for (final list in messageStream) {
    yield list;
  }
});

/// State Notfier Provider for Message State
///
/// For when user is typing and sending a message to firestore
final userMessageProvider =
    StateNotifierProvider<UserMessageNotifier, MessageState>((ref) {
  final userState = ref.watch(authProvider);
  final databaseRepo = ref.read(databaseRepoProvider);
  final errorNotifier = ref.read(errorProvider.notifier);
  late User user;
  if (userState is Authenticated) {
    user = userState.user!;
  }
  return UserMessageNotifier(
      user: user, databaseRepo: databaseRepo, errorNotifier: errorNotifier);
});
