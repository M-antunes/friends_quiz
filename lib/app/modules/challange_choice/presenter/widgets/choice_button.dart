import 'package:flutter/material.dart';
import 'package:friends_quiz/app/modules/timer/controller/timer_controller.dart';
import 'package:provider/provider.dart';

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
    var timer = context.read<TimerController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: InkWell(
        onTap: () {
          QuestionController().getQuestions(difficultyLabel);
          timer.stopTimer();
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  QuestionHoldPage(difficulty: difficultyLabel)));
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white70, borderRadius: BorderRadius.circular(20)),
          width: double.infinity,
          height: 45,
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                  fontSize: 22,
                  fontFamily: 'Regular',
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
