import 'package:flutter/material.dart';
import 'package:hello_world/app_bar.dart';
import 'package:provider/provider.dart';

import '../../app_state.dart';
import 'opening_drawer.dart';

class OAplikaciji extends StatefulWidget {
  const OAplikaciji({super.key});

  @override
  State<OAplikaciji> createState() => _OAplikacijiState();
}

class _OAplikacijiState extends State<OAplikaciji> {
  late AppState appState;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    appState = Provider.of<AppState>(context);
    return (Scaffold(
        backgroundColor: appState.backgroundColor,
        appBar: AppBarCustom(
          title: 'O aplikaciji',
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
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Container(
                margin: EdgeInsets.only(
                    left: screenWidth / 20, top: screenHeight / 18),
                child: Image.asset(
                  'assets/ic_launcher.png',
                  height: screenHeight / 11,
                  width: screenWidth / 20,
                )),
            Container(
                margin: EdgeInsets.only(
                    top: screenHeight / 15, left: screenWidth / 70),
                child: Text(
                  'Učimo mjere',
                  style: TextStyle(
                      fontSize: screenWidth / 30, color: appState.fontColor),
                ))
          ]),
          Container(
            margin:
                EdgeInsets.only(top: screenHeight / 75, left: screenWidth / 20),
            child: Text('Ovo je tekst o aplikaciji',
                style: TextStyle(
                    fontSize: screenHeight / 38, color: appState.fontColor)),
          )
        ])));
  }
}
