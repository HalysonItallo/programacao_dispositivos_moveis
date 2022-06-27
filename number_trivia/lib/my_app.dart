import 'package:flutter/material.dart';
import 'package:task_app/features/task_app/presentation/pages/control_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ControlPage(),
    );
  }
}
