import 'package:flutter/material.dart';

class GameBody extends StatelessWidget {
  const GameBody({super.key});
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Duljina/vrijeme/temperatura',
          style: TextStyle(fontSize: 40),
        )
      ],
    );
  }
}
