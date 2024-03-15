import 'package:flutter/material.dart';

class AnswerInput extends StatefulWidget {
  const AnswerInput({super.key});

  @override
  State<AnswerInput> createState() => _AnswerInputState();
}

class _AnswerInputState extends State<AnswerInput> {
  final controller = TextEditingController();
  String text = "";

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void checkAnswer() {
    setState(() {
      controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 70, left: 390, right: 390, bottom: 300),
      child: Column(children: [
        const Text(
          'Duljina',
          style: TextStyle(fontSize: 50),
        ),
        Row(children: [
          const Text(
            '25 dm',
            style: TextStyle(fontSize: 50),
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
          const Text(
            'm',
            style: TextStyle(fontSize: 50),
          )
        ]),
        OutlinedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 22, 56, 74)),
                foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.white)),
            onPressed: checkAnswer,
            child: const Text('PROVJERI'))
      ]),
    );
  }
}
