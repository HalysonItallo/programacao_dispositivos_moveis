import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/app/datasource/model/weather.dart';
import 'package:weather_app/app/presentation/pages/weather/weather_bloc/bloc/weather_bloc.dart';
import 'package:weather_app/app/presentation/pages/weather/weather_bloc/bloc/weather_state.dart';
import 'package:weather_app/app/presentation/widgets/widgets.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  WeatherPageState createState() => WeatherPageState();
}

class WeatherPageState extends State<WeatherPage> {
  final WeatherBloc weatherBloc = WeatherBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fake Weather App"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        child: BlocProvider(
          create: (_) => weatherBloc,
          child: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (BuildContext context, WeatherState state) {
              return state.maybeWhen(
                weatherInitial: () => buildInitialInput(),
                weatherLoaded: (Weather weather) => buildColumnWithData(
                  weather,
                ),
                weatherLoading: () => buildLoading(),
                orElse: () => buildInitialInput(),
              );
            },
          ),
        ),
      ),
    );
  }

  Column buildColumnWithData(Weather weather) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          weather.cityName,
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          // Display the temperature with 1 decimal place
          "${weather.temperature.toStringAsFixed(1)} °C",
          style: const TextStyle(fontSize: 80),
        ),
        const CityInputField(),
      ],
    );
  }

  Widget buildInitialInput() {
    return const Center(
      child: CityInputField(),
    );
  }

  Widget buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
