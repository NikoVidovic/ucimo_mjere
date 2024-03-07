import 'package:flutter/material.dart';

import 'izbornik.dart';

class OAplikaciji extends StatelessWidget {
  const OAplikaciji({super.key});
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            title: const Text('O aplikaciji',
                style: TextStyle(color: Colors.white)),
            backgroundColor: const Color.fromARGB(255, 22, 56, 74)),
        drawer: const SizedBox(
          width: 500,
          child: Drawer(
            child: Izbornik(),
          ),
        ),
        body: Row(children: [
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
        ])));
  }
}
