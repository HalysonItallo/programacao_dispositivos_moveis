import 'package:flutter/material.dart';

class HelloWorld extends StatelessWidget {
  final String title;
  const HelloWorld({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const Center(
        child: Text(
          "Hello World",
          style: TextStyle(fontSize: 32,),
        ),
      ),
    );
  }
}
