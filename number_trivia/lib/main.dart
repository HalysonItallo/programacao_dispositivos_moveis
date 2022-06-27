import 'package:flutter/material.dart';
import 'package:task_app/injection.dart' as di;
import 'package:task_app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}
