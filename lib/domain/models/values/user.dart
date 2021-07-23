import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

/// User Model
@freezed
class User with _$User {
  /// User Model Constructor
  const factory User(
      {@required String? email,
      @required String? firstName,
      @required String? lastName,
      @required String? uid,
      @required String? profileImageUrl}) = _User;

  /// Create User From JSON Object
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
