import 'package:flutter/material.dart';
import 'package:hello_world/app_bar.dart';

import 'izbornik.dart';

class OAplikaciji extends StatelessWidget {
  const OAplikaciji({super.key});
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: const AppBarCustom(title: 'O aplikaciji', height: 65.5),
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
                child: const Text(
                  'Učimo mjere',
                  style: TextStyle(fontSize: 40),
                ))
          ]),
          Container(
            margin: const EdgeInsets.only(top: 10.0, left: 60.0),
            child: const Text('Ovo je tekst o aplikaciji',
                style: TextStyle(fontSize: 20)),
          )
        ])));
  }
}
