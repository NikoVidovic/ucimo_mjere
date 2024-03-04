import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const MainMenu(),
    );
  }
}

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Učimo mjere',
                style: TextStyle(color: Colors.white)),
            leading: IconButton(
                icon: Icon(Icons.menu),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white)),
                onPressed: () {}),
            backgroundColor: const Color.fromARGB(255, 22, 56, 74)),
        body: const Column(
          children: [
            MainButton(
                naziv: 'Vrijeme', boja: Color.fromARGB(255, 222, 207, 73)),
            MainButton(
                naziv: 'Površina', boja: Color.fromARGB(255, 125, 31, 142)),
            MainButton(
                naziv: 'Obujam', boja: Color.fromARGB(255, 77, 147, 153)),
            MainButton(naziv: 'Temperatura', boja: Colors.red),
            MainButton(
                naziv: 'Količina informacije',
                boja: Color.fromARGB(255, 28, 127, 209))
          ],
        ));
  }
}

class MainButton extends StatelessWidget {
  final String naziv;
  final Color boja;
  const MainButton({super.key, required this.naziv, required this.boja});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(16.0),
        child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                minimumSize:
                    MaterialStateProperty.all(const Size(double.infinity, 100)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0))),
                backgroundColor: MaterialStateProperty.all(boja)),
            child: Text(naziv,
                style: TextStyle(color: Colors.white, fontSize: 30))));
  }
}
