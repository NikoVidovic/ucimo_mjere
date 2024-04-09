import 'package:flutter/material.dart';
import 'package:hello_world/Game/Duljina/game_scene_duljina.dart';
import 'package:provider/provider.dart';
import '../Game/Informacije/game_scene_informacije.dart';
import '../Game/Masa/game_scene_masa.dart';
import '../Game/Obujam/game_scene_obujam.dart';
import '../Game/Povrsina/game_scene_povrsina.dart';
import '../Game/Temperatura/game_scene_temperatura.dart';
import '../Game/Vrijeme/game_scene_vrijeme.dart';
import '../app_bar.dart';
import '../app_state.dart';
import './Drawer/opening_drawer.dart';
import 'main_button.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  late AppState appState;
  @override
  Widget build(BuildContext context) {
    appState = Provider.of<AppState>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: appState.backgroundColor,
        resizeToAvoidBottomInset: false,
        appBar: AppBarCustom(
          title: 'Učimo mjere',
          height: screenHeight / 9,
          imageShown: false,
          imagePath: '',
          imageWidth: 0,
          sizedBoxWidth: screenWidth / 1.55,
        ),
        drawer: SizedBox(
          width: screenWidth / 2.5,
          child: const Drawer(
            child: Izbornik(),
          ),
        ),
        body: const Row(children: [
          Column(
            children: [
              MainButton(
                naziv: 'Mjerne jedinice za duljinu',
                boja: Color.fromARGB(255, 232, 196, 80),
                imagePath: 'assets/kategorija1.png',
                route: GameDuljina(
                  title: 'Mjerne jedinice za duljinu',
                  allSettingsVisible: true,
                ),
              ),
              MainButton(
                naziv: 'Mjerne jedinice za masu',
                boja: Colors.green,
                imagePath: 'assets/vaga.png',
                route: GameMasa(
                  title: 'Mjerne jedinice za masu',
                  allSettingsVisible: false,
                ),
              ),
              MainButton(
                naziv: 'Mjerne jedinice za vrijeme',
                boja: Colors.teal,
                imagePath: 'assets/sat.png',
                route: GameVrijeme(
                  title: 'Mjerne jedinice za vrijeme',
                  allSettingsVisible: false,
                ),
              ),
              MainButton(
                naziv: 'Mjerne jedinice za površinu',
                boja: Color.fromARGB(255, 126, 55, 108),
                imagePath: 'assets/kategorija2.png',
                route: GamePovrsina(
                  title: 'Mjerne jedinice za površinu',
                  allSettingsVisible: false,
                ),
              ),
            ],
          ),
          Column(
            children: [
              MainButton(
                naziv: 'Mjerne jedinice za obujam',
                boja: Color.fromARGB(255, 34, 194, 190),
                imagePath: 'assets/kategorija3.png',
                route: GameObujam(
                  title: 'Mjerne jedinice za obujam',
                  allSettingsVisible: false,
                ),
              ),
              MainButton(
                naziv: 'Mjerne jedinice za\ntemperaturu',
                boja: Color.fromARGB(255, 246, 78, 81),
                imagePath: 'assets/kategorija4.png',
                route: GameTemperatura(
                  title: 'Mjerne jedinice za temperaturu',
                  allSettingsVisible: false,
                ),
              ),
              MainButton(
                naziv: 'Mjerne jedinice za\nkoličinu informacija',
                boja: Color.fromARGB(255, 17, 134, 209),
                imagePath: 'assets/kategorija5.png',
                route: GameInformacije(
                  title: 'Mjerne jedinice za količinu informacija',
                  allSettingsVisible: false,
                ),
              )
            ],
          ),
        ]));
  }
}
