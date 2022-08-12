import 'package:flutter/material.dart';
import 'package:friends_quiz/app/modules/challange_choice/presenter/controller/question_controller.dart';

import '../../../../question/presenter/page/question.dart';

class ChoiceButton extends StatelessWidget {
  final String label;
  final int difficultyLabel;
  const ChoiceButton({
    Key? key,
    required this.label,
    required this.difficultyLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        QuestionController().getQuestions(difficultyLabel);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => QuestionPage(difficulty: difficultyLabel)));
      },
      child: Text(
        label,
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}
