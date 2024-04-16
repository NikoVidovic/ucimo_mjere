import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_state.dart';

class ZadatciObujam extends StatefulWidget {
  const ZadatciObujam({super.key});

  @override
  State<ZadatciObujam> createState() => _ZadatciObujamState();
}

class _ZadatciObujamState extends State<ZadatciObujam> {
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
          return 1 / 1000;
        }
        if (to == "dm") {
          return 1 / 1000000;
        }
        if (to == "m") {
          return 1 / 1000000000;
        }
        if (to == "km") {
          return 1 / 1000000000000000000;
        }
        break;
      case 'cm':
        if (to == "mm") {
          return 1000;
        }
        if (to == "dm") {
          return 1 / 1000;
        }
        if (to == "m") {
          return 1 / 1000000;
        }
        if (to == "km") {
          return 1 / 1000000000000000;
        }
        break;
      case 'dm':
        if (to == "mm") {
          return 1000000;
        }
        if (to == "cm") {
          return 1000;
        }
        if (to == "m") {
          return 1 / 1000;
        }
        if (to == "km") {
          return 1 / 1000000000000;
        }
        break;
      case 'm':
        if (to == "mm") {
          return 1000000000;
        }
        if (to == "cm") {
          return 1000000;
        }
        if (to == "dm") {
          return 1000;
        }
        if (to == "km") {
          return 1 / 1000000000;
        }
        break;
      case 'km':
        if (to == "mm") {
          return 1000000000000000000;
        }
        if (to == "cm") {
          return 1000000000000000;
        }
        if (to == "dm") {
          return 1000000000000;
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
          if (to == "cm" && controller.text == (num / 1000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "dm" && controller.text == (num / 1000000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "m" && controller.text == (num / 1000000000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "km" &&
              controller.text == (num / 1000000000000000000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          break;
        case 'cm':
          if (to == "mm" && controller.text == (num * 1000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "dm" && controller.text == (num / 1000).toString()) {
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
              controller.text == (num / 1000000000000000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          break;
        case 'dm':
          if (to == "mm" && controller.text == (num * 1000000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "cm" && controller.text == (num * 1000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "m" && controller.text == (num / 1000).toString()) {
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
        case 'm':
          if (to == "mm" && controller.text == (num * 1000000000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "cm" && controller.text == (num * 1000000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "dm" && controller.text == (num * 1000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "km" && controller.text == (num / 1000000000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          break;
        case 'km':
          if (to == "mm" &&
              controller.text == (num * 1000000000000000000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "cm" &&
              controller.text == (num * 1000000000000000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "dm" &&
              controller.text == (num * 1000000000000).toString()) {
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
            controller.text = (num / 1000).toString();
          }
          if (to == "dm") {
            controller.text = (num / 1000000).toString();
          }
          if (to == "m") {
            controller.text = (num / 1000000000).toString();
          }
          if (to == "km") {
            controller.text = (num / 1000000000000000000).toString();
          }
          break;
        case 'cm':
          if (to == "mm") {
            controller.text = (num * 1000).toString();
          }
          if (to == "dm") {
            controller.text = (num / 1000).toString();
          }
          if (to == "m") {
            controller.text = (num / 1000000).toString();
          }
          if (to == "km") {
            controller.text = (num / 1000000000000000).toString();
          }
          break;
        case 'dm':
          if (to == "mm") {
            controller.text = (num * 1000000).toString();
          }
          if (to == "cm") {
            controller.text = (num * 1000).toString();
          }
          if (to == "m") {
            controller.text = (num / 1000).toString();
          }
          if (to == "km") {
            controller.text = (num / 1000000000000).toString();
          }
          break;
        case 'm':
          if (to == "mm") {
            controller.text = (num * 1000000000).toString();
          }
          if (to == "cm") {
            controller.text = (num * 1000000).toString();
          }
          if (to == "dm") {
            controller.text = (num * 1000).toString();
          }
          if (to == "km") {
            controller.text = (num / 1000000000).toString();
          }
          break;
        case 'km':
          if (to == "mm") {
            controller.text = (num * 1000000000000000000).toString();
          }
          if (to == "cm") {
            controller.text = (num * 1000000000000000).toString();
          }
          if (to == "dm") {
            controller.text = (num * 1000000000000).toString();
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
            values[valueFromIndex],
            style: TextStyle(
                fontSize: appState.fontSize == 1
                    ? screenHeight / 18
                    : screenHeight / 18 * (appState.fontSize - 0.25),
                color: appState.fontColor),
          ),
          Padding(
              padding: EdgeInsets.only(bottom: screenHeight / 25),
              child: Text(
                '3',
                style: TextStyle(
                    fontSize: appState.fontSize == 1
                        ? screenHeight / 25
                        : screenHeight / 25 * (appState.fontSize - 0.25),
                    color: appState.fontColor),
              )),
          Text(
            " = ",
            style: TextStyle(
                fontSize: appState.fontSize == 1
                    ? screenHeight / 18
                    : screenHeight / 18 * (appState.fontSize - 0.25),
                color: appState.fontColor),
          ),
          SizedBox(
            width:
                appState.fontSize == 1 ? screenWidth / 150 : screenWidth / 800,
          ),
          Expanded(
              child: TextField(
            style: TextStyle(
                fontSize: appState.fontSize == 1
                    ? screenHeight / 25
                    : screenHeight / 25 * (appState.fontSize),
                color: appState.fontColor),
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
          Padding(
              padding: EdgeInsets.only(bottom: screenHeight / 25),
              child: Text(
                '3',
                style: TextStyle(
                    fontSize: appState.fontSize == 1
                        ? screenHeight / 25
                        : screenHeight / 25 * (appState.fontSize - 0.25),
                    color: appState.fontColor),
              ))
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
