import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_state.dart';

class ZadatciInformacije extends StatefulWidget {
  const ZadatciInformacije({super.key});

  @override
  State<ZadatciInformacije> createState() => _ZadatciInformacijeState();
}

class _ZadatciInformacijeState extends State<ZadatciInformacije> {
  final controller = TextEditingController();
  late AppState appState;

  int numValue = Random().nextInt(10) + 1;
  var values = ['B', "KB", "MB", "GB", "TB"];
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
    switch (appState.currentSliderValue) {
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
      case 'B':
        if (to == "KB") {
          return 1 / 100;
        }
        if (to == "MB") {
          return 1 / 1000000;
        }
        if (to == "GB") {
          return 1 / 1000000000;
        }
        if (to == "TB") {
          return 1 / 1000000000000;
        }
        break;
      case 'KB':
        if (to == "B") {
          return 100;
        }
        if (to == "MB") {
          return 1 / 100;
        }
        if (to == "GB") {
          return 1 / 1000000;
        }
        if (to == "TB") {
          return 1 / 1000000000;
        }
        break;
      case 'MB':
        if (to == "B") {
          return 1000000;
        }
        if (to == "KB") {
          return 1000;
        }
        if (to == "GB") {
          return 1 / 1000;
        }
        if (to == "TB") {
          return 1 / 1000000;
        }
        break;
      case 'GB':
        if (to == "B") {
          return 1000000000;
        }
        if (to == "KB") {
          return 1000000;
        }
        if (to == "MB") {
          return 1000;
        }
        if (to == "TB") {
          return 1 / 1000;
        }
        break;
      case 'TB':
        if (to == "B") {
          return 1000000000000;
        }
        if (to == "KB") {
          return 1000000000;
        }
        if (to == "MB") {
          return 1000000;
        }
        if (to == "GB") {
          return 1000;
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
        case 'B':
          if (to == "KB" && controller.text == (num / 100).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "MB" && controller.text == (num / 1000000).toString()) {
            isCorrect = true;
            valueFromIndex = Random().nextInt(5);
            valueToIndex = Random().nextInt(5);
            numValue = Random().nextInt(10) + 1;
            controller.clear();
          }
          if (to == "GB" && controller.text == (num / 1000000000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "TB" &&
              controller.text == (num / 1000000000000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          break;
        case 'KB':
          if (to == "B" && controller.text == (num * 100).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "MB" && controller.text == (num / 100).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "GB" && controller.text == (num / 1000000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "TB" && controller.text == (num / 1000000000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          break;
        case 'MB':
          if (to == "B" && controller.text == (num * 1000000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "KB" && controller.text == (num * 1000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "GB" && controller.text == (num / 1000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "TB" && controller.text == (num / 1000000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          break;
        case 'GB':
          if (to == "B" && controller.text == (num * 1000000000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "KB" && controller.text == (num * 1000000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "MB" && controller.text == (num * 1000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "TB" && controller.text == (num / 1000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          break;
        case 'TB':
          if (to == "B" &&
              controller.text == (num * 1000000000000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "KB" && controller.text == (num * 1000000000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "MB" && controller.text == (num * 1000000).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "GB" && controller.text == (num * 1000).toString()) {
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
        case 'B':
          if (to == "KB") {
            controller.text = (num / 100).toString();
          }
          if (to == "MB") {
            controller.text = (num / 1000000).toString();
          }
          if (to == "GB") {
            controller.text = (num / 1000000000).toString();
          }
          if (to == "TB") {
            controller.text = (num / 1000000000000).toString();
          }
          break;
        case 'KB':
          if (to == "B") {
            controller.text = (num * 100).toString();
          }
          if (to == "MB") {
            controller.text = (num / 100).toString();
          }
          if (to == "GB") {
            controller.text = (num / 1000000).toString();
          }
          if (to == "TB") {
            controller.text = (num / 1000000000).toString();
          }
          break;
        case 'MB':
          if (to == "B") {
            controller.text = (num * 1000000).toString();
          }
          if (to == "KB") {
            controller.text = (num * 1000).toString();
          }
          if (to == "GB") {
            controller.text = (num / 1000).toString();
          }
          if (to == "TB") {
            controller.text = (num / 1000000).toString();
          }
          break;
        case 'GB':
          if (to == "B") {
            controller.text = (num * 1000000000).toString();
          }
          if (to == "KB") {
            controller.text = (num * 1000000).toString();
          }
          if (to == "MB") {
            controller.text = (num * 1000).toString();
          }
          if (to == "TB") {
            controller.text = (num / 1000).toString();
          }
          break;
        case 'TB':
          if (to == "B") {
            controller.text = (num * 1000000000000).toString();
          }
          if (to == "KB") {
            controller.text = (num * 1000000000).toString();
          }
          if (to == "MB") {
            controller.text = (num * 1000000).toString();
          }
          if (to == "GB") {
            controller.text = (num * 1000).toString();
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
        padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
        child: Text(
          "Preračunaj mjeru s lijeve strane crte u mjeru s desne strane crte. Zatim odgovor upiši na crtu 'Unesite rješenje'! Zatim svoj odgovor provjeri klikom na gumb 'PROVJERI'!",
          style:
              TextStyle(fontSize: screenHeight / 25, color: appState.fontColor),
          textAlign: TextAlign.left,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(
            top: screenHeight / 15,
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
                fontSize: screenHeight / 15, color: appState.fontColor),
          ),
          SizedBox(
            width: screenWidth / 150,
          ),
          Text(
            values[valueFromIndex],
            style: TextStyle(
                fontSize: screenHeight / 15, color: appState.fontColor),
          ),
          SizedBox(
            width: screenWidth / 150,
          ),
          Expanded(
              child: TextField(
            style: TextStyle(
                fontSize: screenHeight / 35, color: appState.fontColor),
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
                fontSize: screenHeight / 15, color: appState.fontColor),
          )
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
          SizedBox(
            width: screenWidth / 150,
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
      SizedBox(
        height: screenHeight / 22,
      ),
      Padding(
        padding:
            EdgeInsets.only(right: screenWidth / 1.5, left: screenWidth / 100),
        child: Visibility(
            visible: appState.postupakShown,
            child: Container(
              width: double.maxFinite,
              color: const Color.fromARGB(255, 232, 196, 80),
              child: Text(
                '1 ${values[valueFromIndex]} = ${setUnitTo(values[valueFromIndex], values[valueToIndex]).toString().replaceAll(RegExp(r'([.]*0)(?!.*\d)'), '')} ${values[valueToIndex]}\n$numValue ${values[valueFromIndex]} = ($numValue \u2022 ${setUnitTo(values[valueFromIndex], values[valueToIndex]).toString().replaceAll(RegExp(r'([.]*0)(?!.*\d)'), '')}) ${values[valueToIndex]}',
                style: TextStyle(fontSize: screenHeight / 25),
                textAlign: TextAlign.center,
              ),
            )),
      )
    ]);
  }
}
