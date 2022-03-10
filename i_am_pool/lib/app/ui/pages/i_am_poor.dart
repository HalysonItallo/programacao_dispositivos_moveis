import 'package:flutter/material.dart';

class IAmPoorPage extends StatelessWidget {
  final String title;
  const IAmPoorPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            title,
          ),
        ),
        backgroundColor: Colors.green.shade900,
      ),
      body: Container(
        color: Colors.lightBlueAccent,
        child: Center(
            child: Image.asset(
          "assets/images/carvao.png",
          fit: BoxFit.cover,
        )),
      ),
    );
  }
}
