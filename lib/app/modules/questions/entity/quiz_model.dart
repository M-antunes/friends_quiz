import 'answer_model.dart';

class QuizModel {
  final String question;
  final List<AnswerModel> answers;
  final String correctAnswer;
  bool answered;
  bool notAnswered;
  bool selected;
  QuizModel({
    required this.question,
    required this.answers,
    required this.correctAnswer,
    required this.answered,
    required this.notAnswered,
    required this.selected,
  });
}
