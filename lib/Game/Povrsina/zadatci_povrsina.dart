import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_state.dart';

class ZadatciPovrsina extends StatefulWidget {
  const ZadatciPovrsina({super.key});

  @override
  State<ZadatciPovrsina> createState() => _ZadatciPovrsinaState();
}

class _ZadatciPovrsinaState extends State<ZadatciPovrsina> {
  final controller = TextEditingController();
  late AppState appState;

  int numValue = Random().nextInt(10) + 1;
  var values = ['mm', "cm", "dm", "m", "km"];
  int valueFromIndex = Random().nextInt(5);
  int valueToIndex = 0;

  @override
  void initState() {
    super.initState();
    appState = Provider.of<AppState>(context, listen: false);
    generateIndexAndNumber();
  }

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

  double setUnitTo(String from, String to) {
    switch (from) {
      case 'mm':
        if (to == "cm") {
          return 1 / 100;
        }
        if (to == "dm") {
          return 1 / 10000;
        }
        if (to == "m") {
          return 1 / 1000000;
        }
        if (to == "km") {
          return 1 / 1000000000000;
        }
        break;
      case 'cm':
        if (to == "mm") {
          return 100;
        }
        if (to == "dm") {
          return 1 / 100;
        }
        if (to == "m") {
          return 1 / 10000;
        }
        if (to == "km") {
          return 1 / 10000000000;
        }
        break;
      case 'dm':
        if (to == "mm") {
          return 10000;
        }
        if (to == "cm") {
          return 100;
        }
        if (to == "m") {
          return 1 / 100;
        }
        if (to == "km") {
          return 1 / 100000000;
        }
        break;
      case 'm':
        if (to == "mm") {
          return 1000000;
        }
        if (to == "cm") {
          return 10000;
        }
        if (to == "dm") {
          return 100;
        }
        if (to == "km") {
          return 1 / 1000000;
        }
        break;
      case 'km':
        if (to == "mm") {
          return 1000000000000;
        }
        if (to == "cm") {
          return 10000000000;
        }
        if (to == "dm") {
          return 100000000;
        }
        if (to == "m") {
          return 1000000;
        }
        break;
      default:
    }
    return 1;
  }

