import 'package:freezed_annotation/freezed_annotation.dart';
import '../../values/user.dart';

part 'auth_state.freezed.dart';

/// Auth Events
///
/// During the Sign Up and login process, here are the events that can occur.
@freezed
class AuthState with _$AuthState {
  /// User is UnAuthentiated
  const factory AuthState.unAuthenticated() = UnAuthenticated;

  /// User is Authenticated
  const factory AuthState.authenticated(User? user) = Authenticated;

  /// User is Logging In / Signing uo
  const factory AuthState.loading() = Loading;

  /// Error with login or signup
  const factory AuthState.error([String? message]) = Error;
}
