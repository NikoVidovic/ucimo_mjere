import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_state.dart';

class ZadatciButtonObujam extends StatefulWidget {
  const ZadatciButtonObujam({super.key});

  @override
  State<ZadatciButtonObujam> createState() => _ZadatciButtonObujamState();
}

class _ZadatciButtonObujamState extends State<ZadatciButtonObujam> {
  late AppState appState;
  late TextEditingController _textFieldController;
  int? _selectedValue1;
  int? _selectedValue2;

  @override
  void initState() {
    super.initState();
    _textFieldController = TextEditingController();
  }

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  void fillTheList(valueFrom, valueTo, numberString) {
    appState.taskObujam = true;
    appState.addItemObujam(int.parse(numberString));
    appState.addItemObujam(valueFrom);
    appState.addItemObujam(valueTo);
    _textFieldController.clear();
  }

  bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width > 1440;
  bool isPhone(BuildContext context) =>
      MediaQuery.of(context).size.width <= 1440;
  @override
  Widget build(BuildContext context) {
    appState = Provider.of<AppState>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return OutlinedButton(
        style: ButtonStyle(
            backgroundColor: appState.backgroundColor == Colors.white
                ? MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 22, 56, 74))
                : MaterialStateProperty.all<Color>(appState.fontColor),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            minimumSize: MaterialStateProperty.all<Size>(
                Size.square(screenWidth / 25))), // Adjust the size as needed
        onPressed: () {
          openDialog(screenWidth, screenHeight, appState.fontColor);
        },
        child: Text(
          'UNESITE VLASTITI ZADATAK',
          style: TextStyle(
              fontSize: screenHeight / 38, color: appState.backgroundColor),
        ));
  }

  Future openDialog(screenWidth, screenHeight, fontColor) async {
    var result = await showDialog(
      context: context,
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: AlertDialog(
          backgroundColor: appState.backgroundColor,
          title: Text(
            "Unesite vlastiti zadatak",
            style: TextStyle(
                fontSize: screenWidth / 50, color: appState.fontColor),
          ),
          content: SizedBox(
            width: screenWidth / 1.2,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textFieldController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                        fontSize: screenHeight / 35, color: appState.fontColor),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: "Upišite broj",
                      hintStyle: TextStyle(color: appState.fontColor),
                      alignLabelWithHint: true,
                    ),
                  ),
                ),
                SizedBox(
                  width: screenWidth / 100,
                ),
                Flexible(
                  child: DropdownMenu(
                      onSelected: (value1) {
                        setState(() {
                          _selectedValue1 = value1;
                        });
                      },
                      width: screenWidth / 4,
                      label: Text(
                        'Odaberite mjernu jedinicu',
                        style: TextStyle(
                            fontSize: screenHeight / 35,
                            color: appState.fontColor),
                      ),
                      helperText: isTablet(context)
                          ? 'Mjerna jedinica iz koje se pretvara'
                          : 'Iz čega se pretvara',
                      menuStyle: MenuStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              appState.backgroundColor)),
                      textStyle: TextStyle(color: appState.fontColor),
                      dropdownMenuEntries: [
                        DropdownMenuEntry(
                            value: 0,
                            label: 'mm',
                            style: ButtonStyle(
                                foregroundColor: MaterialStatePropertyAll(
                                    appState.fontColor))),
                        DropdownMenuEntry(
                            value: 1,
                            label: 'cm',
                            style: ButtonStyle(
                                foregroundColor: MaterialStatePropertyAll(
                                    appState.fontColor))),
                        DropdownMenuEntry(
                            value: 2,
                            label: 'dm',
                            style: ButtonStyle(
                                foregroundColor: MaterialStatePropertyAll(
                                    appState.fontColor))),
                        DropdownMenuEntry(
                            value: 3,
                            label: 'm',
                            style: ButtonStyle(
                                foregroundColor: MaterialStatePropertyAll(
                                    appState.fontColor))),
                        DropdownMenuEntry(
                            value: 4,
                            label: 'km',
                            style: ButtonStyle(
                                foregroundColor: MaterialStatePropertyAll(
                                    appState.fontColor))),
                      ]),
                ),
                SizedBox(
                  width: screenWidth / 100,
                ),
                Text(
                  "=",
                  style: TextStyle(
                      fontSize: screenWidth / 50, color: appState.fontColor),
                ),
                SizedBox(
                  width: screenWidth / 100,
                ),
                Flexible(
                  child: DropdownMenu(
                      onSelected: (value2) {
                        setState(() {
                          _selectedValue2 = value2;
                        });
                      },
                      width: screenWidth / 4,
                      label: Text(
                        'Odaberite mjernu jedinicu',
                        style: TextStyle(
                            fontSize: screenHeight / 35,
                            color: appState.fontColor),
                      ),
                      helperText: isTablet(context)
                          ? 'Mjerna jedinica u koju se pretvara'
                          : 'U što se pretvara',
                      menuStyle: MenuStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              appState.backgroundColor)),
                      textStyle: TextStyle(color: appState.fontColor),
                      dropdownMenuEntries: [
                        DropdownMenuEntry(
                            value: 0,
                            label: 'mm',
                            style: ButtonStyle(
                                foregroundColor: MaterialStatePropertyAll(
                                    appState.fontColor))),
                        DropdownMenuEntry(
                            value: 1,
                            label: 'cm',
                            style: ButtonStyle(
                                foregroundColor: MaterialStatePropertyAll(
                                    appState.fontColor))),
                        DropdownMenuEntry(
                            value: 2,
                            label: 'dm',
                            style: ButtonStyle(
                                foregroundColor: MaterialStatePropertyAll(
                                    appState.fontColor))),
                        DropdownMenuEntry(
                            value: 3,
                            label: 'm',
                            style: ButtonStyle(
                                foregroundColor: MaterialStatePropertyAll(
                                    appState.fontColor))),
                        DropdownMenuEntry(
                            value: 4,
                            label: 'km',
                            style: ButtonStyle(
                                foregroundColor: MaterialStatePropertyAll(
                                    appState.fontColor))),
                      ]),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  setState(() {
                    if (_selectedValue1 == null && _selectedValue2 == null) {
                      showTemporaryDialog(
                          context, 'Odaberite mjerne jedinice!');
                    } else if (_selectedValue1 == _selectedValue2) {
                      showTemporaryDialog(
                          context, 'Odaberite različite mjerne jedinice!');
                    } else if (_textFieldController.text == "") {
                      showTemporaryDialog(context, 'Upišite broj!');
                    } else if (_selectedValue1 == null) {
                      showTemporaryDialog(context,
                          'Upišite mjernu jedinicu iz koje želite pretvarati!');
                    } else if (_selectedValue2 == null) {
                      showTemporaryDialog(context,
                          'Upišite mjernu jedinicu u koju želite pretvarati!');
                    } else {
                      fillTheList(_selectedValue1, _selectedValue2,
                          _textFieldController.text);
                      showTemporaryDialog(context, 'Zadatak uspješno dodan!');
                    }
                  });
                },
                child: Text("DODAJ ZADATAK",
                    style: TextStyle(
                        fontSize: screenHeight / 45,
                        color: appState.fontColor)))
          ],
        ),
      ),
    );
    if (result == null) {
      _selectedValue1 = null;
      _selectedValue2 = null;
    }
  }

  void showTemporaryDialog(BuildContext context, String message) {
    showDialog(
      barrierDismissible: false, // Prevent dismissing by tapping outside
      context: context,
      builder: (context) {
        Future.delayed(const Duration(milliseconds: 1500), () {
          Navigator.of(context).pop(); // Close the dialog after 2 seconds
        });
        return AlertDialog(
          alignment: Alignment.center,
          title: Text(
            message,
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
