import 'package:flutter/material.dart';

class FeedbackChoiceWidget extends StatelessWidget {
  final int questionsRight;
  final int numberOfQuestions;
  const FeedbackChoiceWidget({
    Key? key,
    required this.questionsRight,
    required this.numberOfQuestions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (questionsRight > 8)
          FeedbackWidget(
            questions: numberOfQuestions,
            questionsRight: questionsRight,
            label1: "Parabéns!",
          ),
        if (questionsRight < 9 && questionsRight > 5)
          FeedbackWidget(
            questions: numberOfQuestions,
            questionsRight: questionsRight,
            label1: "Muito bom!",
          ),
        if (questionsRight < 6 && questionsRight > 3)
          FeedbackWidget(
            questions: numberOfQuestions,
            questionsRight: questionsRight,
            label1: "É... veja bem...",
          ),
        if (questionsRight < 4 && questionsRight >= 0)
          FeedbackWidget(
            questions: numberOfQuestions,
            questionsRight: questionsRight,
            label1: "Vish...",
          ),
      ],
    );
  }
}

class FeedbackWidget extends StatelessWidget {
  final String label1;
  final int questionsRight;
  final int questions;
  const FeedbackWidget({
    Key? key,
    required this.label1,
    required this.questionsRight,
    required this.questions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(label1.toUpperCase(),
              style: const TextStyle(
                  fontFamily: 'Regular',
                  color: Colors.amberAccent,
                  fontSize: 28,
                  fontWeight: FontWeight.w700)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Você acertou ",
                style: TextStyle(
                  fontFamily: 'Regular',
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 4),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontFamily: 'Regular',
                    fontSize: 28,
                    color: questionsRight > 7
                        ? Colors.green[800]
                        : questionsRight < 8 && questionsRight > 4
                            ? Colors.orange[800]
                            : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: '$questionsRight',
                    ),
                    const TextSpan(
                      text: ' de ',
                      // style: TextStyle(
                      //   fontFamily: 'Regular',
                      //   fontSize: 22,
                      //   color: Colors.white,
                      //   fontWeight: FontWeight.bold,
                      // ),
                    ),
                    TextSpan(
                      text: '$questions',
                    ),
                    //   style: const TextStyle(
                    //       fontFamily: 'Regular',
                    //       fontSize: 28,
                    //       fontWeight: FontWeight.bold,
                    //       color: Colors.white),
                    // ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
            ],
          ),
        ],
      ),
    );
  }
}
