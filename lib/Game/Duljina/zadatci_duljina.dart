import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_state.dart';

class ZadatciDuljina extends StatefulWidget {
  const ZadatciDuljina({super.key});

  @override
  State<ZadatciDuljina> createState() => _ZadatciDuljinaState();
}

class _ZadatciDuljinaState extends State<ZadatciDuljina> {
  final controller = TextEditingController();
  late AppState appState;

  int numValue = Random().nextInt(10) + 1;
  var values = ['mm', "cm", "dm", "m", "km"];
  int valueFromIndex = Random().nextInt(5);
  int valueToIndex = 0;

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void generateIndexAndNumber() {
    valueFromIndex = Random().nextInt(5);
    valueToIndex = 0;
    numValue = Random().nextInt(10) + 1;
    switch (appState.currentSliderValue.round()) {
      case 1:
        if (valueFromIndex == 0) {
          valueFromIndex++;
        }
        valueToIndex = valueFromIndex - 1;
        break;
      case 2:
        if (valueFromIndex == 0 || valueFromIndex == 1) {
          valueFromIndex += 2;
        }
        valueToIndex = valueFromIndex - 2;
        break;
      case 3:
        if (valueFromIndex == values.length - 1) {
          valueFromIndex--;
        }
        if (valueFromIndex == 0) {
          valueFromIndex++;
        }
        valueToIndex =
            (Random().nextBool()) ? valueFromIndex + 1 : valueFromIndex - 1;
        break;
      case 4:
      default:
        while (valueFromIndex == valueToIndex) {
          valueToIndex = Random().nextInt(5);
        }
    }
  }

  void checkAnswer(int num, String from, String to) {
    setState(() {
      switch (from) {
        case 'mm':
          if (to == "km" && controller.text == (num / 1000000).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "m" && controller.text == (num / 1000).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "dm" && controller.text == (num / 100).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "cm" && controller.text == (num / 10).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          break;
        case 'cm':
          if (to == "km" && controller.text == (num / 100000).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "m" && controller.text == (num / 100).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "dm" && controller.text == (num / 10).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "mm" && controller.text == (num * 10).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          break;
        case 'dm':
          if (to == "km" && controller.text == (num / 10000).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "m" && controller.text == (num / 10).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "cm" && controller.text == (num * 10).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "mm" && controller.text == (num * 100).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          break;
        case 'm':
          if (to == "km" && controller.text == (num / 1000).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "dm" && controller.text == (num * 10).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "cm" && controller.text == (num * 100).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "mm" && controller.text == (num * 1000).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          break;
        case 'km':
          if (to == "m" && controller.text == (num * 1000).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "dm" && controller.text == (num * 10000).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "cm" && controller.text == (num * 100000).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "mm" && controller.text == (num * 100000).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    appState = Provider.of<AppState>(context);
    generateIndexAndNumber();
    return Column(children: [
      const Padding(
        padding: EdgeInsets.only(top: 25, left: 10, right: 10),
        child: Text(
          "Preračunaj mjeru s lijeve strane crte u mjeru s desne strane crte. Zatim odgovor upiši na crtu 'Unesite rješenje'! Zatim svoj odgovor provjeri klikom na gumb 'PROVJERI'!",
          style: TextStyle(fontSize: 30),
          textAlign: TextAlign.left,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 50, left: 390, right: 390),
        child: Row(children: [
          Text(
            numValue.toString(),
            style: const TextStyle(fontSize: 50),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            values[valueFromIndex],
            style: const TextStyle(fontSize: 50),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: TextField(
            textAlign: TextAlign.center,
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: 'Unesite rješenje',
              alignLabelWithHint: true,
            ),
          )),
          const SizedBox(
            width: 10,
          ),
          Text(
            values[valueToIndex],
            style: const TextStyle(fontSize: 50),
          )
        ]),
      ),
      OutlinedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(255, 22, 56, 74)),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white)),
          onPressed: () {
            checkAnswer(numValue, values[valueFromIndex], values[valueToIndex]);
          },
          child: const Text('PROVJERI'))
    ]);
  }
}
