import 'package:flutter/material.dart';
import 'package:friends_quiz/app/modules/result/presentation/widgets/expanded_section.dart';
import 'package:provider/provider.dart';

import 'package:friends_quiz/app/modules/questions/presenter/controller/question_controller.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  void initState() {
    super.initState();
  }

  bool seeErrors = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<QuestionController>(builder: (context, state, child) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                FeedbackChoiceWidget(
                    questionsRight: state.questionsRight,
                    numberOfQuestions: state.questions.length),
                const SizedBox(height: 50),
                if (state.questionsRight == 10) const Text("Você não errou. "),
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
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.questionsWithWrongAnsewers.length,
                        itemBuilder: (context, index) {
                          var questionsAnswerdWrong =
                              state.questionsWithWrongAnsewers[index];
                          return CheckWrongAnswerCard(
                              questionsAnswerdWrong: questionsAnswerdWrong);
                        }),
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}

class CheckWrongAnswerCard extends StatelessWidget {
  final Map<String, String> questionsAnswerdWrong;
  const CheckWrongAnswerCard({
    Key? key,
    required this.questionsAnswerdWrong,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text:
                    TextSpan(style: TextStyle(color: Colors.black), children: [
              TextSpan(text: "Pergunta:  "),
              TextSpan(
                  text: questionsAnswerdWrong['question']!,
                  style: TextStyle(fontWeight: FontWeight.w500)),
            ])),
            RichText(
                text:
                    TextSpan(style: TextStyle(color: Colors.black), children: [
              TextSpan(text: "A resposta certa era:  "),
              TextSpan(
                  text: questionsAnswerdWrong['answer']!,
                  style: TextStyle(
                      color: Colors.green[600], fontWeight: FontWeight.w500)),
            ])),
            RichText(
                text:
                    TextSpan(style: TextStyle(color: Colors.black), children: [
              TextSpan(text: "Você marcou:  "),
              TextSpan(
                  text: questionsAnswerdWrong['marked']!,
                  style: TextStyle(
                      color: Colors.red[600], fontWeight: FontWeight.w500)),
            ])),
          ],
        ),
      ),
    );
  }
}

class FeedbackChoiceWidget extends StatelessWidget {
  final int questionsRight;
  final int numberOfQuestions;
  const FeedbackChoiceWidget({
    Key? key,
    required this.questionsRight,
    required this.numberOfQuestions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (questionsRight > 8)
          FeedbackWidget(
              questions: numberOfQuestions,
              questionsRight: questionsRight,
              label1: "Parabéns!",
              label2: "Você é um verdadeiro fã da série"),
        if (questionsRight < 9 && questionsRight > 5)
          FeedbackWidget(
              questions: numberOfQuestions,
              questionsRight: questionsRight,
              label1: "Muito bom!",
              label2: "Você viu muitos episódios"),
        if (questionsRight < 6 && questionsRight > 3)
          FeedbackWidget(
              questions: numberOfQuestions,
              questionsRight: questionsRight,
              label1: "É... bom...",
              label2: "Você precisa assistir mais a série."),
        if (questionsRight < 4 && questionsRight >= 0)
          FeedbackWidget(
              questions: numberOfQuestions,
              questionsRight: questionsRight,
              label1: "Vish...",
              label2: "Você já viu Friends antes, mano?"),
      ],
    );
  }
}

class FeedbackWidget extends StatelessWidget {
  final String label1;
  final String label2;
  final int questionsRight;
  final int questions;
  const FeedbackWidget({
    Key? key,
    required this.label1,
    required this.label2,
    required this.questionsRight,
    required this.questions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(label1,
              style: TextStyle(
                  color: Colors.amberAccent,
                  fontSize: 18,
                  fontWeight: FontWeight.w500)),
          SizedBox(height: 4),
          Text("Você acertou $questionsRight de $questions"),
          SizedBox(height: 4),
          Text(label2, style: TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
}
