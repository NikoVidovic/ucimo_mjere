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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    appState = Provider.of<AppState>(context);
    return Scaffold(
        backgroundColor: appState.backgroundColor,
        appBar: AppBarCustom(
            title: 'Pristupačnost',
            height: screenHeight / 8,
            imageShown: false,
            imagePath: '',
            imageWidth: 0,
            sizedBoxWidth: screenWidth / 1.55),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth / 43, top: screenHeight / 40),
              child: Text(
                'Promjeni pozadinu aplikacije',
                style: TextStyle(
                    fontSize: screenHeight / 35 * appState.fontSize,
                    color: appState.fontColor),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: screenWidth / 43),
                  child: Text(
                    'Pozadina',
                    style: TextStyle(
                        fontSize: screenHeight / 20 * appState.fontSize,
                        color: appState.fontColor),
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
                              Size(screenWidth / 8.3, screenHeight / 5.4)),
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
                        child: Text(
                          'Dan',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: screenHeight / 25 * appState.fontSize),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth / 100,
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
                              Size(screenWidth / 8.3, screenHeight / 5.4)),
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
                        child: Text(
                          'Noć',
                          style: TextStyle(
                              color: Colors.yellow,
                              fontSize: screenHeight / 25 * appState.fontSize),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth / 50,
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: screenHeight / 20,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: screenWidth / 43),
                  child: Text(
                    'Veličina fonta',
                    style: TextStyle(
                        fontSize: screenHeight / 20 * appState.fontSize,
                        color: appState.fontColor),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            appState.fontSize = 1;
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              appState.backgroundColor),
                          minimumSize: MaterialStateProperty.all<Size>(
                              Size(screenWidth / 8.3, screenHeight / 5.4)),
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
                        child: Text(
                          'Normalna',
                          style: TextStyle(
                              color: appState.fontColor,
                              fontSize: screenHeight / 25),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth / 100,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            appState.fontSize = 1.5;
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              appState.backgroundColor),
                          minimumSize: MaterialStateProperty.all<Size>(
                              Size(screenWidth / 8.3, screenHeight / 5.4)),
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
                        child: Text(
                          'Velika',
                          style: TextStyle(
                              color: appState.fontColor,
                              fontSize: screenHeight / 14),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth / 50,
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
