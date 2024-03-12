import 'package:flutter/material.dart';
import 'app_bar.dart';
import 'game_body.dart';

class Game extends StatelessWidget {
  const Game({super.key}); //Učimo mjere, 100
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: AppBarCustom(title: 'Učimo mjere', height: 100.0),
        body: GameBody());
  }
}
