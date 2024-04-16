import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_state.dart';

class ZadatciTemperatura extends StatefulWidget {
  const ZadatciTemperatura({super.key});

  @override
  State<ZadatciTemperatura> createState() => _ZadatciTemperaturaState();
}

class _ZadatciTemperaturaState extends State<ZadatciTemperatura> {
  final controller = TextEditingController();
  late AppState appState;

  int numValue = Random().nextInt(200) + 1;
  var values = ['C', "K"];
  int valueFromIndex = 0;
  int valueToIndex = 1;
  int kelvin = 300;
  int celsius = 100;

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
    switch (appState.currentSliderValue) {
      case 1:
      case 2:
        celsius = 100;
        kelvin = 300;
        numValue = (valueFromIndex == 1)
            ? Random().nextInt(kelvin)
            : Random().nextInt(celsius);
        break;
      case 3:
      case 4:
      default:
        celsius = (300 - 273.15).toInt();
        kelvin = 400;
        valueFromIndex = Random().nextInt(values.length);
        valueToIndex = (valueFromIndex + 1) % values.length;
        numValue = (valueFromIndex == 1)
            ? Random().nextInt(kelvin)
            : Random().nextInt(celsius);
        break;
    }
  }

  double setUnitTo(String from, String to) {
    switch (from) {
      case 'K':
        if (to == "C") {
          return -273.15;
        }
        break;
      case 'C':
        if (to == "K") {
          //plus
          return 273.15;
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
        case 'K':
          if (to == "C" && controller.text == (num - 273.15).toString()) {
            isCorrect = true;
            generateIndexAndNumber();
            controller.clear();
          }
          break;
        case 'C':
          if (to == "K" && controller.text == (num + 273.15).toString()) {
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
        case 'K':
          if (to == "C") {
            controller.text = (num - 273.15).toString();
          }
          break;
        case 'C':
          if (to == "K") {
            controller.text = (num + 273.15).toString();
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
                  '1 ${values[valueFromIndex]} = ${setUnitTo(values[valueFromIndex], values[valueToIndex]).toString().replaceAll(RegExp(r'([.]*0)(?!.*\d)'), '')} ${values[valueToIndex]}\n$numValue ${values[valueFromIndex]} = ($numValue + ${setUnitTo(values[valueFromIndex], values[valueToIndex]).toString().replaceAll(RegExp(r'([.]*0)(?!.*\d)'), '')}) ${values[valueToIndex]}',
                  style: TextStyle(fontSize: screenHeight / 25),
                  textAlign: TextAlign.left,
                ),
              ),
            )),
      )
    ]);
  }
}
