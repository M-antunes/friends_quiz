import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:friends_quiz/app/modules/challange_choice/presenter/controller/question_controller.dart';
import 'package:friends_quiz/app/modules/question/entity/question_model.dart';

class QuestionPage extends StatefulWidget {
  final int difficulty;
  const QuestionPage({
    Key? key,
    required this.difficulty,
  }) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  void initState() {
    var questionCtrl = context.read<QuestionController>();
    questionCtrl.getQuestions(widget.difficulty);
    super.initState();
  }

  List<String> answerList(List<QuestionModel> list) {
    List<String> answers = [
      list[0].correct,
      list[0].wrong1,
      list[0].wrong2,
      list[0].wrong3,
    ];
    answers.shuffle();
    return answers;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<QuestionController>(
          builder: (context, state, child) {
            List<String> list =
                state.questions.isEmpty ? [] : answerList(state.questions);
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                state.questions.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: Column(
                            children: [
                              Text(
                                state.questions[0].title,
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
                                    final individualAnswer = list[index];
                                    return AnswerCard(
                                        quiz: individualAnswer,
                                        index: index + 1);
                                  })
                            ],
                          ),
                        ),
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class AnswerCard extends StatelessWidget {
  final String quiz;
  final int index;
  const AnswerCard({
    Key? key,
    required this.quiz,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Text("$index"),
        ),
        title: Text(quiz),
      ),
    );
  }
}
