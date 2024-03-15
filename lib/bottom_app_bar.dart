import 'package:flutter/material.dart';
import 'app_bar.dart';
import 'postavke.dart';
import 'zadatci_nav_bar_item.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _BottomNavBarCustomState();
}

class _BottomNavBarCustomState extends State<Game> {
  int selectedIndex = 0;

  final List<Widget> pages = [const AnswerInput(), const Postavke()];

  void navigateBottomBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      appBar: const AppBarCustom(title: 'Učimo mjere', height: 100.0),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: navigateBottomBar,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.videogame_asset), label: 'Zadatci'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Postavke')
          ]),
    );
  }
}
