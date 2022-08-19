import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/utils/useful_functions.dart';
import '../widgets/choice_button.dart';

class ChallangeChoicePage extends StatefulWidget {
  const ChallangeChoicePage({Key? key}) : super(key: key);

  @override
  State<ChallangeChoicePage> createState() => _ChallangeChoicePageState();
}

class _ChallangeChoicePageState extends State<ChallangeChoicePage> {
  bool isPlaying = true;
  @override
  void initState() {
    super.initState();
  }

  AudioPlayer player = AudioPlayer();

  changePlayingStatus() {}

  initiateSong() async {
    await player.play(AssetSource('friends.mp3'));
  }

  var pic = renewBackgroundImage();

  @override
  Widget build(BuildContext context) {
    if (isPlaying) {
      initiateSong();
    }

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
          child: Stack(
            children: [
              Column(
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
                  const ChoiceButton(label: 'Beginner', difficultyLabel: 1),
                  const ChoiceButton(label: 'Adept', difficultyLabel: 2),
                  const ChoiceButton(label: 'Expert', difficultyLabel: 3),
                ],
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isPlaying = !isPlaying;
                    });
                    if (isPlaying) {
                      initiateSong();
                    } else {
                      player.stop();
                    }
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white60,
                    child: Icon(isPlaying ? Icons.music_note : Icons.music_off,
                        color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
