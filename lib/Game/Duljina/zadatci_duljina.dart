import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/../app_state.dart';

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

  @override
  void initState() {
    super.initState();
    appState = Provider.of<AppState>(context, listen: false);
    generateIndexAndNumber();
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
        if (to == "km") {
          return 0.000001;
        }
        if (to == "m") {
          return 0.001;
        }
        if (to == "dm") {
          return 1 / 100;
        }
        if (to == "cm") {
          return 1 / 10;
        }
        break;
      case 'cm':
        if (to == "km") {
          return 1 / 100000;
        }
        if (to == "m") {
          return 1 / 100;
        }
        if (to == "dm") {
          return 1 / 10;
        }
        if (to == "mm") {
          return 10;
        }
        break;
      case 'dm':
        if (to == "km") {
          return 1 / 10000;
        }
        if (to == "m") {
          return 1 / 10;
        }
        if (to == "cm") {
          return 10;
        }
        if (to == "mm") {
          return 100;
        }
        break;
      case 'm':
        if (to == "km") {
          return 1 / 1000;
        }
        if (to == "dm") {
          return 10;
        }
        if (to == "cm") {
          return 100;
        }
        if (to == "mm") {
          return 1000;
        }
        break;
      case 'km':
        if (to == "m") {
          return 1000;
        }
        if (to == "dm") {
          return 10000;
        }
        if (to == "cm") {
          return 100000;
        }
        if (to == "mm") {
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
          if (to == "km" && controller.text == (num / 1000000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "m" && controller.text == (num / 1000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "dm" && controller.text == (num / 100).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "cm" && controller.text == (num / 10).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          break;
        case 'cm':
          if (to == "km" && controller.text == (num / 100000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "m" && controller.text == (num / 100).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "dm" && controller.text == (num / 10).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "mm" && controller.text == (num * 10).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          break;
        case 'dm':
          if (to == "km" && controller.text == (num / 10000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "m" && controller.text == (num / 10).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "cm" && controller.text == (num * 10).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "mm" && controller.text == (num * 100).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          break;
        case 'm':
          if (to == "km" && controller.text == (num / 1000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "dm" && controller.text == (num * 10).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "cm" && controller.text == (num * 100).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "mm" && controller.text == (num * 1000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          break;
        case 'km':
          if (to == "m" && controller.text == (num * 1000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "dm" && controller.text == (num * 10000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "cm" && controller.text == (num * 100000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "mm" && controller.text == (num * 1000000).toString()) {
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
          if (to == "km") {
            controller.text = (num / 1000000).toString();
            //checkAnswer(num, from, to);
          }
          if (to == "m") {
            controller.text = (num / 1000).toString();
            //checkAnswer(num, from, to);
          }
          if (to == "dm") {
            controller.text = (num / 100).toString();
            //checkAnswer(num, from, to);
          }
          if (to == "cm") {
            controller.text = (num / 10).toString();
            //checkAnswer(num, from, to);
          }
          break;
        case 'cm':
          if (to == "km") {
            controller.text = (num / 100000).toString();
            //checkAnswer(num, from, to);
          }
          if (to == "m") {
            controller.text = (num / 100).toString();
            //checkAnswer(num, from, to);
          }
          if (to == "dm") {
            controller.text = (num / 10).toString();
            //checkAnswer(num, from, to);
          }
          if (to == "mm") {
            controller.text = (num * 10).toString();
            //checkAnswer(num, from, to);
          }
          break;
        case 'dm':
          if (to == "km") {
            controller.text = (num / 10000).toString();
            //checkAnswer(num, from, to);
          }
          if (to == "m") {
            controller.text = (num / 10).toString();
            //checkAnswer(num, from, to);
          }
          if (to == "cm") {
            controller.text = (num * 10).toString();
            //checkAnswer(num, from, to);
          }
          if (to == "mm") {
            controller.text = (num * 100).toString();
            //checkAnswer(num, from, to);
          }
          break;
        case 'm':
          if (to == "km") {
            controller.text = (num / 1000).toString();
            //checkAnswer(num, from, to);
          }
          if (to == "dm") {
            controller.text = (num * 10).toString();
            //checkAnswer(num, from, to);
          }
          if (to == "cm") {
            controller.text = (num * 100).toString();
            //checkAnswer(num, from, to);
          }
          if (to == "mm") {
            controller.text = (num * 1000).toString();
            //checkAnswer(num, from, to);
          }
          break;
        case 'km':
          if (to == "m") {
            controller.text = (num * 1000).toString();
            //checkAnswer(num, from, to);
          }
          if (to == "dm") {
            controller.text = (num * 10000).toString();
            //checkAnswer(num, from, to);
          }
          if (to == "cm") {
            controller.text = (num * 100000).toString();
            //checkAnswer(num, from, to);
          }
          if (to == "mm") {
            controller.text = (num * 1000000).toString();
            //checkAnswer(num, from, to);
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
          style:
              TextStyle(fontSize: screenHeight / 30, color: appState.fontColor),
          textAlign: TextAlign.left,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(
            top: screenHeight / 500,
            left: screenWidth / 43,
            right: screenWidth / 3.35),
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
                    style: TextStyle(fontSize: screenHeight / 31),
                  ))),
          SizedBox(
            width: screenWidth / 8,
          ),
          Text(
            numValue.toString(),
            style: TextStyle(
                fontSize: screenHeight / 18, color: appState.fontColor),
          ),
          SizedBox(
            width: screenWidth / 150,
          ),
          Text(
            values[valueFromIndex],
            style: TextStyle(
                fontSize: screenHeight / 18, color: appState.fontColor),
          ),
          SizedBox(
            width: screenWidth / 150,
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
                  fontSize: screenHeight / 50, color: appState.fontColor),
              alignLabelWithHint: true,
            ),
          )),
          SizedBox(
            width: screenWidth / 150,
          ),
          Text(
            values[valueToIndex],
            style: TextStyle(
                fontSize: screenHeight / 18, color: appState.fontColor),
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
                          MaterialStateProperty.all<Color>(Colors.white),
                      minimumSize: MaterialStateProperty.all<Size>(
                          Size.square(screenWidth / 35))),
                  onPressed: () {
                    setState(() {
                      completeSolution(numValue, values[valueFromIndex],
                          values[valueToIndex]);
                    });
                  },
                  child: Text('RJEŠENJE',
                      style: TextStyle(fontSize: screenHeight / 35)))),
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
              child: Text(
                'PROVJERI',
                style: TextStyle(fontSize: screenHeight / 35),
              )),
          SizedBox(
            height: screenHeight / 52,
          ),
        ],
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
