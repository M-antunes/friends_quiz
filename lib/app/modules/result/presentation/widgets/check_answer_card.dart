import 'package:flutter/material.dart';

class CheckWrongAnswerCard extends StatelessWidget {
  final Map<String, String> questionsAnswerdWrong;
  const CheckWrongAnswerCard({
    Key? key,
    required this.questionsAnswerdWrong,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 20,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(
                    style: const TextStyle(color: Colors.black),
                    children: [
                  const TextSpan(text: "Pergunta:  "),
                  TextSpan(
                      text: questionsAnswerdWrong['question']!,
                      style: const TextStyle(fontWeight: FontWeight.w500)),
                ])),
            RichText(
                text: TextSpan(
                    style: const TextStyle(color: Colors.black),
                    children: [
                  const TextSpan(text: "A resposta certa era:  "),
                  TextSpan(
                      text: questionsAnswerdWrong['answer']!,
                      style: TextStyle(
                          color: Colors.green[600],
                          fontWeight: FontWeight.w500)),
                ])),
            RichText(
                text: TextSpan(
                    style: const TextStyle(color: Colors.black),
                    children: [
                  const TextSpan(text: "Você marcou:  "),
                  TextSpan(
                      text: questionsAnswerdWrong['marked']!,
                      style: TextStyle(
                          color: Colors.red[600], fontWeight: FontWeight.w500)),
                ])),
          ],
        ),
      ),
    );
  }
}
