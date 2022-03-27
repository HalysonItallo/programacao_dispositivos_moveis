import 'question.dart';

class QuizBrain {
  late int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question(
      "Some cats are actually to humans.",
      "correct",
    ),
    Question(
      "You can lead a cow down stairs but not up stairs.",
      "error",
    ),
    Question(
      "Approximately one quarter of human bones are in the feet.",
      "maybe",
    ),
  ];

  void nextQuestion() {
    _questionNumber++;
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  String getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    return _questionNumber >= (_questionBank.length - 1);
  }

  void reset() {
    _questionNumber = 0;
  }

  int get length {
    return _questionBank.length;
  }
}
