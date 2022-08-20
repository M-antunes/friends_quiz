import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:friends_quiz/app/modules/timer/controller/timer_controller.dart';

import '../../../result/presentation/pages/result_page.dart';
import '../controller/question_controller.dart';
import '../widgets/call_snackbar_message.dart';
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

class _QuestionHoldPageState extends State<QuestionHoldPage>
    with TickerProviderStateMixin {
  @override
  void initState() {
    var questionCtrl = context.read<QuestionController>();
    questionCtrl.getQuestions(widget.difficulty);
    super.initState();
  }

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat(reverse: true);
  late final _animation = Tween(begin: 1.0, end: 1.1).animate(_controller);

  Color changeTimerColor(int timer) {
    Color color;
    if (timer < 13 && timer > 7) {
      color = Colors.green;
    } else if (timer < 8 && timer > 2) {
      color = Colors.orange;
    } else {
      color = Colors.red;
    }
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background/backg.png'),
                  fit: BoxFit.fill)),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Consumer<TimerController>(builder: (context, ctrl, child) {
                  if (ctrl.begin) {
                    ctrl.startTimer();
                    ctrl.stopNewCounters();
                  }
                  return Row(
                    children: [
                      AnimatedBuilder(
                        animation: _animation,
                        child: Icon(
                          Icons.timer_outlined,
                          size: 40,
                          color: changeTimerColor(ctrl.count),
                        ),
                        builder: (context, child) {
                          return Transform.scale(
                              scale: _animation.value, child: child);
                        },
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          '${ctrl.count}s',
                          style: TextStyle(
                              color: changeTimerColor(ctrl.count),
                              fontSize: 25,
                              fontFamily: 'Friends'),
                        ),
                      ),
                      Consumer<QuestionController>(
                          builder: (context, state, child) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            '${state.questionStage + 1} / 10',
                            style: const TextStyle(
                              fontFamily: 'Regular',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        );
                      })
                    ],
                  );
                }),
                Consumer<QuestionController>(
                  builder: (context, state, child) {
                    return Column(
                      children: [
                        state.questions.isEmpty
                            ? const Center(child: CircularProgressIndicator())
                            : Column(
                                children: [
                                  ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: 10,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            if (state.questionStage == index)
                                              QuestionWidget(
                                                state: state,
                                                answerIndex: index,
                                                questionIndex: index,
                                              ),
                                          ],
                                        );
                                      }),
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
                                                  state.makeQuestionNotAnswered(
                                                      state.questions[
                                                          state.questionStage]);
                                                  state.updateAnswers();
                                                  state.advanceStage();
                                                  ctrl.resetClock();
                                                },
                                                child: const Text(
                                                    "Tempo esgotado")),
                                          if (ctrl.count > 0)
                                            ElevatedButton(
                                                onPressed: () {
                                                  if (!state
                                                      .questions[
                                                          state.questionStage]
                                                      .selected) {
                                                    callMessageSnackbar(
                                                      context,
                                                      "Você deve escolher uma resposta antes de prosseguir",
                                                      Colors.purple[200],
                                                      2500,
                                                    );
                                                  } else {
                                                    state.updateAnswers();
                                                    state.advanceStage();
                                                    ctrl.resetClock();
                                                  }
                                                },
                                                child: const Text('Próxima')),
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
