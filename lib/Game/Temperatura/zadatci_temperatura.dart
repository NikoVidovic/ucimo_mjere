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
      OutlinedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(255, 22, 56, 74)),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white)),
          onPressed: () {
            checkAnswer(numValue, values[valueFromIndex], values[valueToIndex]);
          },
          child: const Text('PROVJERI')),
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
                '1 ${values[valueFromIndex]} = ${setUnitTo(values[valueFromIndex], values[valueToIndex]).toString().replaceAll(RegExp(r'([.]*0)(?!.*\d)'), '')} ${values[valueToIndex]}\n$numValue ${values[valueFromIndex]} = ($numValue + ${setUnitTo(values[valueFromIndex], values[valueToIndex]).toString().replaceAll(RegExp(r'([.]*0)(?!.*\d)'), '')}) ${values[valueToIndex]}',
                style: const TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
            )),
      )
    ]);
  }
}
