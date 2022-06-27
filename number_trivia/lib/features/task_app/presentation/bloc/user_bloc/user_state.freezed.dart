// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserEntity user) logged,
    required TResult Function(String message) loggedOut,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(UserEntity user)? logged,
    TResult Function(String message)? loggedOut,
    TResult Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserEntity user)? logged,
    TResult Function(String message)? loggedOut,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Logged value) logged,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_Loading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Logged value)? logged,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_Loading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Logged value)? logged,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res> implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  final UserState _value;
  // ignore: unused_field
  final $Res Function(UserState) _then;
}

/// @nodoc
abstract class _$$_LoggedCopyWith<$Res> {
  factory _$$_LoggedCopyWith(_$_Logged value, $Res Function(_$_Logged) then) =
      __$$_LoggedCopyWithImpl<$Res>;
  $Res call({UserEntity user});
}

/// @nodoc
class __$$_LoggedCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements _$$_LoggedCopyWith<$Res> {
  __$$_LoggedCopyWithImpl(_$_Logged _value, $Res Function(_$_Logged) _then)
      : super(_value, (v) => _then(v as _$_Logged));

  @override
  _$_Logged get _value => super._value as _$_Logged;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$_Logged(
      user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity,
    ));
  }
}

/// @nodoc

class _$_Logged implements _Logged {
  const _$_Logged(this.user);

  @override
  final UserEntity user;

  @override
  String toString() {
    return 'UserState.logged(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Logged &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$$_LoggedCopyWith<_$_Logged> get copyWith =>
      __$$_LoggedCopyWithImpl<_$_Logged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserEntity user) logged,
    required TResult Function(String message) loggedOut,
    required TResult Function() loading,
  }) {
    return logged(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(UserEntity user)? logged,
    TResult Function(String message)? loggedOut,
    TResult Function()? loading,
  }) {
    return logged?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserEntity user)? logged,
    TResult Function(String message)? loggedOut,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (logged != null) {
      return logged(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Logged value) logged,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_Loading value) loading,
  }) {
    return logged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Logged value)? logged,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_Loading value)? loading,
  }) {
    return logged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Logged value)? logged,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (logged != null) {
      return logged(this);
    }
    return orElse();
  }
}

abstract class _Logged implements UserState {
  const factory _Logged(final UserEntity user) = _$_Logged;

  UserEntity get user => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_LoggedCopyWith<_$_Logged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoggedOutCopyWith<$Res> {
  factory _$$_LoggedOutCopyWith(
          _$_LoggedOut value, $Res Function(_$_LoggedOut) then) =
      __$$_LoggedOutCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$$_LoggedOutCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements _$$_LoggedOutCopyWith<$Res> {
  __$$_LoggedOutCopyWithImpl(
      _$_LoggedOut _value, $Res Function(_$_LoggedOut) _then)
      : super(_value, (v) => _then(v as _$_LoggedOut));

  @override
  _$_LoggedOut get _value => super._value as _$_LoggedOut;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$_LoggedOut(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LoggedOut implements _LoggedOut {
  const _$_LoggedOut(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'UserState.loggedOut(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoggedOut &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_LoggedOutCopyWith<_$_LoggedOut> get copyWith =>
      __$$_LoggedOutCopyWithImpl<_$_LoggedOut>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserEntity user) logged,
    required TResult Function(String message) loggedOut,
    required TResult Function() loading,
  }) {
    return loggedOut(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(UserEntity user)? logged,
    TResult Function(String message)? loggedOut,
    TResult Function()? loading,
  }) {
    return loggedOut?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserEntity user)? logged,
    TResult Function(String message)? loggedOut,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (loggedOut != null) {
      return loggedOut(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Logged value) logged,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_Loading value) loading,
  }) {
    return loggedOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Logged value)? logged,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_Loading value)? loading,
  }) {
    return loggedOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Logged value)? logged,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (loggedOut != null) {
      return loggedOut(this);
    }
    return orElse();
  }
}

abstract class _LoggedOut implements UserState {
  const factory _LoggedOut(final String message) = _$_LoggedOut;

  String get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_LoggedOutCopyWith<_$_LoggedOut> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, (v) => _then(v as _$_Loading));

  @override
  _$_Loading get _value => super._value as _$_Loading;
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'UserState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserEntity user) logged,
    required TResult Function(String message) loggedOut,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(UserEntity user)? logged,
    TResult Function(String message)? loggedOut,
    TResult Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserEntity user)? logged,
    TResult Function(String message)? loggedOut,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Logged value) logged,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_Loading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Logged value)? logged,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_Loading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Logged value)? logged,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements UserState {
  const factory _Loading() = _$_Loading;
}
