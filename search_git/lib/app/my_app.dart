import 'package:flutter/material.dart';
import 'package:search_git/app/ui/pages/gif/gif_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const GifPage(),
    );
  }
}
