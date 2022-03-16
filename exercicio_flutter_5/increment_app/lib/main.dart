import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Increment App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Increment App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 30),
              child: IconButton(
                onPressed: _incrementCounter,
                icon: const Icon(Icons.add),
                tooltip: "Increment",
              ),
            ),
            Text(
              '$_counter',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 32,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30),
              child: IconButton(
                onPressed: _decrementCounter,
                icon: const Icon(Icons.remove),
                tooltip: "Decrement",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
