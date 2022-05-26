import 'package:flutter/material.dart';
import 'package:number_trivia/features/number_trivia/presentation/pages/number_trivia_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number Trivia',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const NumberTriviaPage(),
    );
  }
}
