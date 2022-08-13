import 'package:flutter/material.dart';

import '../widgets/choice_button.dart';

class ChallangeChoicePage extends StatelessWidget {
  const ChallangeChoicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Escolha a dificuldade",
              style: TextStyle(fontSize: 24),
            ),
            ChoiceButton(label: 'Beginner', difficultyLabel: 1),
            ChoiceButton(label: 'Adept', difficultyLabel: 2),
            ChoiceButton(label: 'Expert', difficultyLabel: 3),
          ],
        ),
      )),
    );
  }
}
