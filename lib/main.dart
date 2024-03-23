import 'package:flutter/material.dart';
import '/MainMenu/main_menu.dart';

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
      home: const PocetnaScena(),
    );
  }
}

class PocetnaScena extends StatelessWidget {
  const PocetnaScena({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/pocetnaScena.png'), fit: BoxFit.cover)),
      child: Padding(
        padding: const EdgeInsets.only(top: 320.0, right: 50.0),
        child: Align(
            alignment: Alignment.centerRight,
            child: Column(children: [
              const Text(
                "Učimo mjere",
                style: TextStyle(fontSize: 55),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainMenu()));
                  },
                  style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all(const Size(220, 50)),
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 22, 56, 74))),
                  child: const Text(
                    "Kreni",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ),
            ])),
      ),
    ));
  }
}
