import 'dart:convert';

Question questionFromJson(String str) => Question.fromJson(json.decode(str));

String questionToJson(Question data) => json.encode(data.toJson());

class Question {
  Question({
    required this.question,
  });

  final QuestionClass question;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        question: QuestionClass.fromJson(json["question"]),
      );

  Map<String, dynamic> toJson() => {
        "question": question.toJson(),
      };
}

class QuestionClass {
  QuestionClass({
    required this.question,
    required this.answer,
  });

  final String question;
  final String answer;

  factory QuestionClass.fromJson(Map<String, dynamic> json) => QuestionClass(
        question: json["question"],
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "question": question,
        "answer": answer,
      };
}
