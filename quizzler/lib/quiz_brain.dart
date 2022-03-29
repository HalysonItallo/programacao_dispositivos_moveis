import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:quizzler/question.dart';

class QuizBrain {
  late int questionNumber = 0;

  final SessionManager sessionManager;

  QuizBrain(this.sessionManager) {
    uploadData();
    getData();
  }

  void nextQuestion() {
    questionNumber++;
  }

  dynamic getData() async {
    dynamic data = await sessionManager.get("questionBank");

    return data["questions"].map((e) => Question.fromJson(e)).toList();
  }

  void uploadData() async {
    await sessionManager.set(
      "questionBank",
      """
    {
      "questions": [
        {
          "question": {
            "question": "Some cats are actually to humans.",
            "answer": "correct"
          }
        },
        {
          "question": {
            "question": "You can lead a cow down stairs but not up stairs.",
            "answer": "error"
          }
        },
        {
          "question": {
            "question": "Approximately one quarter of human bones are in the feet.",
            "answer": "maybe"
          }
        }
      ]
    }
    """,
    );
  }

  void reset() {
    questionNumber = 0;
  }
}
