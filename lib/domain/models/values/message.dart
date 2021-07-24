import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart';

/// Message model
@freezed
class Message with _$Message {
  /// Message model constructor
  const factory Message({
    required String? uid,
    required String? message,
    required DateTime? timeStamp,
    required String? profileImageUrl,
  }) = _Message;

  /// Create a message model from a json object
  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}
