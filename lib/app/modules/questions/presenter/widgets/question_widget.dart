import 'package:flutter/material.dart';

import '../controller/question_controller.dart';

class QuestionWidget extends StatelessWidget {
  final QuestionController state;
  final int questionIndex;
  final int answerIndex;
  const QuestionWidget({
    Key? key,
    required this.state,
    required this.questionIndex,
    required this.answerIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.6,
        child: Column(
          children: [
            Text(
              state.questions[questionIndex].question,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            ListView.builder(
                itemCount: 4,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final individualAnswer =
                      state.questions[questionIndex].answers[index];
                  return InkWell(
                    onTap: () {
                      state.selectQuestion(
                        state.questions[questionIndex].answers,
                        individualAnswer,
                        state.questions[questionIndex],
                      );
                    },
                    child: Card(
                      color: individualAnswer.selected == true
                          ? Colors.deepPurpleAccent
                          : null,
                      elevation: individualAnswer.selected == true ? 0 : 8,
                      child: ListTile(
                        title: Text(
                          individualAnswer.answer,
                          style: TextStyle(
                              color: individualAnswer.selected == true
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
