import 'package:flutter/material.dart';
import 'package:number_trivia/injection.dart' as di;
import 'package:number_trivia/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}
