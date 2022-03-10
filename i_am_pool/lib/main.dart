import 'package:flutter/material.dart';
import 'package:i_am_poor/app/ui/pages/i_am_poor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter I am poor',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const IAmPoorPage(title: 'I Am Poor'),
    );
  }
}
