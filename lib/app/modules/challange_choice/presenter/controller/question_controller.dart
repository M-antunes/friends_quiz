import 'package:flutter/cupertino.dart';
import 'package:friends_quiz/app/modules/question/entity/question_model.dart';

import '../../../question/repository/question_repository.dart';

class QuestionController extends ChangeNotifier {
  QuestionRepository repository = QuestionRepository();

  List<QuestionModel> questions = [];

  Future<void> getQuestions(int difficulty) async {
    questions.clear();
    final response = await repository.getQuestions(difficulty);
    for (var i in response) {
      QuestionModel quiz = i;
      questions.add(quiz);
    }
    questions.shuffle();
    notifyListeners();
  }
}
