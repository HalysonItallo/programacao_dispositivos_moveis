import 'package:flutter/material.dart';
import 'package:quizzler/app/ui/components/question_button.dart';
import 'package:quizzler/app/ui/components/question_text.dart';
import 'package:quizzler/quiz_brain.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  QuizBrain quizBrain = QuizBrain();
  List<Icon> scoreKeeper = [];

  Color getColorByValueAnswer(bool correctAnswer) {
    if (correctAnswer) {
      return Colors.green;
    }
    return Colors.red;
  }

  void checkAnswer(String userPickedAnswer) {
    String correctAnswer = quizBrain.getCorrectAnswer();
    setState(() {
      if (quizBrain.length != scoreKeeper.length) {
        scoreKeeper.add(
          Icon(
            Icons.circle,
            color: getColorByValueAnswer(
              userPickedAnswer == correctAnswer,
            ),
          ),
        );
      }

      if (quizBrain.isFinished() == false) {
        quizBrain.nextQuestion();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Parabéns por finalizar o quiz'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Quizzler"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text("Pontuação:"),
                const SizedBox(
                  width: 5,
                ),
                Row(
                  children: scoreKeeper,
                ),
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
                      text: quizBrain.getQuestionText(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        QuestionButton(
                          onPressed: () {
                            checkAnswer("correct");
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
                            checkAnswer("maybe");
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
                            checkAnswer("error");
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
        ),
      ),
    );
  }
}
