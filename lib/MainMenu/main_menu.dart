import 'package:flutter/material.dart';
import 'package:hello_world/Game/Duljina/game_scene_duljina.dart';
import '../Game/Informacije/game_scene_informacije.dart';
import '../Game/Masa/game_scene_masa.dart';
import '../Game/Obujam/game_scene_obujam.dart';
import '../Game/Povrsina/game_scene_povrsina.dart';
import '../Game/Temperatura/game_scene_temperatura.dart';
import '../Game/Vrijeme/game_scene_vrijeme.dart';
import '../app_bar.dart';
import './Drawer/opening_drawer.dart';
import 'main_button.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBarCustom(
          title: 'Učimo mjere',
          height: 85.0,
          imageShown: false,
          imagePath: '',
          imageWidth: 0,
        ),
        drawer: SizedBox(
          width: 500,
          child: Drawer(
            child: Izbornik(),
          ),
        ),
        body: Row(children: [
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
                naziv: 'Mjerne jedinice za temperaturu',
                boja: Color.fromARGB(255, 246, 78, 81),
                imagePath: 'assets/kategorija4.png',
                route: GameTemperatura(
                  title: 'Mjerne jedinice za temperaturu',
                  allSettingsVisible: false,
                ),
              ),
              MainButton(
                naziv: 'Mjerne jedinice za količinu informacija',
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
