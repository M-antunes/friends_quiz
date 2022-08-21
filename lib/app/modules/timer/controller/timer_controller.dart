import 'dart:async';

import 'package:flutter/cupertino.dart';

class TimerController extends ChangeNotifier {
  Timer? timer;
  int count = 0;
  bool begin = true;

  startTimer() {
    count = 12;
    timer = Timer.periodic(const Duration(milliseconds: 1250), (_) {
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

  stopTimer() {
    timer!.cancel();
    begin = true;
    notifyListeners();
  }
}
