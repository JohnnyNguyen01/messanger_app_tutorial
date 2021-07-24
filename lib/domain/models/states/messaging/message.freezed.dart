// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MessageStateTearOff {
  const _$MessageStateTearOff();

  Idle idle() {
    return const Idle();
  }

  SendingMessage sendingMessage({required Message message}) {
    return SendingMessage(
      message: message,
    );
  }

  Error error([String? error]) {
    return Error(
      error,
    );
  }
}

/// @nodoc
const $MessageState = _$MessageStateTearOff();

/// @nodoc
mixin _$MessageState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(Message message) sendingMessage,
    required TResult Function(String? error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(Message message)? sendingMessage,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(SendingMessage value) sendingMessage,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(SendingMessage value)? sendingMessage,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageStateCopyWith<$Res> {
  factory $MessageStateCopyWith(
          MessageState value, $Res Function(MessageState) then) =
      _$MessageStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$MessageStateCopyWithImpl<$Res> implements $MessageStateCopyWith<$Res> {
  _$MessageStateCopyWithImpl(this._value, this._then);

  final MessageState _value;
  // ignore: unused_field
  final $Res Function(MessageState) _then;
}

/// @nodoc
abstract class $IdleCopyWith<$Res> {
  factory $IdleCopyWith(Idle value, $Res Function(Idle) then) =
      _$IdleCopyWithImpl<$Res>;
}

/// @nodoc
class _$IdleCopyWithImpl<$Res> extends _$MessageStateCopyWithImpl<$Res>
    implements $IdleCopyWith<$Res> {
  _$IdleCopyWithImpl(Idle _value, $Res Function(Idle) _then)
      : super(_value, (v) => _then(v as Idle));

  @override
  Idle get _value => super._value as Idle;
}

/// @nodoc

class _$Idle implements Idle {
  const _$Idle();

  @override
  String toString() {
    return 'MessageState.idle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Idle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(Message message) sendingMessage,
    required TResult Function(String? error) error,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(Message message)? sendingMessage,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(SendingMessage value) sendingMessage,
    required TResult Function(Error value) error,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(SendingMessage value)? sendingMessage,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class Idle implements MessageState {
  const factory Idle() = _$Idle;
}

/// @nodoc
abstract class $SendingMessageCopyWith<$Res> {
  factory $SendingMessageCopyWith(
          SendingMessage value, $Res Function(SendingMessage) then) =
      _$SendingMessageCopyWithImpl<$Res>;
  $Res call({Message message});

  $MessageCopyWith<$Res> get message;
}

/// @nodoc
class _$SendingMessageCopyWithImpl<$Res>
    extends _$MessageStateCopyWithImpl<$Res>
    implements $SendingMessageCopyWith<$Res> {
  _$SendingMessageCopyWithImpl(
      SendingMessage _value, $Res Function(SendingMessage) _then)
      : super(_value, (v) => _then(v as SendingMessage));

  @override
  SendingMessage get _value => super._value as SendingMessage;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(SendingMessage(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as Message,
    ));
  }

  @override
  $MessageCopyWith<$Res> get message {
    return $MessageCopyWith<$Res>(_value.message, (value) {
      return _then(_value.copyWith(message: value));
    });
  }
}

/// @nodoc

class _$SendingMessage implements SendingMessage {
  const _$SendingMessage({required this.message});

  @override
  final Message message;

  @override
  String toString() {
    return 'MessageState.sendingMessage(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SendingMessage &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  $SendingMessageCopyWith<SendingMessage> get copyWith =>
      _$SendingMessageCopyWithImpl<SendingMessage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(Message message) sendingMessage,
    required TResult Function(String? error) error,
  }) {
    return sendingMessage(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(Message message)? sendingMessage,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (sendingMessage != null) {
      return sendingMessage(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(SendingMessage value) sendingMessage,
    required TResult Function(Error value) error,
  }) {
    return sendingMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(SendingMessage value)? sendingMessage,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (sendingMessage != null) {
      return sendingMessage(this);
    }
    return orElse();
  }
}

abstract class SendingMessage implements MessageState {
  const factory SendingMessage({required Message message}) = _$SendingMessage;

  Message get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SendingMessageCopyWith<SendingMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) then) =
      _$ErrorCopyWithImpl<$Res>;
  $Res call({String? error});
}

/// @nodoc
class _$ErrorCopyWithImpl<$Res> extends _$MessageStateCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(Error _value, $Res Function(Error) _then)
      : super(_value, (v) => _then(v as Error));

  @override
  Error get _value => super._value as Error;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(Error(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$Error implements Error {
  const _$Error([this.error]);

  @override
  final String? error;

  @override
  String toString() {
    return 'MessageState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Error &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  $ErrorCopyWith<Error> get copyWith =>
      _$ErrorCopyWithImpl<Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(Message message) sendingMessage,
    required TResult Function(String? error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(Message message)? sendingMessage,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(SendingMessage value) sendingMessage,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(SendingMessage value)? sendingMessage,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements MessageState {
  const factory Error([String? error]) = _$Error;

  String? get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ErrorCopyWith<Error> get copyWith => throw _privateConstructorUsedError;
}
