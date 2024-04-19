import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:audioplayers/audioplayers.dart';

import '../../app_state.dart';

class ZadatciInformacije extends StatefulWidget {
  const ZadatciInformacije({super.key});

  @override
  State<ZadatciInformacije> createState() => _ZadatciInformacijeState();
}

class _ZadatciInformacijeState extends State<ZadatciInformacije> {
  final controller = TextEditingController();
  late AppState appState;
  late Timer flickerTimer;
  final player = AudioPlayer();

  int numValue = Random().nextInt(10) + 1;
  var values = ['B', "KB", "MB", "GB", "TB"];
  int valueFromIndex = Random().nextInt(5);
  int valueToIndex = 0;
  double opacity = 1;

  @override
  void initState() {
    super.initState();
    appState = Provider.of<AppState>(context, listen: false);
    generateIndexAndNumber();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  Future<void> playSound(String audioPath) async {
    await player.play(AssetSource(audioPath));
    await Future.delayed(const Duration(milliseconds: 1500));
    appState.tocnoVisible = false;
  }

  void generateIndexAndNumber() {
    valueFromIndex = Random().nextInt(5);
    valueToIndex = 0;
    numValue = Random().nextInt(10) + 1;
    switch (appState.currentSliderValue) {
      case 1:
        if (valueFromIndex == 0) {
          valueFromIndex++;
        }
        valueToIndex = valueFromIndex - 1;
        break;
      case 2:
        if (valueFromIndex == 0 || valueFromIndex == 1) {
          valueFromIndex += 2;
        }
        valueToIndex = valueFromIndex - 2;
        break;
      case 3:
        if (valueFromIndex == values.length - 1) {
          valueFromIndex--;
        }
        if (valueFromIndex == 0) {
          valueFromIndex++;
        }
        valueToIndex =
            (Random().nextBool()) ? valueFromIndex + 1 : valueFromIndex - 1;
        break;
      case 4:
      default:
        while (valueFromIndex == valueToIndex) {
          valueToIndex = Random().nextInt(5);
        }
    }
  }

  double setUnitTo(String from, String to) {
    switch (from) {
      case 'B':
        if (to == "KB") {
          return 1 / 100;
        }
        if (to == "MB") {
          return 1 / 1000000;
        }
        if (to == "GB") {
          return 1 / 1000000000;
        }
        if (to == "TB") {
          return 1 / 1000000000000;
        }
        break;
      case 'KB':
        if (to == "B") {
          return 100;
        }
        if (to == "MB") {
          return 1 / 100;
        }
        if (to == "GB") {
          return 1 / 1000000;
        }
        if (to == "TB") {
          return 1 / 1000000000;
        }
        break;
      case 'MB':
        if (to == "B") {
          return 1000000;
        }
        if (to == "KB") {
          return 1000;
        }
        if (to == "GB") {
          return 1 / 1000;
        }
        if (to == "TB") {
          return 1 / 1000000;
        }
        break;
      case 'GB':
        if (to == "B") {
          return 1000000000;
        }
        if (to == "KB") {
          return 1000000;
        }
        if (to == "MB") {
          return 1000;
        }
        if (to == "TB") {
          return 1 / 1000;
        }
        break;
      case 'TB':
        if (to == "B") {
          return 1000000000000;
        }
        if (to == "KB") {
          return 1000000000;
        }
        if (to == "MB") {
          return 1000000;
        }
        if (to == "GB") {
          return 1000;
        }
        break;
      default:
    }
    return 1;
  }

  void checkAnswer(int num, String from, String to) {
    bool isCorrect = false;
    setState(() {
      FocusManager.instance.primaryFocus?.unfocus();
      switch (from) {
        case 'B':
          if (to == "KB" && controller.text == (num / 100).toString()) {
            isCorrect = true;
          }
          if (to == "MB" && controller.text == (num / 1000000).toString()) {
            isCorrect = true;
          }
          if (to == "GB" && controller.text == (num / 1000000000).toString()) {
            isCorrect = true;
          }
          if (to == "TB" &&
              controller.text == (num / 1000000000000).toString()) {
            isCorrect = true;
          }
          break;
        case 'KB':
          if (to == "B" && controller.text == (num * 100).toString()) {
            isCorrect = true;
          }
          if (to == "MB" && controller.text == (num / 100).toString()) {
            isCorrect = true;
          }
          if (to == "GB" && controller.text == (num / 1000000).toString()) {
            isCorrect = true;
          }
          if (to == "TB" && controller.text == (num / 1000000000).toString()) {
            isCorrect = true;
          }
          break;
        case 'MB':
          if (to == "B" && controller.text == (num * 1000000).toString()) {
            isCorrect = true;
          }
          if (to == "KB" && controller.text == (num * 1000).toString()) {
            isCorrect = true;
          }
          if (to == "GB" && controller.text == (num / 1000).toString()) {
            isCorrect = true;
          }
          if (to == "TB" && controller.text == (num / 1000000).toString()) {
            isCorrect = true;
          }
          break;
        case 'GB':
          if (to == "B" && controller.text == (num * 1000000000).toString()) {
            isCorrect = true;
          }
          if (to == "KB" && controller.text == (num * 1000000).toString()) {
            isCorrect = true;
          }
          if (to == "MB" && controller.text == (num * 1000).toString()) {
            isCorrect = true;
          }
          if (to == "TB" && controller.text == (num / 1000).toString()) {
            isCorrect = true;
          }
          break;
        case 'TB':
          if (to == "B" &&
              controller.text == (num * 1000000000000).toString()) {
            isCorrect = true;
          }
          if (to == "KB" && controller.text == (num * 1000000000).toString()) {
            isCorrect = true;
          }
          if (to == "MB" && controller.text == (num * 1000000).toString()) {
            isCorrect = true;
          }
          if (to == "GB" && controller.text == (num * 1000).toString()) {
            isCorrect = true;
          }
          break;
        default:
      }
      if (isCorrect && appState.helpButtonShown == true) {
        appState.helpButtonShown = false;
        appState.postupakShown = false;
      } else if (!isCorrect && appState.postupakShown == false) {
        appState.helpButtonShown = true;
      }

      if (isCorrect) {
        appState.netocno = false;
        appState.tocnoVisible = true;
        String audioPath = "yes.mp3";
        playSound(audioPath);
        opacity = 0; // Initially set opacity to 0
        flickerTimer =
            Timer.periodic(const Duration(milliseconds: 300), (timer) {
          // Toggle opacity between 0 and 1 every 500 milliseconds
          setState(() {
            opacity = opacity == 0 ? 1 : 0;
          });
        });
        // Delay clearing the text field after the animation duration
        Future.delayed(const Duration(milliseconds: 1500), () {
          setState(() {
            generateIndexAndNumber();
            controller.clear();
            opacity =
                1; // Ensure opacity is set to 1 after clearing the text field
            flickerTimer.cancel(); // Stop the flickering effect
          });
        });
      } else {
        appState.netocno = true;
        appState.tocnoVisible = true;
        String audioPath = "no.mp3";
        playSound(audioPath);
      }
    });
  }

  completeSolution(int num, String from, String to) {
    setState(() {
      switch (from) {
        case 'B':
          if (to == "KB") {
            controller.text = (num / 100).toString();
          }
          if (to == "MB") {
            controller.text = (num / 1000000).toString();
          }
          if (to == "GB") {
            controller.text = (num / 1000000000).toString();
          }
          if (to == "TB") {
            controller.text = (num / 1000000000000).toString();
          }
          break;
        case 'KB':
          if (to == "B") {
            controller.text = (num * 100).toString();
          }
          if (to == "MB") {
            controller.text = (num / 100).toString();
          }
          if (to == "GB") {
            controller.text = (num / 1000000).toString();
          }
          if (to == "TB") {
            controller.text = (num / 1000000000).toString();
          }
          break;
        case 'MB':
          if (to == "B") {
            controller.text = (num * 1000000).toString();
          }
          if (to == "KB") {
            controller.text = (num * 1000).toString();
          }
          if (to == "GB") {
            controller.text = (num / 1000).toString();
          }
          if (to == "TB") {
            controller.text = (num / 1000000).toString();
          }
          break;
        case 'GB':
          if (to == "B") {
            controller.text = (num * 1000000000).toString();
          }
          if (to == "KB") {
            controller.text = (num * 1000000).toString();
          }
          if (to == "MB") {
            controller.text = (num * 1000).toString();
          }
          if (to == "TB") {
            controller.text = (num / 1000).toString();
          }
          break;
        case 'TB':
          if (to == "B") {
            controller.text = (num * 1000000000000).toString();
          }
          if (to == "KB") {
            controller.text = (num * 1000000000).toString();
          }
          if (to == "MB") {
            controller.text = (num * 1000000).toString();
          }
          if (to == "GB") {
            controller.text = (num * 1000).toString();
          }
          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    appState = Provider.of<AppState>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(children: [
      Padding(
        padding: EdgeInsets.only(
            top: screenHeight / 100,
            left: screenWidth / 200,
            right: screenWidth / 200),
        child: Text(
          "Preračunaj mjeru s lijeve strane crte u mjeru s desne strane crte. Zatim odgovor upiši na crtu 'Unesite rješenje'! Zatim svoj odgovor provjeri klikom na gumb 'PROVJERI'!",
          style: TextStyle(
              fontSize: appState.fontSize == 1
                  ? screenHeight / 30
                  : screenHeight / 30 * (appState.fontSize - 0.2),
              color: appState.fontColor),
          textAlign: TextAlign.left,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(
            top: screenHeight / 500,
            left: screenWidth / 43,
            right: appState.fontSize == 1
                ? screenWidth / 5
                : screenWidth / 4 * (appState.fontSize - 0.85)),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Visibility(
              visible: appState.helpButtonShown,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.all(screenWidth / 120),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      appState.postupakShown = true;
                    });
                  },
                  child: Text(
                    'Trebaš pomoć?',
                    style: TextStyle(
                        fontSize: appState.fontSize == 1
                            ? screenHeight / 31
                            : screenHeight / 31 * (appState.fontSize - 0.35)),
                  ))),
          SizedBox(
            width: appState.fontSize == 1 ? screenWidth / 8 : screenWidth / 16,
          ),
          Text(
            numValue.toString(),
            style: TextStyle(
                fontSize: appState.fontSize == 1
                    ? screenHeight / 18
                    : screenHeight / 18 * (appState.fontSize - 0.25),
                color: appState.fontColor),
          ),
          SizedBox(
            width:
                appState.fontSize == 1 ? screenWidth / 150 : screenWidth / 300,
          ),
          Text(
            "${values[valueFromIndex]} = ",
            style: TextStyle(
                fontSize: appState.fontSize == 1
                    ? screenHeight / 18
                    : screenHeight / 18 * (appState.fontSize - 0.25),
                color: appState.fontColor),
          ),
          SizedBox(
            width:
                appState.fontSize == 1 ? screenWidth / 150 : screenWidth / 800,
          ),
          Expanded(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: opacity,
              child: TextField(
                style: TextStyle(
                    fontSize: appState.fontSize == 1
                        ? screenHeight / 25
                        : screenHeight / 25 * (appState.fontSize),
                    color: appState.fontColor),
                textAlign: TextAlign.center,
                controller: controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Unesite rješenje',
                  hintStyle: TextStyle(
                      fontSize: appState.fontSize == 1
                          ? screenHeight / 50
                          : screenHeight / 50 * (appState.fontSize - 0.3),
                      color: appState.fontColor),
                  alignLabelWithHint: true,
                ),
              ),
            ),
          ),
          SizedBox(
            width: screenWidth / 150,
          ),
          Text(
            values[valueToIndex],
            style: TextStyle(
                fontSize: appState.fontSize == 1
                    ? screenHeight / 18
                    : screenHeight / 18 * (appState.fontSize - 0.25),
                color: appState.fontColor),
          ),
          SizedBox(
            width: screenWidth / 30,
          ),
          Visibility(
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            visible: appState.tocnoVisible,
            child: Image.asset(
              appState.netocno == false
                  ? 'assets/tocno.png'
                  : 'assets/netocno.png',
              width: screenWidth / 15,
              height: screenHeight / 13,
            ),
          )
        ]),
      ),
      SizedBox(
        height: appState.fontSize == 1 ? 0 : screenHeight / 200,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
              visible: appState.rjesenjeShown,
              child: OutlinedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 212, 171, 36)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      side: MaterialStateProperty.all<BorderSide>(
                          BorderSide(color: appState.fontColor, width: 1.5))),
                  onPressed: () {
                    setState(() {
                      completeSolution(numValue, values[valueFromIndex],
                          values[valueToIndex]);
                    });
                  },
                  child: Text('RJEŠENJE',
                      style: TextStyle(
                          fontSize: appState.fontSize == 1
                              ? screenHeight / 35
                              : screenHeight / 35 * (appState.fontSize - 0.25),
                          color: Colors.black)))),
          SizedBox(
            width: screenWidth / 150,
          ),
          OutlinedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 22, 56, 74)),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  minimumSize: MaterialStateProperty.all<Size>(
                      Size.square(screenWidth / 35))),
              onPressed: () {
                checkAnswer(
                    numValue, values[valueFromIndex], values[valueToIndex]);
              },
              child: Text('PROVJERI',
                  style: TextStyle(
                      fontSize: appState.fontSize == 1
                          ? screenHeight / 35
                          : screenHeight / 35 * (appState.fontSize - 0.25)))),
        ],
      ),
      SizedBox(
        height: appState.fontSize == 1 ? 0 : screenHeight / 200,
      ),
      Padding(
        padding: EdgeInsets.only(right: screenWidth / 3, left: screenWidth / 3),
        child: Visibility(
            visible: appState.postupakShown,
            child: Container(
              width: double.maxFinite,
              color: const Color.fromARGB(255, 232, 196, 80),
              child: Padding(
                padding: EdgeInsets.only(left: screenWidth / 200),
                child: Text(
                  '1 ${values[valueFromIndex]} = ${setUnitTo(values[valueFromIndex], values[valueToIndex]).toString().replaceAll(RegExp(r'([.]*0)(?!.*\d)'), '')} ${values[valueToIndex]}\n$numValue ${values[valueFromIndex]} = ($numValue \u2022 ${setUnitTo(values[valueFromIndex], values[valueToIndex]).toString().replaceAll(RegExp(r'([.]*0)(?!.*\d)'), '')}) ${values[valueToIndex]}',
                  style: TextStyle(fontSize: screenHeight / 25),
                  textAlign: TextAlign.left,
                ),
              ),
            )),
      )
    ]);
  }
}
