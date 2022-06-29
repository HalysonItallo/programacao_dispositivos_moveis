// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'weather_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WeatherEvent {
  String get cityName => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String cityName) getWeather,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String cityName)? getWeather,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String cityName)? getWeather,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetWeather value) getWeather,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetWeather value)? getWeather,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetWeather value)? getWeather,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WeatherEventCopyWith<WeatherEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherEventCopyWith<$Res> {
  factory $WeatherEventCopyWith(
          WeatherEvent value, $Res Function(WeatherEvent) then) =
      _$WeatherEventCopyWithImpl<$Res>;
  $Res call({String cityName});
}

/// @nodoc
class _$WeatherEventCopyWithImpl<$Res> implements $WeatherEventCopyWith<$Res> {
  _$WeatherEventCopyWithImpl(this._value, this._then);

  final WeatherEvent _value;
  // ignore: unused_field
  final $Res Function(WeatherEvent) _then;

  @override
  $Res call({
    Object? cityName = freezed,
  }) {
    return _then(_value.copyWith(
      cityName: cityName == freezed
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_GetWeatherCopyWith<$Res>
    implements $WeatherEventCopyWith<$Res> {
  factory _$$_GetWeatherCopyWith(
          _$_GetWeather value, $Res Function(_$_GetWeather) then) =
      __$$_GetWeatherCopyWithImpl<$Res>;
  @override
  $Res call({String cityName});
}

/// @nodoc
class __$$_GetWeatherCopyWithImpl<$Res> extends _$WeatherEventCopyWithImpl<$Res>
    implements _$$_GetWeatherCopyWith<$Res> {
  __$$_GetWeatherCopyWithImpl(
      _$_GetWeather _value, $Res Function(_$_GetWeather) _then)
      : super(_value, (v) => _then(v as _$_GetWeather));

  @override
  _$_GetWeather get _value => super._value as _$_GetWeather;

  @override
  $Res call({
    Object? cityName = freezed,
  }) {
    return _then(_$_GetWeather(
      cityName == freezed
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetWeather implements _GetWeather {
  const _$_GetWeather(this.cityName);

  @override
  final String cityName;

  @override
  String toString() {
    return 'WeatherEvent.getWeather(cityName: $cityName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetWeather &&
            const DeepCollectionEquality().equals(other.cityName, cityName));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(cityName));

  @JsonKey(ignore: true)
  @override
  _$$_GetWeatherCopyWith<_$_GetWeather> get copyWith =>
      __$$_GetWeatherCopyWithImpl<_$_GetWeather>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String cityName) getWeather,
  }) {
    return getWeather(cityName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String cityName)? getWeather,
  }) {
    return getWeather?.call(cityName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String cityName)? getWeather,
    required TResult orElse(),
  }) {
    if (getWeather != null) {
      return getWeather(cityName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetWeather value) getWeather,
  }) {
    return getWeather(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetWeather value)? getWeather,
  }) {
    return getWeather?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetWeather value)? getWeather,
    required TResult orElse(),
  }) {
    if (getWeather != null) {
      return getWeather(this);
    }
    return orElse();
  }
}

abstract class _GetWeather implements WeatherEvent {
  const factory _GetWeather(final String cityName) = _$_GetWeather;

  @override
  String get cityName => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_GetWeatherCopyWith<_$_GetWeather> get copyWith =>
      throw _privateConstructorUsedError;
}
