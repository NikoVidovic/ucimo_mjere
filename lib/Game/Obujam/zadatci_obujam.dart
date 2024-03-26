import 'dart:math';
import 'package:flutter/material.dart';

class ZadatciObujam extends StatefulWidget {
  const ZadatciObujam({super.key});

  @override
  State<ZadatciObujam> createState() => _ZadatciObujamState();
}

class _ZadatciObujamState extends State<ZadatciObujam> {
  final controller = TextEditingController();

  int numValue = Random().nextInt(10) + 1;
  var values = ['mm', "cm", "dm", "m", "km"];
  int valueFromIndex = 0;
  int valueToIndex = 0;

  @override
  void initState() {
    super.initState();
    generateIndexAndNumber();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void generateIndexAndNumber() {
    valueFromIndex = Random().nextInt(5);
    valueToIndex = Random().nextInt(5);
    numValue = Random().nextInt(10) + 1;
  }

  void checkAnswer(int num, String from, String to) {
    setState(() {
      switch (from) {
        case 'mm':
          if (to == "cm" && controller.text == (num / 1000).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "dm" && controller.text == (num / 1000000).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "m" && controller.text == (num / 1000000000).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "km" &&
              controller.text == (num / 1000000000000000000).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          break;
        case 'cm':
          if (to == "mm" && controller.text == (num * 1000).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "dm" && controller.text == (num / 1000).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "m" && controller.text == (num / 1000000).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "km" &&
              controller.text == (num * 1000000000000000).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          break;
        case 'dm':
          if (to == "mm" && controller.text == (num * 1000000).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "cm" && controller.text == (num * 1000).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "m" && controller.text == (num / 1000).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "km" &&
              controller.text == (num / 1000000000000).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          break;
        case 'm':
          if (to == "mm" && controller.text == (num * 1000000000).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "cm" && controller.text == (num * 1000000).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "dm" && controller.text == (num * 1000).toString()) {
            valueFromIndex = Random().nextInt(5);
            valueToIndex = Random().nextInt(5);
            numValue = Random().nextInt(10) + 1;
            controller.clear();
          }
          if (to == "km" && controller.text == (num / 1000000000).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          break;
        case 'km':
          if (to == "mm" &&
              controller.text == (num * 1000000000000000000).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "cm" &&
              controller.text == (num * 1000000000000000).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "dm" &&
              controller.text == (num * 1000000000000).toString()) {
            generateIndexAndNumber();
            controller.clear();
          }
          if (to == "m" && controller.text == (num * 1000000).toString()) {
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
          const Padding(
              padding: EdgeInsets.only(bottom: 32.0),
              child: Text(
                '3',
                style: TextStyle(fontSize: 30),
              )),
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
          ),
          const Padding(
              padding: EdgeInsets.only(bottom: 32.0),
              child: Text(
                '3',
                style: TextStyle(fontSize: 30),
              ))
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
