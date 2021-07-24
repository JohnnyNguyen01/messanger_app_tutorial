import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../models/values/message.dart';
import '../models/states/messaging/message.dart';
import '../models/values/failure.dart';
import 'error.dart';
import '../models/values/user.dart';
import '../services/database/database_repository.dart';

/// Notifier Used to handle Messages Screen and uploading messages
class UserMessageNotifier extends StateNotifier<MessageState> {
  /// [UserMessageNotifier] constructor
  UserMessageNotifier(
      {required User user,
      required DatabaseRepository databaseRepo,
      required ErrorNotifier errorNotifier})
      : _user = user,
        _databaseRepo = databaseRepo,
        _errorNotifier = errorNotifier,
        super(MessageState.idle());

  final User _user;
  final DatabaseRepository _databaseRepo;
  final ErrorNotifier _errorNotifier;

  /// Send a new message to the chat
  Future<void> sendNewMessage({required String messageText}) async {
    try {
      final message = Message(
        uid: _user.uid,
        message: messageText,
        timeStamp: DateTime.now(),
      );
      state = MessageState.sendingMessage(message: message);
      await _databaseRepo.addNewMessage(message: message);
      state = MessageState.idle();
    } on Failure catch (e) {
      _errorNotifier.setNewError(e);
      state = MessageState.error(e.message);
    }
  }
}
