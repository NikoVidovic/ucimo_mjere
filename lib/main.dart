import 'package:flutter/material.dart';
import 'package:hello_world/app_bar.dart';
import 'izbornik.dart';
import 'main_button.dart';

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
                naziv: 'Mjerne jedinice za masu/duljinu/vrijeme',
                boja: Color.fromARGB(255, 232, 196, 80),
                imagePath: 'assets/kategorija1.png'),
            MainButton(
                naziv: 'Mjerne jedinice za površinu',
                boja: Color.fromARGB(255, 126, 55, 108),
                imagePath: 'assets/kategorija2.png'),
            MainButton(
                naziv: 'Mjerne jedinice za obujam',
                boja: Color.fromARGB(255, 34, 194, 190),
                imagePath: 'assets/kategorija3.png'),
            MainButton(
                naziv: 'Mjerne jedinice za temperaturu',
                boja: Color.fromARGB(255, 246, 78, 81),
                imagePath: 'assets/kategorija4.png'),
            MainButton(
                naziv: 'Mjerne jedinice za kolilinu informacija',
                boja: Color.fromARGB(255, 17, 134, 209),
                imagePath: 'assets/kategorija5.png')
          ],
        )));
  }
}
