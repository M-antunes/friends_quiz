import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import '../../entity/answer_model.dart';
import '../../entity/question_model.dart';
import '../../entity/quiz_model.dart';
import '../../repository/question_repository.dart';

class QuestionController extends ChangeNotifier {
  QuestionRepository repository = QuestionRepository();

  List<QuizModel> questions = [];

  List<Map<String, String>> questionsWithWrongAnsewers = [];

  bool selecetedAnswer = false;

  int questionStage = 0;

  bool allQuestionsAnswerd = false;

  int questionsRight = 0;

  Random random = Random();

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
          correctAnswer: model.correct,
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

  selectAnswerRandomly(List<AnswerModel> list) {
    var randomAnswer = random.nextInt(list.length);
    List wrongList = list.where((element) => element.correct == false).toList();
    for (var i in wrongList) {
      i.selected = false;
      wrongList[randomAnswer].selected = true;
      notifyListeners();
    }
  }

  selectAnswerLoop(List<AnswerModel> list, QuizModel question) {
    Timer(const Duration(milliseconds: 500), () => selectAnswerRandomly(list));
    Timer(const Duration(milliseconds: 800), () => selectAnswerRandomly(list));
    Timer(const Duration(milliseconds: 1100), () => selectAnswerRandomly(list));
    Timer(const Duration(milliseconds: 1400), () => selectAnswerRandomly(list));
    Timer(const Duration(milliseconds: 1700), () => selectAnswerRandomly(list));
    Timer(const Duration(milliseconds: 2000), () => selectAnswerRandomly(list));
    Timer(const Duration(milliseconds: 2300), () => selectAnswerRandomly(list));
    Timer(const Duration(milliseconds: 2600), () {
      question.answered = true;
      notifyListeners();
    });
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

  getTheResult() {
    allQuestionsAnswerd = true;
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
    var marked = '';
    for (var i in questions) {
      bool thisOneWasRight = false;
      for (var j in i.answers) {
        if (j.selected == true) {
          marked = j.answer;
        }
        if (j.selected == true && j.correct == true) {
          questionsRight++;
          thisOneWasRight = true;
          break;
        }
      }
      if (thisOneWasRight == false) {
        questionsWithWrongAnsewers.add({
          'question': i.question,
          'answer': i.correctAnswer,
          'marked': marked
        });
      }
    }

    notifyListeners();
  }
}
