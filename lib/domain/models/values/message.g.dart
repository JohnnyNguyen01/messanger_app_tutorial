// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Message _$_$_MessageFromJson(Map<String, dynamic> json) {
  return _$_Message(
    uid: json['uid'] as String?,
    message: json['message'] as String?,
    timeStamp: json['timeStamp'] == null
        ? null
        : DateTime.parse(json['timeStamp'] as String),
    profileImageUrl: json['profileImageUrl'] as String?,
  );
}

Map<String, dynamic> _$_$_MessageToJson(_$_Message instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'message': instance.message,
      'timeStamp': instance.timeStamp?.toIso8601String(),
      'profileImageUrl': instance.profileImageUrl,
    };
