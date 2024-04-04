import 'package:flutter/material.dart';
import 'package:hello_world/app_bar.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';

class AccessSettings extends StatefulWidget {
  const AccessSettings({super.key});

  @override
  State<AccessSettings> createState() => _AccessSettingsState();
}

class _AccessSettingsState extends State<AccessSettings> {
  late AppState appState;

  @override
  Widget build(BuildContext context) {
    appState = Provider.of<AppState>(context);
    return Scaffold(
        backgroundColor: appState.backgroundColor,
        appBar: const AppBarCustom(
            title: 'Pristupačnost',
            height: 100,
            imageShown: false,
            imagePath: '',
            imageWidth: 0,
            sizedBoxWidth: 900),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 15),
              child: Text(
                'Promjeni pozadinu aplikacije',
                style: TextStyle(fontSize: 20, color: appState.fontColor),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Text(
                    'Pozadina',
                    style: TextStyle(fontSize: 30, color: appState.fontColor),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            appState.backgroundColor = Colors.white;
                            appState.fontColor = Colors.black;
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 255, 255, 255)),
                          minimumSize: MaterialStateProperty.all<Size>(
                              const Size(150, 145)),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          side: MaterialStateProperty.all<BorderSide>(
                            const BorderSide(
                              color: Colors
                                  .pinkAccent, // Define the color of the border
                              width: 2, // Define the width of the border
                            ),
                          ),
                        ),
                        child: const Text(
                          'Dan',
                          style: TextStyle(color: Colors.black, fontSize: 30),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            appState.backgroundColor = Colors.black;
                            appState.fontColor = Colors.yellow;
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 0, 0, 0)),
                          minimumSize: MaterialStateProperty.all<Size>(
                              const Size(150, 145)),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          side: MaterialStateProperty.all<BorderSide>(
                            const BorderSide(
                              color: Colors
                                  .pinkAccent, // Define the color of the border
                              width: 2, // Define the width of the border
                            ),
                          ),
                        ),
                        child: const Text(
                          'Noć',
                          style: TextStyle(color: Colors.yellow, fontSize: 30),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ));
  }
}
