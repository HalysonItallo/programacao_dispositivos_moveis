import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/app/presentation/pages/weather/weather_bloc/bloc/weather_bloc.dart';
import 'package:weather_app/app/presentation/pages/weather/weather_bloc/bloc/weather_event.dart';

class CityInputField extends StatefulWidget {
  const CityInputField({Key? key}) : super(key: key);

  @override
  CityInputFieldState createState() => CityInputFieldState();
}

class CityInputFieldState extends State<CityInputField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        onSubmitted: submitCityName,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: "Enter a city",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          suffixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }

  void submitCityName(String cityName) {
    BlocProvider.of<WeatherBloc>(context).add(
      WeatherEvent.getWeather(cityName),
    );
  }
}
