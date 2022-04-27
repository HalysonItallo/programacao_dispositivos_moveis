import 'package:flutter/material.dart';
import 'package:search_git/app/injection.dart';
import 'package:search_git/app/my_app.dart';

void main() {
  setupInjection();
  runApp(const MyApp());
}
