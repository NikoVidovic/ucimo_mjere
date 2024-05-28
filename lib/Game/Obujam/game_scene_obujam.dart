import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hello_world/Game/Obujam/postavke_obujam.dart';
import 'package:provider/provider.dart';
import '../../app_state.dart';
import '../../app_bar.dart';
import 'zadatci_obujam.dart';

class GameObujam extends StatefulWidget {
  final String title;
  final bool allSettingsVisible;
  const GameObujam(
      {super.key, required this.title, required this.allSettingsVisible});

  @override
  State<GameObujam> createState() => _GameObujamState();
}

class _GameObujamState extends State<GameObujam> {
  int selectedIndex = 0;
  late AppState appState;

  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      const ZadatciObujam(),
      PostavkeObujam(switchToTab: navigateBottomBar)
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
    return Stack(children: [
      Scaffold(
        backgroundColor: appState.backgroundColor,
        resizeToAvoidBottomInset: false,
        body: pages[selectedIndex],
        appBar: AppBarCustom(
          title: widget.title,
          height: screenHeight / 8,
          imageShown: true,
          imagePath: 'assets/kategorija3.png',
          imageWidth: screenWidth / 20,
          sizedBoxWidth: screenWidth / 2.1,
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
      ),
      if (appState.animationGoing)
        Positioned.fill(
          child: AbsorbPointer(
            absorbing: true,
            child: Container(
              color: Colors.transparent, // Fully transparent
            ),
          ),
        ),
    ]);
  }
}
