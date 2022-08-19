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
  var excellentGif = getExcellentGif();
  var goodGif = getGoodGif();
  var averageGif = getAverageGif();
  var badGif = getBadGif();

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
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.purple[200],
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      FeedbackChoiceWidget(
                          questionsRight: state.questionsRight,
                          numberOfQuestions: state.questions.length),
                      const SizedBox(height: 5),
                      Image.asset(
                        state.questionsRight > 7
                            ? "assets/images/answers/excellent/$excellentGif.gif"
                            : state.questionsRight < 8 &&
                                    state.questionsRight > 5
                                ? "assets/images/answers/good/$goodGif.gif"
                                : state.questionsRight < 6 &&
                                        state.questionsRight > 3
                                    ? "assets/images/answers/average/$averageGif.gif"
                                    : "assets/images/answers/bad/$badGif.gif",
                        height: 200,
                      ),
                      const SizedBox(height: 10),
                      ResultCommentChoices(
                          questionsRight: state.questionsRight),
                      if (state.questionsRight < 10)
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                seeErrors = !seeErrors;
                              });
                            },
                            child: Text(state.questionsRight == 9
                                ? "Ver a que você errou"
                                : "Ver as que você errou")),
                      ExpandedSection(
                        expand: seeErrors,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 130,
                            width: double.infinity,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
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
