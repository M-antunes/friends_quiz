import 'package:flutter/cupertino.dart';
import '../../entity/answer_model.dart';
import '../../entity/question_model.dart';
import '../../entity/quiz_model.dart';
import '../../repository/question_repository.dart';

class QuestionController extends ChangeNotifier {
  QuestionRepository repository = QuestionRepository();

  List<QuizModel> questions = [];

  bool selecetedAnswer = false;

  int questionStage = 0;

  bool allQuestionsAnswerd = false;

  int questionsRight = 0;

  Future<void> getQuestions(int difficulty) async {
    questions.clear();
    final response = await repository.getQuestions(difficulty);
    int numberOfTimes = 10;
    for (var i in response) {
      if (numberOfTimes > 0) {
        QuestionModel model = i;
        List<AnswerModel> answer = [
          AnswerModel(answer: model.correct, selected: false, correct: true),
          AnswerModel(answer: model.wrong1, selected: false, correct: false),
          AnswerModel(answer: model.wrong2, selected: false, correct: false),
          AnswerModel(answer: model.wrong3, selected: false, correct: false),
        ];
        answer.shuffle();
        var quiz = QuizModel(
          question: model.title,
          answers: answer,
          answered: false,
        );
        questions.add(quiz);
      }
      numberOfTimes--;
      if (numberOfTimes < 1) {
        break;
      }
    }
    questions.shuffle();
    notifyListeners();
  }

  advanceStage() {
    questionStage++;
    if (questionStage > 9) {
      questionStage = 9;
    }
    notifyListeners();
  }

  backStage() {
    questionStage--;
    if (questionStage < 0) {
      questionStage = 0;
    }
    notifyListeners();
  }

  updateAnswers() {
    List<bool> answered = [];
    for (var i in questions) {
      if (i.answered == true) {
        answered.add(true);
      } else {
        answered.add(false);
      }
    }
    allQuestionsAnswerd = true;
    for (var i in answered) {
      if (i == false) {
        allQuestionsAnswerd = false;
        break;
      }
    }
    notifyListeners();
  }

  selectQuestion(
      List<AnswerModel> answers, AnswerModel answer, QuizModel question) {
    for (var i in answers) {
      i.selected = false;
    }
    answer.selected = !answer.selected;
    question.answered = true;
    notifyListeners();
    if (questionStage == 9) {
      updateAnswers();
    }
  }

  calculatePoints() {
    questionsRight = 0;
    for (var i in questions) {
      for (var j in i.answers) {
        if (j.selected == true && j.correct == true) {
          questionsRight++;
        }
      }
    }
  }
}
