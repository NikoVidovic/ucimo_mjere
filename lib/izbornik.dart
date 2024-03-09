import 'package:flutter/material.dart';
import 'package:hello_world/main.dart';
import 'package:hello_world/o_aplikaciji.dart';
import 'izbornik_button.dart';

class Izbornik extends StatelessWidget {
  const Izbornik({super.key});
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(
            title: Row(
              children: [
                Image.asset(
                  'assets/ic_launcher.png',
                  height: 60,
                  width: 60,
                ),
                Container(
                    margin: const EdgeInsets.only(left: 35.0),
                    child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Učimo mjere',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 30)),
                          Text(
                            'pretvaranje mjernih jedinica',
                            style: TextStyle(color: Colors.black, fontSize: 17),
                          )
                        ]))
              ],
            ),
            toolbarHeight: 200,
            backgroundColor: const Color.fromARGB(255, 244, 188, 66)),
        body: const Column(
          children: [
            IzbornikButton(
                ikona: Icon(Icons.apps),
                title: 'Izbornik',
                route: MainMenu(),
                boja: Colors.black),
            IzbornikButton(
                ikona: Icon(Icons.error),
                title: 'O aplikaciji',
                route: OAplikaciji(),
                boja: Colors.black),
            IzbornikButton(
                ikona: Icon(Icons.email),
                title: 'Prijavi problem',
                route: MainMenu(),
                boja: Colors.black)
          ],
        )));
  }
}
