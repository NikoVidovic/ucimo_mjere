import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  bool _postupakShownDuljina = false;
  bool _rjesenjeShownDuljina = false;
  bool _postupakShownInformacije = false;
  bool _rjesenjeShownInformacije = false;
  bool _postupakShownMasa = false;
  bool _rjesenjeShownMasa = false;
  bool _postupakShownObujam = false;
  bool _rjesenjeShownObujam = false;
  bool _postupakShownPovrsina = false;
  bool _rjesenjeShownPovrsina = false;
  bool _postupakShownTemperatura = false;
  bool _rjesenjeShownTemperatura = false;
  bool _postupakShownVrijeme = false;
  bool _rjesenjeShownVrijeme = false;

  bool _helpButtonShown = false;
  Color _backgroundColor = Colors.white;
  Color _fontColor = Colors.black;
  double _fontSize = 1;
  bool _tocnoVisible = false;
  bool _netocno = false;
  bool _decimalni = true;
  final List<int> _selfTask = [];

  double _currentSliderValueDuljina = 1;
  double _currentSliderValueInformacije = 1;
  double _currentSliderValueMasa = 1;
  double _currentSliderValueObujam = 1;
  double _currentSliderValuePovrsina = 1;
  double _currentSliderValueTemperatura = 1;
  double _currentSliderValueVrijeme = 1;

  bool get postupakShownDuljina => _postupakShownDuljina;
  bool get rjesenjeShownDuljina => _rjesenjeShownDuljina;
  bool get postupakShownInformacije => _postupakShownInformacije;
  bool get rjesenjeShownInformacije => _rjesenjeShownInformacije;
  bool get postupakShownMasa => _postupakShownMasa;
  bool get rjesenjeShownMasa => _rjesenjeShownMasa;
  bool get postupakShownObujam => _postupakShownObujam;
  bool get rjesenjeShownObujam => _rjesenjeShownObujam;
  bool get postupakShownPovrsina => _postupakShownPovrsina;
  bool get rjesenjeShownPovrsina => _rjesenjeShownPovrsina;
  bool get postupakShownTemperatura => _postupakShownTemperatura;
  bool get rjesenjeShownTemperatura => _rjesenjeShownTemperatura;
  bool get postupakShownVrijeme => _postupakShownVrijeme;
  bool get rjesenjeShownVrijeme => _rjesenjeShownVrijeme;

  bool get helpButtonShown => _helpButtonShown;
  Color get backgroundColor => _backgroundColor;
  Color get fontColor => _fontColor;
  double get fontSize => _fontSize;
  bool get tocnoVisible => _tocnoVisible;
  bool get netocno => _netocno;
  bool get decimalni => _decimalni;
  List<int> get selfTask => _selfTask;

  double get currentSliderValueDuljina => _currentSliderValueDuljina;
  double get currentSliderValueInformacije => _currentSliderValueInformacije;
  double get currentSliderValueMasa => _currentSliderValueMasa;
  double get currentSliderValueObujam => _currentSliderValueObujam;
  double get currentSliderValuePovrsina => _currentSliderValuePovrsina;
  double get currentSliderValueTemperatura => _currentSliderValueTemperatura;
  double get currentSliderValueVrijeme => _currentSliderValueVrijeme;

  void addItem(int item) {
    _selfTask.add(item);
    notifyListeners();
  }

  void removeItemAt(int index) {
    _selfTask.removeAt(index);
    notifyListeners();
  }

  void removeItem(int item) {
    _selfTask.remove(item);
    notifyListeners();
  }

  set postupakShownDuljina(bool shown) {
    _postupakShownDuljina = shown;
    notifyListeners();
  }

  set rjesenjeShownDuljina(bool newValue) {
    _rjesenjeShownDuljina = newValue;
    notifyListeners();
  }

  set postupakShownInformacije(bool shown) {
    _postupakShownInformacije = shown;
    notifyListeners();
  }

  set rjesenjeShownInformacije(bool newValue) {
    _rjesenjeShownInformacije = newValue;
    notifyListeners();
  }

  set postupakShownMasa(bool shown) {
    _postupakShownMasa = shown;
    notifyListeners();
  }

  set rjesenjeShownMasa(bool newValue) {
    _rjesenjeShownMasa = newValue;
    notifyListeners();
  }

  set postupakShownObujam(bool shown) {
    _postupakShownObujam = shown;
    notifyListeners();
  }

  set rjesenjeShownObujam(bool newValue) {
    _rjesenjeShownObujam = newValue;
    notifyListeners();
  }

  set postupakShownPovrsina(bool shown) {
    _postupakShownPovrsina = shown;
    notifyListeners();
  }

  set rjesenjeShownPovrsina(bool newValue) {
    _rjesenjeShownPovrsina = newValue;
    notifyListeners();
  }

  set postupakShownTemperatura(bool shown) {
    _postupakShownTemperatura = shown;
    notifyListeners();
  }

  set rjesenjeShownTemperatura(bool newValue) {
    _rjesenjeShownTemperatura = newValue;
    notifyListeners();
  }

  set postupakShownVrijeme(bool shown) {
    _postupakShownVrijeme = shown;
    notifyListeners();
  }

  set rjesenjeShownVrijeme(bool newValue) {
    _rjesenjeShownVrijeme = newValue;
    notifyListeners();
  }

  set currentSliderValueDuljina(double value) {
    _currentSliderValueDuljina = value;
    notifyListeners();
  }

  set currentSliderValueInformacije(double value) {
    _currentSliderValueInformacije = value;
    notifyListeners();
  }

  set currentSliderValueMasa(double value) {
    _currentSliderValueMasa = value;
    notifyListeners();
  }

  set currentSliderValueObujam(double value) {
    _currentSliderValueObujam = value;
    notifyListeners();
  }

  set currentSliderValuePovrsina(double value) {
    _currentSliderValuePovrsina = value;
    notifyListeners();
  }

  set currentSliderValueTemperatura(double value) {
    _currentSliderValueTemperatura = value;
    notifyListeners();
  }

  set currentSliderValueVrijeme(double value) {
    _currentSliderValueVrijeme = value;
    notifyListeners();
  }

  set helpButtonShown(bool buttonShown) {
    _helpButtonShown = buttonShown;
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

  set decimalni(bool value) {
    _decimalni = value;
    notifyListeners();
  }
}
