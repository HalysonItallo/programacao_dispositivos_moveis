import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:weather_app/app/datasource/model/weather.dart';
import 'package:weather_app/app/presentation/pages/weather/weather_bloc/bloc/weather_event.dart';
import 'package:weather_app/app/presentation/pages/weather/weather_bloc/bloc/weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(const WeatherState.weatherInitial()) {
    on<WeatherEvent>(_onWeatherEvent);
  }

  Future<void> _onWeatherEvent(WeatherEvent event, Emitter<WeatherState> emit) {
    return event.when(
      getWeather: ((cityName) async {
        emit(const WeatherState.weatherLoading());
        final weather = await _fetchWeatherFromFakeApi(event.cityName);
        emit(WeatherState.weatherLoaded(weather));
      }),
    );
  }

  Future<Weather> _fetchWeatherFromFakeApi(String cityName) {
    return Future.delayed(
      const Duration(seconds: 1),
      () {
        return Weather(
          cityName: cityName,
          // Temperature between 20 and 35.99
          temperature: 20 + Random().nextInt(15) + Random().nextDouble(),
        );
      },
    );
  }
}
