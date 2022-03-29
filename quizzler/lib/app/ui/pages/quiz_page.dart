import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:quizzler/app/ui/components/question_button.dart';
import 'package:quizzler/app/ui/components/question_text.dart';

import 'package:quizzler/quiz_brain.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({
    Key? key,
  }) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  QuizBrain quizBrain = QuizBrain(SessionManager());
  List<bool> scoreKeeper = [];

  void checkAnswer(String userPickedAnswer, dynamic data) {
    String correctAnswer = data[quizBrain.questionNumber].question.answer;
    setState(() {
      if (data!.length != scoreKeeper.length) {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(true);
        }
      }

      if (quizBrain.questionNumber < data!.length - 1) {
        quizBrain.nextQuestion();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Parabéns por finalizar o quiz, sua pontuação foi: ${getPontuation(data!.length)} %",
            ),
          ),
        );
        Future.delayed(
          const Duration(milliseconds: 3000),
          () {
            quizBrain.reset();
            scoreKeeper = [];

            Navigator.pop(context);
          },
        );
      }
    });
  }

  String getPontuation(lenght) {
    double percentage = (scoreKeeper.length / lenght) * 100;
    return percentage.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Quizzler"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: quizBrain.getData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:

              case ConnectionState.active:

              case ConnectionState.waiting:
                return const SizedBox(
                  height: 400,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              case ConnectionState.done:
                var data = snapshot.data;
                return Column(
                  children: [
                    Row(
                      children: [
                        const Text("Pontuação:"),
                        const SizedBox(
                          width: 5,
                        ),
                        Text("${getPontuation(data!.length)} %"),
                      ],
                    ),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(top: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            QuestionText(
                              text:
                                  "${data[quizBrain.questionNumber].question.question}",
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                QuestionButton(
                                  onPressed: () {
                                    checkAnswer("correct", data);
                                  },
                                  icon: Icons.check,
                                  color: Colors.green,
                                  tooltip: "correto",
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                QuestionButton(
                                  onPressed: () {
                                    checkAnswer("maybe", data);
                                  },
                                  icon: Icons.question_mark,
                                  color: Colors.yellow.shade700,
                                  tooltip: "talvez",
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                QuestionButton(
                                  onPressed: () {
                                    checkAnswer("error", data);
                                  },
                                  icon: Icons.close,
                                  color: Colors.red,
                                  tooltip: "incorreto",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
            }
          },
        ),
      ),
    );
  }
}
