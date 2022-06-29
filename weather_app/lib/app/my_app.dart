import 'package:flutter/material.dart';
import 'package:weather_app/app/presentation/pages/weather/weather_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WeatherPage(),
    );
  }
}
