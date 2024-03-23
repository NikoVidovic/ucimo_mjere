import 'package:flutter/material.dart';
import 'package:hello_world/Game/game_scene.dart';
import '../app_bar.dart';
import './Drawer/opening_drawer.dart';
import 'main_button.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: AppBarCustom(title: 'Učimo mjere', height: 65.0),
        drawer: SizedBox(
          width: 500,
          child: Drawer(
            child: Izbornik(),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            MainButton(
              naziv: 'Mjerne jedinice za duljinu',
              boja: Color.fromARGB(255, 232, 196, 80),
              imagePath: 'assets/kategorija1.png',
              route: Game(
                title: 'Mjerne jedinice za duljinu',
                allSettingsVisible: true,
              ),
            ),
            MainButton(
              naziv: 'Mjerne jedinice za masu',
              boja: Color.fromARGB(255, 17, 134, 209),
              imagePath: 'assets/kategorija5.png',
              route: Game(
                title: 'Mjerne jedinice za količinu informacija',
                allSettingsVisible: false,
              ),
            ),
            MainButton(
              naziv: 'Mjerne jedinice za vrijeme',
              boja: Color.fromARGB(255, 17, 134, 209),
              imagePath: 'assets/kategorija5.png',
              route: Game(
                title: 'Mjerne jedinice za količinu informacija',
                allSettingsVisible: false,
              ),
            ),
            MainButton(
              naziv: 'Mjerne jedinice za površinu',
              boja: Color.fromARGB(255, 126, 55, 108),
              imagePath: 'assets/kategorija2.png',
              route: Game(
                title: 'Mjerne jedinice za površinu',
                allSettingsVisible: false,
              ),
            ),
            MainButton(
              naziv: 'Mjerne jedinice za obujam',
              boja: Color.fromARGB(255, 34, 194, 190),
              imagePath: 'assets/kategorija3.png',
              route: Game(
                title: 'Mjerne jedinice za obujam',
                allSettingsVisible: false,
              ),
            ),
            MainButton(
              naziv: 'Mjerne jedinice za temperaturu',
              boja: Color.fromARGB(255, 246, 78, 81),
              imagePath: 'assets/kategorija4.png',
              route: Game(
                title: 'Mjerne jedinice za temperaturu',
                allSettingsVisible: false,
              ),
            ),
            MainButton(
              naziv: 'Mjerne jedinice za količinu informacija',
              boja: Color.fromARGB(255, 17, 134, 209),
              imagePath: 'assets/kategorija5.png',
              route: Game(
                title: 'Mjerne jedinice za količinu informacija',
                allSettingsVisible: false,
              ),
            )
          ],
        )));
  }
}
