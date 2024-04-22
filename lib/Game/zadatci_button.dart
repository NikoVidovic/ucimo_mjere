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
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 22, 56, 74)),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            minimumSize: MaterialStateProperty.all<Size>(
                Size.square(screenWidth / 25))), // Adjust the size as needed
        onPressed: () {
          openDialog(screenWidth, screenHeight, appState.fontColor);
        },
        child: Text(
          'UNESITE VLASTITI ZADATAK',
          style: TextStyle(fontSize: screenHeight / 38),
        ));
  }

  Future openDialog(screenWidth, screenHeight, fontColor) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            "Unesite vlastiti zadatak",
            style: TextStyle(fontSize: screenWidth / 50),
          ),
          content: SizedBox(
            width: screenWidth / 1.2,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: TextStyle(
                        fontSize: screenHeight / 35, color: appState.fontColor),
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      hintText: "Upišite broj",
                      alignLabelWithHint: true,
                    ),
                  ),
                ),
                SizedBox(
                  width: screenWidth / 200,
                ),
                Flexible(
                  child: DropdownMenu(
                      width: screenWidth / 5,
                      label: Text(
                        'Odaberite mjernu jedinicu',
                        style: TextStyle(
                            fontSize: screenHeight / 35,
                            color: appState.fontColor),
                      ),
                      helperText: 'Mjerna jedinica iz koje se pretvara',
                      dropdownMenuEntries: const [
                        DropdownMenuEntry(value: "value1", label: 'value1'),
                        DropdownMenuEntry(value: "value2", label: 'value2'),
                        DropdownMenuEntry(value: "value3", label: 'value3'),
                        DropdownMenuEntry(value: "value4", label: 'value4'),
                        DropdownMenuEntry(value: "value5", label: 'value5'),
                      ]),
                ),
                SizedBox(
                  width: screenWidth / 200,
                ),
                const Text("="),
                SizedBox(
                  width: screenWidth / 200,
                ),
                Flexible(
                  child: DropdownMenu(
                      width: screenWidth / 5.5,
                      label: const Text('Odaberite mjernu jedinicu'),
                      helperText: 'Mjerna jedinica iz koje se pretvara',
                      dropdownMenuEntries: const [
                        DropdownMenuEntry(value: "value1", label: 'value1'),
                        DropdownMenuEntry(value: "value2", label: 'value2'),
                        DropdownMenuEntry(value: "value3", label: 'value3'),
                        DropdownMenuEntry(value: "value4", label: 'value4'),
                        DropdownMenuEntry(value: "value5", label: 'value5'),
                      ]),
                ),
              ],
            ),
          ),
        ),
      );
}
