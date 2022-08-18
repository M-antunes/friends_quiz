import 'dart:math';

import 'package:flutter/material.dart';

String renewBackgroundImage() {
  Random random = Random();
  int number = random.nextInt(2);
  List<String> images = ['f_1', 'f_2', 'f_3', 'f_4', 'f_5'];
  String pic = '';
  images.shuffle();
  pic = images[number];
  return pic;
}

String renewResultBackgroundImage() {
  Random random = Random();
  int number = random.nextInt(2);
  List<String> images = ['result_1', 'result', 'result_2']; // 'result_4'];
  String pic = '';
  images.shuffle();
  pic = images[number];
  return pic;
}

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
    case 'f_5':
      color = Colors.black;
      break;
    default:
      color = Colors.white70;
  }
  return color;
}
