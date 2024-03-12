import 'package:flutter/material.dart';
import 'bottom_app_bar.dart';

class GameBody extends StatelessWidget {
  const GameBody({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        bottomNavigationBar: BottomAppBarCustom(),
        body: Text('Masa/duljina/vrijeme'));
  }
}
