import 'package:flutter/material.dart';

class ResultCommentChoices extends StatelessWidget {
  final int questionsRight;
  const ResultCommentChoices({
    Key? key,
    required this.questionsRight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (questionsRight > 12)
          const ResultComment(label: "Você é um verdadeiro fã da série"),
        if (questionsRight < 13 && questionsRight > 8)
          const ResultComment(label: "Você já viu muitos episódios, né?"),
        if (questionsRight < 9 && questionsRight > 4)
          const ResultComment(label: "Você precisa assistir mais a série."),
        if (questionsRight < 5)
          const ResultComment(label: "Você já viu Friends antes, mano?"),
      ],
    );
  }
}

class ResultComment extends StatelessWidget {
  const ResultComment({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        fontFamily: 'Regular',
        fontSize: 22,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
