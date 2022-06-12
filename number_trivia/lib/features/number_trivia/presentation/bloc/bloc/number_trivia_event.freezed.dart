// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'number_trivia_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NumberTriviaEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int numberString) getTriviaForConcreteNumber,
    required TResult Function() getTriviaForRandomNumber,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int numberString)? getTriviaForConcreteNumber,
    TResult Function()? getTriviaForRandomNumber,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int numberString)? getTriviaForConcreteNumber,
    TResult Function()? getTriviaForRandomNumber,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetTriviaForConcreteNumber value)
        getTriviaForConcreteNumber,
    required TResult Function(_GetTriviaForRandomNumber value)
        getTriviaForRandomNumber,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetTriviaForConcreteNumber value)?
        getTriviaForConcreteNumber,
    TResult Function(_GetTriviaForRandomNumber value)? getTriviaForRandomNumber,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetTriviaForConcreteNumber value)?
        getTriviaForConcreteNumber,
    TResult Function(_GetTriviaForRandomNumber value)? getTriviaForRandomNumber,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NumberTriviaEventCopyWith<$Res> {
  factory $NumberTriviaEventCopyWith(
          NumberTriviaEvent value, $Res Function(NumberTriviaEvent) then) =
      _$NumberTriviaEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$NumberTriviaEventCopyWithImpl<$Res>
    implements $NumberTriviaEventCopyWith<$Res> {
  _$NumberTriviaEventCopyWithImpl(this._value, this._then);

  final NumberTriviaEvent _value;
  // ignore: unused_field
  final $Res Function(NumberTriviaEvent) _then;
}

/// @nodoc
abstract class _$$_GetTriviaForConcreteNumberCopyWith<$Res> {
  factory _$$_GetTriviaForConcreteNumberCopyWith(
          _$_GetTriviaForConcreteNumber value,
          $Res Function(_$_GetTriviaForConcreteNumber) then) =
      __$$_GetTriviaForConcreteNumberCopyWithImpl<$Res>;
  $Res call({int numberString});
}

/// @nodoc
class __$$_GetTriviaForConcreteNumberCopyWithImpl<$Res>
    extends _$NumberTriviaEventCopyWithImpl<$Res>
    implements _$$_GetTriviaForConcreteNumberCopyWith<$Res> {
  __$$_GetTriviaForConcreteNumberCopyWithImpl(
      _$_GetTriviaForConcreteNumber _value,
      $Res Function(_$_GetTriviaForConcreteNumber) _then)
      : super(_value, (v) => _then(v as _$_GetTriviaForConcreteNumber));

  @override
  _$_GetTriviaForConcreteNumber get _value =>
      super._value as _$_GetTriviaForConcreteNumber;

  @override
  $Res call({
    Object? numberString = freezed,
  }) {
    return _then(_$_GetTriviaForConcreteNumber(
      numberString == freezed
          ? _value.numberString
          : numberString // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_GetTriviaForConcreteNumber implements _GetTriviaForConcreteNumber {
  const _$_GetTriviaForConcreteNumber(this.numberString);

  @override
  final int numberString;

  @override
  String toString() {
    return 'NumberTriviaEvent.getTriviaForConcreteNumber(numberString: $numberString)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetTriviaForConcreteNumber &&
            const DeepCollectionEquality()
                .equals(other.numberString, numberString));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(numberString));

  @JsonKey(ignore: true)
  @override
  _$$_GetTriviaForConcreteNumberCopyWith<_$_GetTriviaForConcreteNumber>
      get copyWith => __$$_GetTriviaForConcreteNumberCopyWithImpl<
          _$_GetTriviaForConcreteNumber>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int numberString) getTriviaForConcreteNumber,
    required TResult Function() getTriviaForRandomNumber,
  }) {
    return getTriviaForConcreteNumber(numberString);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int numberString)? getTriviaForConcreteNumber,
    TResult Function()? getTriviaForRandomNumber,
  }) {
    return getTriviaForConcreteNumber?.call(numberString);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int numberString)? getTriviaForConcreteNumber,
    TResult Function()? getTriviaForRandomNumber,
    required TResult orElse(),
  }) {
    if (getTriviaForConcreteNumber != null) {
      return getTriviaForConcreteNumber(numberString);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetTriviaForConcreteNumber value)
        getTriviaForConcreteNumber,
    required TResult Function(_GetTriviaForRandomNumber value)
        getTriviaForRandomNumber,
  }) {
    return getTriviaForConcreteNumber(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetTriviaForConcreteNumber value)?
        getTriviaForConcreteNumber,
    TResult Function(_GetTriviaForRandomNumber value)? getTriviaForRandomNumber,
  }) {
    return getTriviaForConcreteNumber?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetTriviaForConcreteNumber value)?
        getTriviaForConcreteNumber,
    TResult Function(_GetTriviaForRandomNumber value)? getTriviaForRandomNumber,
    required TResult orElse(),
  }) {
    if (getTriviaForConcreteNumber != null) {
      return getTriviaForConcreteNumber(this);
    }
    return orElse();
  }
}

