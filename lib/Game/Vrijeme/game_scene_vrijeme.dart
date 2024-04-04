import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import '../../app_state.dart';
import '../postavke_nav_bar_item.dart';
import '../../app_bar.dart';
import 'zadatci_vrijeme.dart';

class GameVrijeme extends StatefulWidget {
  final String title;
  final bool allSettingsVisible;
  const GameVrijeme(
      {super.key, required this.title, required this.allSettingsVisible});

  @override
  State<GameVrijeme> createState() => _GameVrijemeState();
}

class _GameVrijemeState extends State<GameVrijeme> {
  int selectedIndex = 0;
  late AppState appState;

  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [const ZadatciVrijeme(), const Postavke()];
  }

  void navigateBottomBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    appState = Provider.of<AppState>(context);
    return Scaffold(
      backgroundColor: appState.backgroundColor,
      resizeToAvoidBottomInset: false,
      body: pages[selectedIndex],
      appBar: AppBarCustom(
        title: widget.title,
        height: 100.0,
        imageShown: true,
        imagePath: 'assets/sat.png',
        imageWidth: 90,
        sizedBoxWidth: 640,
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
