import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_state.dart';

class ZadatciVrijeme extends StatefulWidget {
  const ZadatciVrijeme({super.key});

  @override
  State<ZadatciVrijeme> createState() => _ZadatciVrijemeState();
}

class _ZadatciVrijemeState extends State<ZadatciVrijeme> {
  final controller = TextEditingController();
  late AppState appState;

  int numValue = Random().nextInt(3) + 1;
  var values = ['ms', "s", "min", "h", "dan"];
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
    numValue = Random().nextInt(3) + 1;
    switch (appState.currentSliderValue) {
      case 1:
      case 2:
        if (valueFromIndex == 0) {
          valueFromIndex++;
        }
        valueToIndex = valueFromIndex - 1;
        break;

      case 3:
      case 4:
      default:
        if (valueFromIndex == 0 || valueFromIndex == 1) {
          valueFromIndex += 2;
        }
        valueToIndex =
            (Random().nextBool()) ? valueFromIndex - 1 : valueFromIndex - 2;
        break;
    }
  }

  double setUnitTo(String from, String to) {
    switch (from) {
      case 'ms':
        if (to == "s") {
          return 1 / 1000;
        }
        if (to == "min") {
          return (1 / 1000) / 60;
        }
        if (to == "h") {
          return ((1 / 1000) / 60) / 60;
        }
        if (to == "dan") {
          return (((1 / 1000) / 60) / 60) / 24;
        }
        break;
      case 's':
        if (to == "ms") {
          return 1000;
        }
        if (to == "min") {
          return 1 / 60;
        }
        if (to == "h") {
          return (1 / 60) / 60;
        }
        if (to == "dan") {
          return ((1 / 60) / 60) / 24;
        }
        break;
      case 'min':
        if (to == "ms") {
          return 60000;
        }
        if (to == "s") {
          return 60;
        }
        if (to == "h") {
          return 1 / 60;
        }
        if (to == "dan") {
          return (1 / 60) / 24;
        }
        break;
      case 'h':
        if (to == "ms") {
          return 3600000;
        }
        if (to == "s") {
          return 3600;
        }
        if (to == "min") {
          return 60;
        }
        if (to == "dan") {
          return 1 / 24;
        }
        break;
      case 'dan':
        if (to == "ms") {
          return 86400000;
        }
        if (to == "s") {
          return 86400;
        }
        if (to == "min") {
          return 1440;
        }
        if (to == "h") {
          return 24;
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
        case 'ms':
          if (to == "s" && controller.text == (num / 1000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "min" &&
              controller.text == ((num / 1000) / 60).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "h" &&
              controller.text == (((num / 1000) / 60) / 60).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "dan" &&
              controller.text == ((((num / 1000) / 60) / 60) / 24).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          break;
        case 's':
          if (to == "ms" && controller.text == (num * 1000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "min" && controller.text == (num / 60).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "h" && controller.text == ((num / 60) / 60).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "dan" &&
              controller.text == (((num / 60) / 60) / 24).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          break;
        case 'min':
          if (to == "ms" && controller.text == (num * 60000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "s" && controller.text == (num * 60).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "h" && controller.text == (num / 60).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "dan" && controller.text == ((num / 60) / 24).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          break;
        case 'h':
          if (to == "ms" && controller.text == (num * 3600000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "s" && controller.text == (num * 3600).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "min" && controller.text == (num * 60).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "dan" && controller.text == (num / 24).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          break;
        case 'dan':
          if (to == "ms" && controller.text == (num * 86400000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "s" && controller.text == (num * 86400).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "min" && controller.text == (num * 1440).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "h" && controller.text == (num * 24).toString()) {
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
        case 'ms':
          if (to == "s") {
            controller.text = (num / 1000).toString();
          }
          if (to == "min") {
            controller.text = ((num / 1000) / 60).toString();
          }
          if (to == "h") {
            controller.text = (((num / 1000) / 60) / 60).toString();
          }
          if (to == "dan") {
            controller.text = ((((num / 1000) / 60) / 60) / 24).toString();
          }
          break;
        case 's':
          if (to == "ms") {
            controller.text = (num * 1000).toString();
          }
          if (to == "min") {
            controller.text = (num / 60).toString();
          }
          if (to == "h") {
            controller.text = ((num / 60) / 60).toString();
          }
          if (to == "dan") {
            controller.text = (((num / 60) / 60) / 24).toString();
          }
          break;
        case 'min':
          if (to == "ms") {
            controller.text = (num * 60000).toString();
          }
          if (to == "s") {
            controller.text = (num * 60).toString();
          }
          if (to == "h") {
            controller.text = (num / 60).toString();
          }
          if (to == "dan") {
            controller.text = ((num / 60) / 24).toString();
          }
          break;
        case 'h':
          if (to == "ms") {
            controller.text = (num * 3600000).toString();
          }
          if (to == "s") {
            controller.text = (num * 3600).toString();
          }
          if (to == "min") {
            controller.text = (num * 60).toString();
          }
          if (to == "dan") {
            controller.text = (num / 24).toString();
          }
          break;
        case 'dan':
          if (to == "ms") {
            controller.text = (num * 86400000).toString();
          }
          if (to == "s") {
            controller.text = (num * 86400).toString();
          }
          if (to == "min") {
            controller.text = (num * 1440).toString();
          }
          if (to == "h") {
            controller.text = (num * 24).toString();
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
        padding: const EdgeInsets.only(top: 50, left: 90, right: 390),
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
