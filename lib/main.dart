import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '/MainMenu/main_menu.dart';
import 'app_state.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
  ]);
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppState(),
      child: const MyApp(),
    ),
  );
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
  bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width > 1440;
  bool isPhone(BuildContext context) =>
      MediaQuery.of(context).size.width <= 1440;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: const AssetImage('assets/pocetnaScena.png'),
              fit: isTablet(context) ? BoxFit.cover : BoxFit.contain)),
      child: Padding(
        padding:
            EdgeInsets.only(top: screenHeight / 2.5, right: screenWidth / 20),
        child: Align(
            alignment: Alignment.centerRight,
            child: Column(children: [
              Text(
                "Učimo mjere",
                style: TextStyle(fontSize: screenWidth / 25),
              ),
              Text(
                "pretvaranje mjernih jedinica",
                style: TextStyle(
                    fontSize: isTablet(context)
                        ? screenWidth / 70
                        : screenWidth / 50),
              ),
              Padding(
                padding: EdgeInsets.only(top: screenHeight / 50),
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainMenu()));
                  },
                  style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                          Size(screenWidth / 7, screenHeight / 15)),
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 22, 56, 74))),
                  child: Text(
                    "Kreni",
                    style: TextStyle(
                        fontSize: isTablet(context)
                            ? screenWidth / 47
                            : screenWidth / 37,
                        color: Colors.white),
                  ),
                ),
              ),
            ])),
      ),
    ));
  }
}
