import 'package:flutter/material.dart';

class NumberTriviaPage extends StatefulWidget {
  const NumberTriviaPage({Key? key}) : super(key: key);

  @override
  State<NumberTriviaPage> createState() => _NumberTriviaPageState();
}

class _NumberTriviaPageState extends State<NumberTriviaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Trivia'),
      ),
    );
  }
}
