import 'package:flutter/material.dart';
import 'app_bar.dart';
import 'bottom_app_bar.dart';

class Game extends StatelessWidget {
  const Game({super.key}); //Učimo mjere, 100
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: AppBarCustom(title: 'Učimo mjere', height: 100.0),
        bottomNavigationBar: BottomAppBarCustom(),
        body: AnswerInput());
  }
}

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

  void changeText(text) {
    setState(() {
      this.text = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(labelText: 'Unesite rješenje'),
        onChanged: (text) => changeText(text),
      ),
      Text(text)
    ]);
  }
}
