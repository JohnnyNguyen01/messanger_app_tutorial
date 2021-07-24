import 'package:freezed_annotation/freezed_annotation.dart';
import '../../values/message.dart';

part 'message.freezed.dart';

/// Message States
@freezed
class MessageState with _$MessageState {
  /// The default state
  const factory MessageState.idle() = Idle;

  /// Message being sent
  const factory MessageState.sendingMessage({required Message message}) =
      SendingMessage;

  /// Error sending message
  const factory MessageState.error([String? error]) = Error;
}
