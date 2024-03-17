import 'package:flutter/material.dart';

class AnswerInputDuljina extends StatefulWidget {
  final String title;
  const AnswerInputDuljina({super.key, required this.title});

  @override
  State<AnswerInputDuljina> createState() => _AnswerInputDuljinaState();
}

class _AnswerInputDuljinaState extends State<AnswerInputDuljina> {
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
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(top: 70, left: 90, right: 90),
        child: Text(
          widget.title,
          style: const TextStyle(fontSize: 50),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 390, right: 390),
        child: Row(children: [
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
      ),
      OutlinedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(255, 22, 56, 74)),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white)),
          onPressed: checkAnswer,
          child: const Text('PROVJERI'))
    ]);
  }
}
