import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        body: Consumer<QuestionController>(
          builder: (context, state, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  if (state.questionStage > 0)
                                    ElevatedButton(
                                        onPressed: () {
                                          state.backStage();
                                        },
                                        child: const Text('Anterior')),
                                  if (state.questionStage >= 0 &&
                                      state.questionStage < 9)
                                    ElevatedButton(
                                        onPressed: () {
                                          state.advanceStage();
                                          state.updateAnswers();
                                        },
                                        child: const Text('Próxima')),
                                ],
                              ),
                              const SizedBox(height: 20),
                              if (state.allQuestionsAnswerd)
                                FinishQuizButton(onTap: () {
                                  state.calculatePoints();
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const ResultPage()));
                                })
                            ],
                          ),
                        ],
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
