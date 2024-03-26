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

  void checkAnswer(int num, String from, String to) {
    setState(() {
      switch (from) {
        case 'ms':
          if (to == "s" && controller.text == (num / 1000).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "min" &&
              controller.text == ((num / 1000) / 60).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "h" &&
              controller.text == (((num / 1000) / 60) / 60).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "dan" &&
              controller.text == ((((num / 1000) / 60) / 60) / 24).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          break;
        case 's':
          if (to == "ms" && controller.text == (num * 1000).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "min" && controller.text == (num / 60).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "h" && controller.text == ((num / 60) / 60).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "dan" &&
              controller.text == (((num / 60) / 60) / 24).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          break;
        case 'min':
          if (to == "ms" && controller.text == (num * 60000).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "s" && controller.text == (num * 60).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "h" && controller.text == (num / 60).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "dan" && controller.text == ((num / 60) / 24).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          break;
        case 'h':
          if (to == "ms" && controller.text == (num * 3600000).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "s" && controller.text == (num * 3600).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "min" && controller.text == (num * 60).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "dan" && controller.text == (num / 24).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          break;
        case 'dan':
          if (to == "ms" && controller.text == (num * 86400000).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "s" && controller.text == (num * 86400).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "min" && controller.text == (num * 1440).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "h" && controller.text == (num * 24).toString()) {
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
