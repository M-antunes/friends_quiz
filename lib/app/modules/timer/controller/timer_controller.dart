import 'dart:async';

import 'package:flutter/cupertino.dart';

class TimerController extends ChangeNotifier {
  Timer? timer;
  int count = 12;
  bool begin = true;

  startTimer() {
    timer = Timer.periodic(const Duration(milliseconds: 1150), (_) {
      if (count <= 0) {
        count = 0;
      } else {
        count--;
        notifyListeners();
      }
    });
  }

  stopNewCounters() {
    begin = false;
    notifyListeners();
  }

  resetClock() {
    count = 12;
    notifyListeners();
  }
}
