import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  double _currentSliderValue = 1;
  bool _postupakShown = false;
  bool _helpButtonShown = false;
  bool _rjesenjeShown = false;
  Color _backgroundColor = Colors.white;
  Color _fontColor = Colors.black;
  double _fontSize = 1;
  bool _tocnoVisible = false;
  bool _netocno = false;

  double get currentSliderValue => _currentSliderValue;
  bool get postupakShown => _postupakShown;
  bool get helpButtonShown => _helpButtonShown;
  bool get rjesenjeShown => _rjesenjeShown;
  Color get backgroundColor => _backgroundColor;
  Color get fontColor => _fontColor;
  double get fontSize => _fontSize;
  bool get tocnoVisible => _tocnoVisible;
  bool get netocno => _netocno;

  set currentSliderValue(double value) {
    _currentSliderValue = value;
    notifyListeners();
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

  set fontSize(double value) {
    _fontSize = value;
    notifyListeners();
  }

  set tocnoVisible(bool newValue) {
    _tocnoVisible = newValue;
    notifyListeners();
  }

  set netocno(bool newValue) {
    _netocno = newValue;
    notifyListeners();
  }
}
