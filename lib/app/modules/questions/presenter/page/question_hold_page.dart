import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:friends_quiz/app/modules/timer/controller/timer_controller.dart';

import '../../../result/presentation/pages/result_page.dart';
import '../controller/question_controller.dart';
import '../widgets/finish_quiz_button.dart';
import '../widgets/question_widget.dart';

class QuestionHoldPage extends StatefulWidget {
  final int difficulty;
  const QuestionHoldPage({
    Key? key,
    required this.difficulty,
  }) : super(key: key);

  @override
  State<QuestionHoldPage> createState() => _QuestionHoldPageState();
}

class _QuestionHoldPageState extends State<QuestionHoldPage> {
  @override
  void initState() {
    var questionCtrl = context.read<QuestionController>();
    questionCtrl.getQuestions(widget.difficulty);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/backg.png'),
                  fit: BoxFit.fill)),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.timer,
                      size: 40,
                      color: Colors.white,
                    ),
                    Consumer<TimerController>(builder: (context, ctrl, child) {
                      if (ctrl.begin) {
                        ctrl.startTimer();
                        ctrl.stopNewCounters();
                      }
                      return Text(
                        '${ctrl.count}s',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontFamily: 'Friends'),
                      );
                    })
                  ],
                ),
                Consumer<QuestionController>(
                  builder: (context, state, child) {
                    return Column(
                      children: [
                        state.questions.isEmpty
                            ? const Center(child: CircularProgressIndicator())
                            : Column(
                                children: [
                                  if (state.questionStage == 0)
                                    QuestionWidget(
                                      state: state,
                                      answerIndex: 0,
                                      questionIndex: 0,
                                    ),
                                  if (state.questionStage == 1)
                                    QuestionWidget(
                                      state: state,
                                      answerIndex: 1,
                                      questionIndex: 1,
                                    ),
                                  if (state.questionStage == 2)
                                    QuestionWidget(
                                      state: state,
                                      answerIndex: 2,
                                      questionIndex: 2,
                                    ),
                                  if (state.questionStage == 3)
                                    QuestionWidget(
                                      state: state,
                                      answerIndex: 3,
                                      questionIndex: 3,
                                    ),
                                  if (state.questionStage == 4)
                                    QuestionWidget(
                                      state: state,
                                      answerIndex: 4,
                                      questionIndex: 4,
                                    ),
                                  if (state.questionStage == 5)
                                    QuestionWidget(
                                      state: state,
                                      answerIndex: 5,
                                      questionIndex: 5,
                                    ),
                                  if (state.questionStage == 6)
                                    QuestionWidget(
                                      state: state,
                                      answerIndex: 6,
                                      questionIndex: 6,
                                    ),
                                  if (state.questionStage == 7)
                                    QuestionWidget(
                                      state: state,
                                      answerIndex: 7,
                                      questionIndex: 7,
                                    ),
                                  if (state.questionStage == 8)
                                    QuestionWidget(
                                      state: state,
                                      answerIndex: 8,
                                      questionIndex: 8,
                                    ),
                                  if (state.questionStage == 9)
                                    QuestionWidget(
                                      state: state,
                                      answerIndex: 9,
                                      questionIndex: 9,
                                    ),
                                  if (state.questionStage >= 0 &&
                                      !state.allQuestionsAnswerd)
                                    Consumer<TimerController>(
                                        builder: (context, ctrl, child) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          if (ctrl.count == 0)
                                            ElevatedButton(
                                                onPressed: () {
                                                  state.selectAnswerLoop(
                                                      state
                                                          .questions[state
                                                              .questionStage]
                                                          .answers,
                                                      state.questions[
                                                          state.questionStage]);
                                                  // state
                                                  // .updateShowContinueButton();
                                                  Timer(Duration(seconds: 4),
                                                      () {
                                                    state.updateAnswers();
                                                    state.advanceStage();
                                                    ctrl.resetClock();
                                                  });
                                                },
                                                child: Text("Tempo esgotado")),
                                          if (ctrl.count > 0)
                                            ElevatedButton(
                                                onPressed: () {
                                                  state.updateAnswers();
                                                  state.advanceStage();
                                                  ctrl.resetClock();
                                                  // if (ctrl.count == 0) {
                                                  //   state
                                                  //       .updateShowContinueButton();
                                                  // }
                                                },
                                                child: Text('Próxima')),
                                        ],
                                      );
                                    }),
                                  const SizedBox(height: 20),
                                  if (state.allQuestionsAnswerd)
                                    FinishQuizButton(onTap: () {
                                      state.calculatePoints();
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const ResultPage()));
                                    }),
                                ],
                              ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const ActionButton({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: Colors.purpleAccent,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.purple),
          width: MediaQuery.of(context).size.width * 0.2,
          height: 35,
          child: Center(child: Text(label)),
        ),
      ),
    );
  }
}
