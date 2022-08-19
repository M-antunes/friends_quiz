import 'package:flutter/material.dart';

import '../../../../../shared/utils/useful_functions.dart';
import '../widgets/choice_button.dart';

class ChallangeChoicePage extends StatelessWidget {
  const ChallangeChoicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pic = renewBackgroundImage();

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/images/background/$pic.png",
                  ),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              Text(
                "Friends\nQuiz",
                style: TextStyle(
                    fontSize: 54,
                    fontFamily: 'Friends',
                    color: switchMainTextColor(pic)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ChoiceButton(label: 'Beginner', difficultyLabel: 1),
              ChoiceButton(label: 'Adept', difficultyLabel: 2),
              ChoiceButton(label: 'Expert', difficultyLabel: 3),
            ],
          ),
        ),
      ),
    );
  }
}