abstract class _GetTriviaForConcreteNumber implements NumberTriviaEvent {
  const factory _GetTriviaForConcreteNumber(final int numberString) =
      _$_GetTriviaForConcreteNumber;

  int get numberString => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_GetTriviaForConcreteNumberCopyWith<_$_GetTriviaForConcreteNumber>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetTriviaForRandomNumberCopyWith<$Res> {
  factory _$$_GetTriviaForRandomNumberCopyWith(
          _$_GetTriviaForRandomNumber value,
          $Res Function(_$_GetTriviaForRandomNumber) then) =
      __$$_GetTriviaForRandomNumberCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetTriviaForRandomNumberCopyWithImpl<$Res>
    extends _$NumberTriviaEventCopyWithImpl<$Res>
    implements _$$_GetTriviaForRandomNumberCopyWith<$Res> {
  __$$_GetTriviaForRandomNumberCopyWithImpl(_$_GetTriviaForRandomNumber _value,
      $Res Function(_$_GetTriviaForRandomNumber) _then)
      : super(_value, (v) => _then(v as _$_GetTriviaForRandomNumber));

  @override
  _$_GetTriviaForRandomNumber get _value =>
      super._value as _$_GetTriviaForRandomNumber;
}

/// @nodoc

class _$_GetTriviaForRandomNumber implements _GetTriviaForRandomNumber {
  const _$_GetTriviaForRandomNumber();

  @override
  String toString() {
    return 'NumberTriviaEvent.getTriviaForRandomNumber()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetTriviaForRandomNumber);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int numberString) getTriviaForConcreteNumber,
    required TResult Function() getTriviaForRandomNumber,
  }) {
    return getTriviaForRandomNumber();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int numberString)? getTriviaForConcreteNumber,
    TResult Function()? getTriviaForRandomNumber,
  }) {
    return getTriviaForRandomNumber?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int numberString)? getTriviaForConcreteNumber,
    TResult Function()? getTriviaForRandomNumber,
    required TResult orElse(),
  }) {
    if (getTriviaForRandomNumber != null) {
      return getTriviaForRandomNumber();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetTriviaForConcreteNumber value)
        getTriviaForConcreteNumber,
    required TResult Function(_GetTriviaForRandomNumber value)
        getTriviaForRandomNumber,
  }) {
    return getTriviaForRandomNumber(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetTriviaForConcreteNumber value)?
        getTriviaForConcreteNumber,
    TResult Function(_GetTriviaForRandomNumber value)? getTriviaForRandomNumber,
  }) {
    return getTriviaForRandomNumber?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetTriviaForConcreteNumber value)?
        getTriviaForConcreteNumber,
    TResult Function(_GetTriviaForRandomNumber value)? getTriviaForRandomNumber,
    required TResult orElse(),
  }) {
    if (getTriviaForRandomNumber != null) {
      return getTriviaForRandomNumber(this);
    }
    return orElse();
  }
}

abstract class _GetTriviaForRandomNumber implements NumberTriviaEvent {
  const factory _GetTriviaForRandomNumber() = _$_GetTriviaForRandomNumber;
}
