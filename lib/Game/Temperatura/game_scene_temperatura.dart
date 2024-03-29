import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../postavke_nav_bar_item.dart';
import '../../app_bar.dart';
import 'zadatci_temperatura.dart';

class GameTemperatura extends StatefulWidget {
  final String title;
  final bool allSettingsVisible;
  const GameTemperatura(
      {super.key, required this.title, required this.allSettingsVisible});

  @override
  State<GameTemperatura> createState() => _GameTemperaturaState();
}

class _GameTemperaturaState extends State<GameTemperatura> {
  int selectedIndex = 0;

  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [const ZadatciTemperatura(), const Postavke()];
  }

  void navigateBottomBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: pages[selectedIndex],
      appBar: AppBarCustom(
        title: widget.title,
        height: 100.0,
        imageShown: true,
        imagePath: 'assets/kategorija4.png',
        imageWidth: 60,
      ),
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
                GButton(icon: Icons.settings, text: 'Prilagodba zadataka')
              ]),
        ),
      ),
    );
  }
}
