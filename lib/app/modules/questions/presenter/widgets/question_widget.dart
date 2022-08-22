import 'package:flutter/material.dart';
import 'package:friends_quiz/app/modules/timer/controller/timer_controller.dart';
import 'package:provider/provider.dart';

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
        height: MediaQuery.of(context).size.height * 0.65,
        child: Column(
          children: [
            Text(
              state.questions[questionIndex].question,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 22,
                  fontFamily: 'Fonts',
                  fontWeight: FontWeight.w500,
                  height: 1.2,
                  color: Colors.white),
            ),
            const SizedBox(height: 25),
            if (state.questions[questionIndex].photo != '')
              Image.network(state.questions[questionIndex].photo!, height: 150),
            const SizedBox(height: 25),
            Consumer<TimerController>(builder: (context, ctrl, child) {
              return ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final individualAnswer =
                        state.questions[questionIndex].answers[index];

                    return InkWell(
                      onTap: ctrl.count == 0
                          ? null
                          : () {
                              state.showAnswerWasChosen(
                                  state.questions[questionIndex]);
                              state.selectQuestion(
                                state.questions[questionIndex].answers,
                                individualAnswer,
                                state.questions[questionIndex],
                              );
                            },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                individualAnswer.selected == true ? 4 : 0,
                            vertical:
                                individualAnswer.selected == true ? 2 : 0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          color: individualAnswer.selected == true
                              ? Colors.deepPurpleAccent
                              : Colors.grey.shade300,
                          elevation: individualAnswer.selected == true ? 0 : 8,
                          child: ListTile(
                            contentPadding: const EdgeInsets.only(left: 5),
                            leading: CircleAvatar(
                              radius: 22,
                              backgroundColor: Colors.purple[200],
                              child: Text(
                                getOptionLetter(index),
                                style: TextStyle(
                                    fontFamily: 'F_fonts',
                                    fontSize: 22,
                                    color: Colors.grey[900],
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            title: Text(
                              individualAnswer.answer,
                              strutStyle: const StrutStyle(height: 1.4),
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Regular',
                                  fontSize: 17,
                                  color: individualAnswer.selected == true
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            })
          ],
        ),
      ),
    );
  }
}

String getOptionLetter(int index) {
  return index == 0
      ? 'A'
      : index == 1
          ? 'B'
          : index == 3
              ? 'C'
              : 'D';
}
