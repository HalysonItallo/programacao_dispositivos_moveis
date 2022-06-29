import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/app/datasource/model/weather.dart';

part 'weather_state.freezed.dart';

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState.weatherInitial() = _WeatherInitial;
  const factory WeatherState.weatherLoading() = _WeatherLoading;
  const factory WeatherState.weatherLoaded(Weather weather) = _WeatherLoaded;
}
