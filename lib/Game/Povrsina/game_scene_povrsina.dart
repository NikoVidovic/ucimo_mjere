import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import '../../app_state.dart';
import '../postavke_nav_bar_item.dart';
import '../../app_bar.dart';
import 'zadatci_povrsina.dart';

class GamePovrsina extends StatefulWidget {
  final String title;
  final bool allSettingsVisible;
  const GamePovrsina(
      {super.key, required this.title, required this.allSettingsVisible});

  @override
  State<GamePovrsina> createState() => _GamePovrsinaState();
}

class _GamePovrsinaState extends State<GamePovrsina> {
  int selectedIndex = 0;
  late AppState appState;

  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [const ZadatciPovrsina(), Postavke(switchToTab: navigateBottomBar)];
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
        imagePath: 'assets/kategorija2.png',
        imageWidth: screenWidth / 17,
        sizedBoxWidth: screenWidth / 2.25,
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
                    textSize: screenHeight / 30,
                    text: 'Zadatci'),
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
