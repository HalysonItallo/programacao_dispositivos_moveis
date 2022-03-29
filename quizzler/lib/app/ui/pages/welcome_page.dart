import 'package:flutter/material.dart';
import 'package:quizzler/app/ui/pages/quiz_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              margin: const EdgeInsets.only(bottom: 10),
              child: Image.network(
                  "https://images-na.ssl-images-amazon.com/images/I/61G1SNlnOPL.png"),
            ),
            const Text(
              "Bem vindo ao Quizzler",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QuizPage(),
                  ),
                );
              },
              child: const Text("Clique aqui para começar o quiz"),
            )
          ],
        ),
      ),
    );
  }
}
