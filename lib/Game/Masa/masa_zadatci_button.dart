import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_state.dart';

class ZadatciButtonMasa extends StatefulWidget {
  const ZadatciButtonMasa({super.key});

  @override
  State<ZadatciButtonMasa> createState() => _ZadatciButtonMasaState();
}

class _ZadatciButtonMasaState extends State<ZadatciButtonMasa> {
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
    appState.task = true;
    appState.addItem(int.parse(numberString));
    appState.addItem(valueFrom);
    appState.addItem(valueTo);
    _textFieldController.clear();
  }

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

  Future openDialog(screenWidth, screenHeight, fontColor) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
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
                      helperText: 'Mjerna jedinica iz koje se pretvara',
                      menuStyle: MenuStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              appState.backgroundColor)),
                      textStyle: TextStyle(color: appState.fontColor),
                      dropdownMenuEntries: [
                        DropdownMenuEntry(
                            value: 0,
                            label: 'g',
                            style: ButtonStyle(
                                foregroundColor: MaterialStatePropertyAll(
                                    appState.fontColor))),
                        DropdownMenuEntry(
                            value: 1,
                            label: 'dg',
                            style: ButtonStyle(
                                foregroundColor: MaterialStatePropertyAll(
                                    appState.fontColor))),
                        DropdownMenuEntry(
                            value: 2,
                            label: 'kg',
                            style: ButtonStyle(
                                foregroundColor: MaterialStatePropertyAll(
                                    appState.fontColor))),
                        DropdownMenuEntry(
                            value: 3,
                            label: 't',
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
                      helperText: 'Mjerna jedinica iz koje se pretvara',
                      menuStyle: MenuStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              appState.backgroundColor)),
                      textStyle: TextStyle(color: appState.fontColor),
                      dropdownMenuEntries: [
                        DropdownMenuEntry(
                            value: 0,
                            label: 'g',
                            style: ButtonStyle(
                                foregroundColor: MaterialStatePropertyAll(
                                    appState.fontColor))),
                        DropdownMenuEntry(
                            value: 1,
                            label: 'dg',
                            style: ButtonStyle(
                                foregroundColor: MaterialStatePropertyAll(
                                    appState.fontColor))),
                        DropdownMenuEntry(
                            value: 2,
                            label: 'kg',
                            style: ButtonStyle(
                                foregroundColor: MaterialStatePropertyAll(
                                    appState.fontColor))),
                        DropdownMenuEntry(
                            value: 3,
                            label: 't',
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
                    if (_selectedValue1 == _selectedValue2) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Odaberite različite mjerne jedinice!'),
                          duration: Duration(seconds: 3), // Snackbar duration
                        ),
                      );
                    } else if (_textFieldController.text == "") {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Upišite broj!'),
                          duration: Duration(seconds: 3), // Snackbar duration
                        ),
                      );
                    } else if (_selectedValue1 == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              'Upišite mjernu jedinicu iz koje želite pretvarati!'),
                          duration: Duration(seconds: 3), // Snackbar duration
                        ),
                      );
                    } else if (_selectedValue2 == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              'Upišite mjernu jedinicu u koju želite pretvarati!'),
                          duration: Duration(seconds: 3), // Snackbar duration
                        ),
                      );
                    } else {
                      fillTheList(_selectedValue1, _selectedValue2,
                          _textFieldController.text);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Zadatak uspješno dodan!'),
                          duration: Duration(seconds: 3), // Snackbar duration
                        ),
                      );
                    }
                  });
                },
                child: Text("DODAJ ZADATAK",
                    style: TextStyle(
                        fontSize: screenHeight / 45,
                        color: appState.fontColor)))
          ],
        ),
      );
}
