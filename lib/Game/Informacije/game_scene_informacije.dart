import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import '../../app_state.dart';
import '../postavke_nav_bar_item.dart';
import '../../app_bar.dart';
import 'zadatci_informacije.dart';

class GameInformacije extends StatefulWidget {
  final String title;
  final bool allSettingsVisible;
  const GameInformacije(
      {super.key, required this.title, required this.allSettingsVisible});

  @override
  State<GameInformacije> createState() => _GameInformacijeState();
}

class _GameInformacijeState extends State<GameInformacije> {
  int selectedIndex = 0;
  late AppState appState;

  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [const ZadatciInformacije(), const Postavke()];
  }

  void navigateBottomBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    appState = Provider.of<AppState>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: appState.backgroundColor,
      resizeToAvoidBottomInset: false,
      body: pages[selectedIndex],
      appBar: AppBarCustom(
        title: widget.title,
        height: screenHeight / 8,
        imageShown: true,
        imagePath: 'assets/kategorija5.png',
        imageWidth: screenWidth / 17,
        sizedBoxWidth: screenHeight / 1.8,
      ),
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 22, 56, 74),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth / 3.5, vertical: screenHeight / 57),
          child: GNav(
              backgroundColor: const Color.fromARGB(255, 22, 56, 74),
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: const Color.fromARGB(255, 77, 134, 165),
              gap: 8,
              padding: EdgeInsets.all(screenHeight / 50),
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
