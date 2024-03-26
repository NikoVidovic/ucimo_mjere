import 'dart:math';
import 'package:flutter/material.dart';

class ZadatciTemperatura extends StatefulWidget {
  const ZadatciTemperatura({super.key});

  @override
  State<ZadatciTemperatura> createState() => _ZadatciTemperaturaState();
}

class _ZadatciTemperaturaState extends State<ZadatciTemperatura> {
  final controller = TextEditingController();

  int numValue = Random().nextInt(200) + 1;
  var values = ['C', "K"];
  var valueFromIndex = Random().nextInt(2);
  var valueToIndex = Random().nextInt(2);

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void checkAnswer(int num, String from, String to) {
    setState(() {
      switch (from) {
        case 'K':
          if (to == "C" && controller.text == (num - 273.15).toString()) {
            valueFromIndex = Random().nextInt(2);
            valueToIndex = Random().nextInt(2);
            numValue = Random().nextInt(200) + 1;
            controller.clear();
          }
          break;
        case 'C':
          if (to == "K" && controller.text == (num + 273.15).toString()) {
            valueFromIndex = Random().nextInt(2);
            valueToIndex = Random().nextInt(2);
            numValue = Random().nextInt(200) + 1;
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
