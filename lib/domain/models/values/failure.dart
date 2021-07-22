import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

/// Failure Model
///
/// Used to map and provide error values to the user
@freezed
class Failure with _$Failure {
  /// Failure constructor
  const factory Failure({required String? message, String? code}) = _Failure;
}
