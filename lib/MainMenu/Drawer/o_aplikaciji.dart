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
    appState = Provider.of<AppState>(context);
    return (Scaffold(
        backgroundColor: appState.backgroundColor,
        appBar: const AppBarCustom(
          title: 'O aplikaciji',
          height: 65.5,
          imageShown: false,
          imagePath: '',
          imageWidth: 0,
          sizedBoxWidth: 900,
        ),
        drawer: const SizedBox(
          width: 500,
          child: Drawer(
            child: Izbornik(),
          ),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Container(
                margin: const EdgeInsets.only(left: 60.0, top: 60.0),
                child: Image.asset(
                  'assets/ic_launcher.png',
                  height: 60,
                  width: 60,
                )),
            Container(
                margin: const EdgeInsets.only(top: 60.0, left: 10.0),
                child: Text(
                  'Učimo mjere',
                  style: TextStyle(fontSize: 40, color: appState.fontColor),
                ))
          ]),
          Container(
            margin: const EdgeInsets.only(top: 10.0, left: 60.0),
            child: Text('Ovo je tekst o aplikaciji',
                style: TextStyle(fontSize: 20, color: appState.fontColor)),
          )
        ])));
  }
}
