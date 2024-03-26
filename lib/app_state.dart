import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  double _currentSliderValue = 1;

  double get currentSliderValue => _currentSliderValue;

  set currentSliderValue(double value) {
    _currentSliderValue = value;
    notifyListeners(); // Notify listeners of state changes
  }
}
