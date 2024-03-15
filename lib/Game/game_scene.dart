import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../app_bar.dart';
import 'postavke_nav_bar_item.dart';
import 'zadatci_nav_bar_item.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
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
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 22, 56, 74),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 400.0, vertical: 10),
          child: GNav(
              backgroundColor: const Color.fromARGB(255, 22, 56, 74),
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: const Color.fromARGB(255, 77, 134, 165),
              gap: 8,
              padding: const EdgeInsets.all(16),
              onTabChange: (index) {
                navigateBottomBar(index);
              },
              tabs: const [
                GButton(icon: Icons.videogame_asset, text: 'Zadatci'),
                GButton(icon: Icons.settings, text: 'Postavke')
              ]),
        ),
      ),
    );
  }
}
