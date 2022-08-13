import 'package:flutter/material.dart';
import 'package:friends_quiz/app/modules/questions/presenter/controller/question_controller.dart';
import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text("Seu resultado foi: "),
            Consumer<QuestionController>(builder: (context, state, child) {
              return Text("${state.questionsRight}");
            }),
          ],
        ),
      ),
    );
  }
}
