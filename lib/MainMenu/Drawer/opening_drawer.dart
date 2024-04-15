import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../app_state.dart';
import '../main_menu.dart';
import '/MainMenu/Drawer/o_aplikaciji.dart';
import 'drawer_button.dart';

class Izbornik extends StatefulWidget {
  const Izbornik({super.key});

  @override
  State<Izbornik> createState() => _IzbornikState();
}

class _IzbornikState extends State<Izbornik> {
  late AppState appState;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    appState = Provider.of<AppState>(context);
    return (Scaffold(
        backgroundColor: appState.backgroundColor,
        appBar: AppBar(
            title: Row(
              children: [
                Image.asset(
                  'assets/ic_launcher.png',
                  height: screenHeight / 5,
                  width: screenWidth / 17,
                ),
                Container(
                    margin: EdgeInsets.only(left: screenWidth / 30),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Učimo mjere',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize:
                                      screenHeight / 25 * appState.fontSize)),
                          Text(
                            'pretvaranje mjernih jedinica',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize:
                                    screenHeight / 45 * appState.fontSize),
                          )
                        ]))
              ],
            ),
            toolbarHeight: screenHeight / 3.7,
            backgroundColor: const Color.fromARGB(255, 244, 188, 66)),
        body: Column(
          children: [
            IzbornikButton(
                ikona: const Icon(Icons.apps),
                title: 'Izbornik',
                route: const MainMenu(),
                boja: appState.fontColor),
            IzbornikButton(
                ikona: const Icon(Icons.error),
                title: 'O aplikaciji',
                route: const OAplikaciji(),
                boja: appState.fontColor),
            IzbornikButton(
                ikona: const Icon(Icons.email),
                title: 'Prijavi problem',
                route: const MainMenu(),
                boja: appState.fontColor)
          ],
        )));
  }
}
