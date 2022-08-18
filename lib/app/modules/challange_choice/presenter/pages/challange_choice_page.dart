import 'dart:math';

import 'package:flutter/material.dart';

import '../widgets/choice_button.dart';

class ChallangeChoicePage extends StatelessWidget {
  const ChallangeChoicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String renewBackgroundImage() {
      Random random = Random();
      int number = random.nextInt(2);
      String pic = '';
      List<String> images = ['f_1', 'f_2', 'f_3'];
      images.shuffle();
      pic = images[number];
      return pic;
    }

    var pic = renewBackgroundImage();

    Color switchMainTextColor(String photo) {
      Color color = Colors.black;
      switch (photo) {
        case 'f_1':
          color = Colors.black;
          break;
        case 'f_2':
          color = Colors.white70;
          break;
        case 'f_3':
          color = Colors.black;
          break;
        default:
          color = Colors.black;
      }
      return color;
    }

    return SafeArea(
      child: Scaffold(
          body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/$pic.png",
                ),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
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
      )),
    );
  }
}
