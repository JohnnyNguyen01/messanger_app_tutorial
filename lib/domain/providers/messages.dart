import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'repositories.dart';
import '../models/values/message.dart';

/// Provides a stream of all the messages within the database.
final messagesProvider = StreamProvider<List<Message>>((ref) {
  final databaseRepo = ref.read(databaseRepoProvider);
  final messageStream = databaseRepo.getMessageStream();
  return messageStream;
});
