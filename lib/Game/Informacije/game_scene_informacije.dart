import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import '../../app_state.dart';
import '../../app_bar.dart';
import 'postavke_informacije.dart';
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
    pages = [
      const ZadatciInformacije(),
      PostavkeInformacije(switchToTab: navigateBottomBar)
    ];
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
        sizedBoxWidth: screenHeight / 1.75,
        infoShown: false,
        settingsShown: true,
      ),
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 22, 56, 74),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth / 3.5, vertical: screenHeight / 57),
          child: GNav(
              selectedIndex: selectedIndex,
              backgroundColor: const Color.fromARGB(255, 22, 56, 74),
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: const Color.fromARGB(255, 77, 134, 165),
              gap: 8,
              padding: EdgeInsets.all(screenHeight / 50),
              onTabChange: (index) {
                navigateBottomBar(index);
              },
              tabs: [
                GButton(
                  icon: Icons.videogame_asset,
                  iconSize: screenWidth / 45,
                  text: 'Zadatci',
                  textSize: screenHeight / 30,
                ),
                GButton(
                  icon: Icons.key_outlined,
                  iconSize: screenWidth / 45,
                  text: 'Prilagodba zadataka',
                  textSize: screenHeight / 30,
                )
              ]),
        ),
      ),
    );
  }
}
