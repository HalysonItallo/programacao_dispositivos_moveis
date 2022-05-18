import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<bool> isSelected = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Toggle Aplication"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ToggleButtons(
              isSelected: isSelected,
              onPressed: (int index) {
                setState(() {
                  isSelected[index] = !isSelected[index];
                });
              },
              children: const [
                Icon(Icons.format_italic),
                Icon(Icons.format_bold),
                Icon(Icons.format_underline),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Test",
              style: TextStyle(
                fontStyle: isSelected[0] ? FontStyle.italic : null,
                fontWeight: isSelected[1] ? FontWeight.bold : null,
                decoration: isSelected[2] ? TextDecoration.underline : null,
              ),
            )
          ],
        ),
      ),
    );
  }
}
