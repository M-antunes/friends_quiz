import 'package:flutter/material.dart';

class CheckWrongAnswerCard extends StatelessWidget {
  final Map<String, String> questionsAnswerdWrong;
  const CheckWrongAnswerCard({
    Key? key,
    required this.questionsAnswerdWrong,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.purple, width: 1.5),
          borderRadius: BorderRadius.circular(10),
          color: Colors.purple[200]),
      // width: MediaQuery.of(context).size.width * 0.8,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Regular',
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    children: [
                  TextSpan(
                    text: questionsAnswerdWrong['question']!,
                  ),
                ])),
            RichText(
                text: TextSpan(
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Regular',
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    children: [
                  const TextSpan(text: "Resposta certa:  "),
                  TextSpan(
                      text: questionsAnswerdWrong['answer']!,
                      style: TextStyle(
                          color: Colors.green[800],
                          fontWeight: FontWeight.w700)),
                ])),
            RichText(
                text: TextSpan(
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Regular',
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    children: [
                  const TextSpan(text: "Sua resposta:  "),
                  TextSpan(
                      text: questionsAnswerdWrong['marked']!,
                      style: TextStyle(
                          color: Colors.red[800], fontWeight: FontWeight.w700)),
                ])),
          ],
        ),
      ),
    );
  }
}
