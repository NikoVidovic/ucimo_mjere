import 'package:flutter/material.dart';

import 'game.dart';
import 'izbornik_button.dart';
import 'postavke.dart';

class BottomAppBarCustom extends StatelessWidget {
  const BottomAppBarCustom({super.key});
  @override
  Widget build(BuildContext context) {
    return const BottomAppBar(
      color: Color.fromARGB(255, 22, 56, 74),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IzbornikButton(
              ikona: Icon(Icons.videogame_asset),
              title: 'Zadatci',
              route: Game(),
              boja: Colors.white),
          IzbornikButton(
              ikona: Icon(Icons.settings),
              title: 'Postavke',
              route: Postavke(),
              boja: Colors.white)
        ],
      ),
    );
  }
}
