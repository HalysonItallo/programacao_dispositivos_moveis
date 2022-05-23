import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final List<FocusNode> _textNode = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  int incrementFocus = 0;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            autofocus: true,
            focusNode: _textNode[0],
            onEditingComplete: () => _textNode[1].requestFocus(),
          ),
          TextField(
            focusNode: _textNode[1],
            onEditingComplete: () => _textNode[2].requestFocus(),
          ),
          TextField(
            focusNode: _textNode[2],
            onEditingComplete: () => _textNode[2].unfocus(),
          ),
        ],
      ),
    );
  }
}
