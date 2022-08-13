import 'package:flutter/material.dart';

import '../../../questions/presenter/controller/question_controller.dart';
import '../../../questions/presenter/page/question_hold_page.dart';

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
            builder: (context) =>
                QuestionHoldPage(difficulty: difficultyLabel)));
      },
      child: Text(
        label,
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}
