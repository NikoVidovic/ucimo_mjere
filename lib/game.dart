import 'package:flutter/material.dart';

import 'game_body.dart';

class Game extends StatelessWidget {
  const Game({super.key});
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            title: const Text('Učimo mjere',
                style: TextStyle(color: Colors.white)),
            toolbarHeight: 100,
            backgroundColor: const Color.fromARGB(255, 22, 56, 74)),
        body: GameBody()));
  }
}
