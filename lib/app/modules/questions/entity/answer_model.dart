class AnswerModel {
  final String answer;
  bool selected;
  final bool correct;
  AnswerModel({
    required this.answer,
    this.selected = false,
    required this.correct,
  });
}
