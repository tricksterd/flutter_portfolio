import 'package:flutter/material.dart';

class StopwatchProvider extends ChangeNotifier {
  late Stopwatch _stopwatch;

  StopwatchProvider() {
    _stopwatch = Stopwatch();
  }

  void runStopwatch() {
    _stopwatch.start();
    notifyListeners();
  }

  get stopwatch => _stopwatch.elapsedMilliseconds.toString();

  void stopStopwatch() {
    _stopwatch.stop();
    notifyListeners();
  }
}
