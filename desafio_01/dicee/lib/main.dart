import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Dice"),
          backgroundColor: Colors.red,
        ),
        body: DiceePage(),
      ),
    ),
  );
}

class DiceePage extends StatefulWidget {
  const DiceePage({Key? key}) : super(key: key);

  @override
  State<DiceePage> createState() => _DiceePageState();
}

class _DiceePageState extends State<DiceePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void changeDiceNumber() {
    setState(() {
      leftDiceNumber = Random().nextInt(8) + 1;
      rightDiceNumber = Random().nextInt(8) + 1;
      if (leftDiceNumber == rightDiceNumber) {
        changeDiceNumber();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          dice(
            leftDiceNumber,
            () {
              changeDiceNumber();
            },
          ),
          dice(rightDiceNumber, () {
            changeDiceNumber();
          })
        ],
      ),
    );
  }
}

Widget dice(int valueDice, void Function() changeDiceNumber) {
  return Stack(
    alignment: Alignment.center,
    children: [
      TextButton(
        child: Image.asset("images/dado.png"),
        onPressed: () {
          changeDiceNumber();
        },
      ),
      Text(
        "$valueDice",
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}
