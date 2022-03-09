import 'package:flutter/material.dart';

class IAmPoorPage extends StatelessWidget {
  final String title;
  const IAmPoorPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 32),
              child: const Text(
                "I'm poor",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Image.network(
              "https://ichef.bbci.co.uk/news/976/cpsprodpb/2FB3/production/_106211221_poverty.jpg",
            ),
          ],
        ),
      ),
    );
  }
}
