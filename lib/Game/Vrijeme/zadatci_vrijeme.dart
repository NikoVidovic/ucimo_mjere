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
    appState = Provider.of<AppState>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(children: [
      Padding(
        padding: EdgeInsets.only(
            top: screenHeight / 100,
            left: screenWidth / 200,
            right: screenWidth / 200),
        child: Text(
          "Preračunaj mjeru s lijeve strane crte u mjeru s desne strane crte. Zatim odgovor upiši na crtu 'Unesite rješenje'! Zatim svoj odgovor provjeri klikom na gumb 'PROVJERI'!",
          style: TextStyle(
              fontSize: appState.fontSize == 1
                  ? screenHeight / 30
                  : screenHeight / 30 * (appState.fontSize - 0.2),
              color: appState.fontColor),
          textAlign: TextAlign.left,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(
            top: screenHeight / 500,
            left: screenWidth / 43,
            right:
                appState.fontSize == 1 ? screenWidth / 3.35 : screenWidth / 4),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Visibility(
              visible: appState.helpButtonShown,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.all(screenWidth / 120),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      appState.postupakShown = true;
                    });
                  },
                  child: Text(
                    'Trebaš pomoć?',
                    style: TextStyle(
                        fontSize: appState.fontSize == 1
                            ? screenHeight / 31
                            : screenHeight / 31 * (appState.fontSize - 0.35)),
                  ))),
          SizedBox(
            width: appState.fontSize == 1 ? screenWidth / 8 : screenWidth / 16,
          ),
          Text(
            numValue.toString(),
            style: TextStyle(
                fontSize: appState.fontSize == 1
                    ? screenHeight / 18
                    : screenHeight / 18 * (appState.fontSize - 0.25),
                color: appState.fontColor),
          ),
          SizedBox(
            width:
                appState.fontSize == 1 ? screenWidth / 150 : screenWidth / 300,
          ),
          Text(
            "${values[valueFromIndex]} = ",
            style: TextStyle(
                fontSize: appState.fontSize == 1
                    ? screenHeight / 18
                    : screenHeight / 18 * (appState.fontSize - 0.25),
                color: appState.fontColor),
          ),
          SizedBox(
            width:
                appState.fontSize == 1 ? screenWidth / 150 : screenWidth / 300,
          ),
          Expanded(
              child: TextField(
            style: TextStyle(
                fontSize: screenHeight / 25, color: appState.fontColor),
            textAlign: TextAlign.center,
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Unesite rješenje',
              hintStyle: TextStyle(
                  fontSize: appState.fontSize == 1
                      ? screenHeight / 50
                      : screenHeight / 50 * (appState.fontSize - 0.3),
                  color: appState.fontColor),
              alignLabelWithHint: true,
            ),
          )),
          SizedBox(
            width: screenWidth / 150,
          ),
          Text(
            values[valueToIndex],
            style: TextStyle(
                fontSize: appState.fontSize == 1
                    ? screenHeight / 18
                    : screenHeight / 18 * (appState.fontSize - 0.25),
                color: appState.fontColor),
          ),
        ]),
      ),
      SizedBox(
        height: appState.fontSize == 1 ? 0 : screenHeight / 200,
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
                          MaterialStateProperty.all<Color>(Colors.white),
                      minimumSize: MaterialStateProperty.all<Size>(
                          Size.square(screenWidth / 35)),
                      side: MaterialStateProperty.all<BorderSide>(
                          BorderSide(color: appState.fontColor, width: 1.5))),
                  onPressed: () {
                    setState(() {
                      completeSolution(numValue, values[valueFromIndex],
                          values[valueToIndex]);
                    });
                  },
                  child: Text('RJEŠENJE',
                      style: TextStyle(
                          fontSize: appState.fontSize == 1
                              ? screenHeight / 35
                              : screenHeight / 35 * (appState.fontSize - 0.25),
                          color: Colors.black)))),
          SizedBox(
            width: screenWidth / 150,
          ),
          OutlinedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 22, 56, 74)),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  minimumSize: MaterialStateProperty.all<Size>(
                      Size.square(screenWidth / 35))),
              onPressed: () {
                checkAnswer(
                    numValue, values[valueFromIndex], values[valueToIndex]);
              },
              child: Text('PROVJERI',
                  style: TextStyle(
                      fontSize: appState.fontSize == 1
                          ? screenHeight / 35
                          : screenHeight / 35 * (appState.fontSize - 0.25)))),
          SizedBox(
            height: screenHeight / 52,
          ),
        ],
      ),
      SizedBox(
        height: appState.fontSize == 1 ? 0 : screenHeight / 200,
      ),
      Padding(
        padding: EdgeInsets.only(right: screenWidth / 3, left: screenWidth / 3),
        child: Visibility(
            visible: appState.postupakShown,
            child: Container(
              width: double.maxFinite,
              color: const Color.fromARGB(255, 232, 196, 80),
              child: Padding(
                padding: EdgeInsets.only(left: screenWidth / 200),
                child: Text(
                  '1 ${values[valueFromIndex]} = ${setUnitTo(values[valueFromIndex], values[valueToIndex]).toString().replaceAll(RegExp(r'([.]*0)(?!.*\d)'), '')} ${values[valueToIndex]}\n$numValue ${values[valueFromIndex]} = ($numValue \u2022 ${setUnitTo(values[valueFromIndex], values[valueToIndex]).toString().replaceAll(RegExp(r'([.]*0)(?!.*\d)'), '')}) ${values[valueToIndex]}',
                  style: TextStyle(fontSize: screenHeight / 25),
                  textAlign: TextAlign.left,
                ),
              ),
            )),
      )
    ]);
  }
}