  void checkAnswer(int num, String from, String to) {
    bool isCorrect = false;
    setState(() {
      FocusManager.instance.primaryFocus?.unfocus();
      switch (from) {
        case 'mm':
          if (to == "cm" && controller.text == (num / 100).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "dm" && controller.text == (num / 10000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "m" && controller.text == (num / 1000000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "km" &&
              controller.text == (num / 1000000000000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          break;
        case 'cm':
          if (to == "mm" && controller.text == (num * 100).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "dm" && controller.text == (num / 100).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "m" && controller.text == (num / 10000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "km" && controller.text == (num / 10000000000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          break;
        case 'dm':
          if (to == "mm" && controller.text == (num * 10000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "cm" && controller.text == (num * 100).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "m" && controller.text == (num / 100).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "km" && controller.text == (num / 100000000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          break;
        case 'm':
          if (to == "mm" && controller.text == (num * 1000000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "cm" && controller.text == (num * 10000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "dm" && controller.text == (num * 100).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "km" && controller.text == (num / 1000000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          break;
        case 'km':
          if (to == "mm" &&
              controller.text == (num * 1000000000000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "cm" && controller.text == (num * 10000000000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "dm" && controller.text == (num * 100000000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "m" && controller.text == (num * 1000000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          break;
        default:
      }
      if (isCorrect && appState.helpButtonShown == true) {
        appState.helpButtonShown = false;
        appState.postupakShown = false;
      } else if (!isCorrect && appState.postupakShown == false) {
        appState.helpButtonShown = true;
      }
    });
  }

  completeSolution(int num, String from, String to) {
    setState(() {
      switch (from) {
        case 'mm':
          if (to == "cm") {
            controller.text = (num / 100).toString();
          }
          if (to == "dm") {
            controller.text = (num / 10000).toString();
          }
          if (to == "m") {
            controller.text = (num / 1000000).toString();
          }
          if (to == "km") {
            controller.text = (num / 1000000000000).toString();
          }
          break;
        case 'cm':
          if (to == "mm") {
            controller.text = (num * 100).toString();
          }
          if (to == "dm") {
            controller.text = (num / 100).toString();
          }
          if (to == "m") {
            controller.text = (num / 10000).toString();
          }
          if (to == "km") {
            controller.text = (num / 10000000000).toString();
          }
          break;
        case 'dm':
          if (to == "mm") {
            controller.text = (num * 10000).toString();
          }
          if (to == "cm") {
            controller.text = (num * 100).toString();
          }
          if (to == "m") {
            controller.text = (num / 100).toString();
          }
          if (to == "km") {
            controller.text = (num / 100000000).toString();
          }
          break;
        case 'm':
          if (to == "mm") {
            controller.text = (num * 1000000).toString();
          }
          if (to == "cm") {
            controller.text = (num * 10000).toString();
          }
          if (to == "dm") {
            controller.text = (num * 100).toString();
          }
          if (to == "km") {
            controller.text = (num / 1000000).toString();
          }
          break;
        case 'km':
          if (to == "mm") {
            controller.text = (num * 1000000000000).toString();
          }
          if (to == "cm") {
            controller.text = (num * 10000000000).toString();
          }
          if (to == "dm") {
            controller.text = (num * 100000000).toString();
          }
          if (to == "m") {
            controller.text = (num * 1000000).toString();
          }
          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.only(top: 50, left: 70, right: 390),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Visibility(
              visible: appState.helpButtonShown,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.all(10),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      appState.postupakShown = true;
                    });
                  },
                  child: const Text(
                    'Trebaš pomoć?',
                    style: TextStyle(fontSize: 25),
                  ))),
          const SizedBox(
            width: 140,
          ),
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
          const Padding(
              padding: EdgeInsets.only(bottom: 32.0),
              child: Text(
                '2',
                style: TextStyle(fontSize: 30),
              )),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: TextField(
            style: const TextStyle(fontSize: 30),
            textAlign: TextAlign.center,
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: 'Unesite rješenje',
              hintStyle: TextStyle(fontSize: 15),
              alignLabelWithHint: true,
            ),
          )),
          const SizedBox(
            width: 10,
          ),
          Text(
            values[valueToIndex],
            style: const TextStyle(fontSize: 50),
          ),
          const Padding(
              padding: EdgeInsets.only(bottom: 32.0),
              child: Text(
                '2',
                style: TextStyle(fontSize: 30),
              ))
        ]),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
              visible: appState.rjesenjeShown,
              child: OutlinedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 212, 171, 36)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white)),
                  onPressed: () {
                    setState(() {
                      completeSolution(numValue, values[valueFromIndex],
                          values[valueToIndex]);
                    });
                  },
                  child: const Text('RJEŠENJE'))),
          const SizedBox(
            width: 10,
          ),
          OutlinedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 22, 56, 74)),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white)),
              onPressed: () {
                checkAnswer(
                    numValue, values[valueFromIndex], values[valueToIndex]);
              },
              child: const Text('PROVJERI')),
        ],
      ),
      const SizedBox(
        height: 50,
      ),
      Padding(
        padding: const EdgeInsets.only(right: 900.0, left: 10),
        child: Visibility(
            visible: appState.postupakShown,
            child: Container(
              width: double.maxFinite,
              color: const Color.fromARGB(255, 232, 196, 80),
              child: Text(
                '1 ${values[valueFromIndex]} = ${setUnitTo(values[valueFromIndex], values[valueToIndex]).toString().replaceAll(RegExp(r'([.]*0)(?!.*\d)'), '')} ${values[valueToIndex]}\n$numValue ${values[valueFromIndex]} = ($numValue \u2022 ${setUnitTo(values[valueFromIndex], values[valueToIndex]).toString().replaceAll(RegExp(r'([.]*0)(?!.*\d)'), '')}) ${values[valueToIndex]}',
                style: const TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
            )),
      )
    ]);
  }
}
