import 'answer_model.dart';

class QuizModel {
  final String question;
  final List<AnswerModel> answers;
  final String correctAnswer;
  final String? photo;
  bool answered;
  bool notAnswered;
  bool selected;
  QuizModel({
    required this.question,
    required this.answers,
    required this.correctAnswer,
    this.photo,
    required this.answered,
    required this.notAnswered,
    required this.selected,
  });
}
