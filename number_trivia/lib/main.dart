import 'package:flutter/material.dart';
import 'package:number_trivia/injection.dart';
import 'package:number_trivia/my_app.dart';

void main() {
  setupInjection();
  runApp(const MyApp());
}
