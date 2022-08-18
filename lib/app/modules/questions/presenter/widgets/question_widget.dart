import 'dart:async';

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
        height: MediaQuery.of(context).size.height * 0.6,
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
            Consumer<TimerController>(builder: (context, ctrl, child) {
              return ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    // if (state.count == 0) {
                    //   state.answerAutomaticallyWhenTimeIsUp(
                    //       state.questions[questionIndex].answers,
                    //       state.questions[questionIndex]);
                    //   state.advanceStage();
                    // }
                    final individualAnswer =
                        state.questions[questionIndex].answers[index];

                    return InkWell(
                      onTap: ctrl.count == 0
                          ? null
                          : () {
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
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Center(
                              child: Text(
                                individualAnswer.answer,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    height: 1.2,
                                    color: individualAnswer.selected == true
                                        ? Colors.white
                                        : Colors.black),
                              ),
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
