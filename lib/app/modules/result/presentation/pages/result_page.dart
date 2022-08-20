import 'package:flutter/material.dart';
import 'package:friends_quiz/app/modules/result/presentation/widgets/result_comment.dart';
import 'package:provider/provider.dart';

import 'package:friends_quiz/app/modules/questions/presenter/controller/question_controller.dart';
import 'package:friends_quiz/app/modules/result/presentation/widgets/expanded_section.dart';

import '../../../../../shared/utils/useful_functions.dart';
import '../widgets/check_answer_card.dart';
import '../widgets/feedback_messages.dart';
import '../widgets/list_of_answers.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  void initState() {
    super.initState();
  }

  bool seeErrors = false;
  var pic = renewResultBackgroundImage();
  var gif = getGif();

  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<QuestionController>(builder: (context, state, child) {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background/$pic.png'),
                  fit: BoxFit.fill),
            ),
            child: Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                  child: Column(
                    children: [
                      FeedbackChoiceWidget(
                          questionsRight: state.questionsRight,
                          numberOfQuestions: state.questions.length),
                      const SizedBox(height: 5),
                      Image.asset(
                        state.questionsRight > 7
                            ? "assets/images/answers/excellent/$gif.gif"
                            : state.questionsRight < 8 &&
                                    state.questionsRight > 5
                                ? "assets/images/answers/good/$gif.gif"
                                : state.questionsRight < 6 &&
                                        state.questionsRight > 3
                                    ? "assets/images/answers/average/$gif.gif"
                                    : "assets/images/answers/bad/$gif.gif",
                        height: 200,
                      ),
                      const SizedBox(height: 10),
                      ResultCommentChoices(
                          questionsRight: state.questionsRight),
                      const SizedBox(height: 10),
                      if (state.questionsRight < 10)
                        Visibility(
                          visible: !seeErrors,
                          child: InkWell(
                            onTap: () {
                              setState(() => seeErrors = !seeErrors);
                            },
                            child: Container(
                              width: double.infinity,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.deepPurpleAccent,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  state.questionsRight < 9
                                      ? 'Ver seus erros'
                                      : "Ver seu único erro",
                                  style: TextStyle(
                                    fontFamily: 'Regular',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      Visibility(
                        visible: seeErrors,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 130,
                            width: double.infinity,
                            child: PageView.builder(
                                controller:
                                    PageController(viewportFraction: 0.9),
                                padEnds: true,
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                itemCount:
                                    state.questionsWithWrongAnsewers.length,
                                itemBuilder: (context, index) {
                                  var questionsAnswerdWrong =
                                      state.questionsWithWrongAnsewers[index];
                                  return CheckWrongAnswerCard(
                                      questionsAnswerdWrong:
                                          questionsAnswerdWrong);
                                }),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
