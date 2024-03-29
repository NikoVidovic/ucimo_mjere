import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  double _currentSliderValue = 1;
  bool _postupakShown = false;

  double get currentSliderValue => _currentSliderValue;

  bool get postupakShown => _postupakShown;

  set currentSliderValue(double value) {
    _currentSliderValue = value;
    notifyListeners(); // Notify listeners of state changes
  }

  set postupakShown(bool shown) {
    _postupakShown = shown;
    notifyListeners();
  }
}
