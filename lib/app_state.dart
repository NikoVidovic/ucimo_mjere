import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  double _currentSliderValue = 1;
  bool _postupakShown = false;
  bool _helpButtonShown = false;
  bool _rjesenjeShown = false;
  Color _backgroundColor = Colors.white;
  Color _fontColor = Colors.black;

  double get currentSliderValue => _currentSliderValue;
  bool get postupakShown => _postupakShown;
  bool get helpButtonShown => _helpButtonShown;
  bool get rjesenjeShown => _rjesenjeShown;
  Color get backgroundColor => _backgroundColor;
  Color get fontColor => _fontColor;

  set currentSliderValue(double value) {
    _currentSliderValue = value;
    notifyListeners(); // Notify listeners of state changes
  }

  set postupakShown(bool shown) {
    _postupakShown = shown;
    notifyListeners();
  }

  set helpButtonShown(bool buttonShown) {
    _helpButtonShown = buttonShown;
    notifyListeners();
  }

  set rjesenjeShown(bool newValue) {
    _rjesenjeShown = newValue;
    notifyListeners();
  }

  set backgroundColor(Color newColor) {
    _backgroundColor = newColor;
    notifyListeners();
  }

  set fontColor(Color newFontColor) {
    _fontColor = newFontColor;
    notifyListeners();
  }
}
