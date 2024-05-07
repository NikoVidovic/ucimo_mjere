import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_state.dart';

class ZadatciButton extends StatefulWidget {
  const ZadatciButton({super.key});

  @override
  State<ZadatciButton> createState() => _ZadatciButtonState();
}

class _ZadatciButtonState extends State<ZadatciButton> {
  late AppState appState;
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
                            value: "value1",
                            label: 'value1',
                            style: ButtonStyle(
                                foregroundColor: MaterialStatePropertyAll(
                                    appState.fontColor))),
                        DropdownMenuEntry(
                            value: "value2",
                            label: 'value2',
                            style: ButtonStyle(
                                foregroundColor: MaterialStatePropertyAll(
                                    appState.fontColor))),
                        DropdownMenuEntry(
                            value: "value3",
                            label: 'value3',
                            style: ButtonStyle(
                                foregroundColor: MaterialStatePropertyAll(
                                    appState.fontColor))),
                        DropdownMenuEntry(
                            value: "value4",
                            label: 'value4',
                            style: ButtonStyle(
                                foregroundColor: MaterialStatePropertyAll(
                                    appState.fontColor))),
                        DropdownMenuEntry(
                            value: "value5",
                            label: 'value5',
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
                            value: "value1",
                            label: 'value1',
                            style: ButtonStyle(
                                foregroundColor: MaterialStatePropertyAll(
                                    appState.fontColor))),
                        DropdownMenuEntry(
                            value: "value2",
                            label: 'value2',
                            style: ButtonStyle(
                                foregroundColor: MaterialStatePropertyAll(
                                    appState.fontColor))),
                        DropdownMenuEntry(
                            value: "value3",
                            label: 'value3',
                            style: ButtonStyle(
                                foregroundColor: MaterialStatePropertyAll(
                                    appState.fontColor))),
                        DropdownMenuEntry(
                            value: "value4",
                            label: 'value4',
                            style: ButtonStyle(
                                foregroundColor: MaterialStatePropertyAll(
                                    appState.fontColor))),
                        DropdownMenuEntry(
                            value: "value5",
                            label: 'value5',
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
                onPressed: () {},
                child: Text("DODAJ ZADATAK",
                    style: TextStyle(
                        fontSize: screenHeight / 45,
                        color: appState.fontColor)))
          ],
        ),
      );
}
