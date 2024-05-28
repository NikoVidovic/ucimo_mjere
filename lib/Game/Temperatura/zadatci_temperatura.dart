import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';

import '../../app_state.dart';

class ZadatciTemperatura extends StatefulWidget {
  const ZadatciTemperatura({super.key});

  @override
  State<ZadatciTemperatura> createState() => _ZadatciTemperaturaState();
}

class _ZadatciTemperaturaState extends State<ZadatciTemperatura>
    with SingleTickerProviderStateMixin {
  final controller = TextEditingController();
  late AppState appState;
  late Timer flickerTimer;
  final player = AudioPlayer();
  late AnimationController animationController;
  late Animation<double> sizeAnimation;

  int numValue = Random().nextInt(200) + 1;
  var values = ['C', "K"];
  int valueFromIndex = 0;
  int valueToIndex = 1;
  int kelvin = 300;
  int celsius = 100;
  double opacity = 1;

  @override
  void initState() {
    super.initState();
    appState = Provider.of<AppState>(context, listen: false);
    generateIndexAndNumber();

    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));

    sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0, end: 30), weight: 50),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 30, end: 0), weight: 50)
    ]).animate(animationController);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    animationController.dispose();
  }

  Future<void> playSound(String audioPath) async {
    await player.play(AssetSource(audioPath));
    await Future.delayed(const Duration(milliseconds: 1500));
    appState.tocnoVisible = false;
  }

  void generateIndexAndNumber() {
    if (appState.selfTaskTemperatura.isEmpty) {
      switch (appState.currentSliderValueTemperatura) {
        case 1:
        case 2:
          celsius = 100;
          kelvin = 300;
          numValue = (valueFromIndex == 1)
              ? Random().nextInt(kelvin)
              : Random().nextInt(celsius);
          break;
        case 3:
        case 4:
        default:
          celsius = (300 - 273.15).toInt();
          kelvin = 400;
          valueFromIndex = Random().nextInt(values.length);
          valueToIndex = (valueFromIndex + 1) % values.length;
          numValue = (valueFromIndex == 1)
              ? Random().nextInt(kelvin)
              : Random().nextInt(celsius);
          break;
      }
    } else {
      valueFromIndex = appState.selfTaskTemperatura[1];
      valueToIndex = appState.selfTaskTemperatura[2];
      numValue = appState.selfTaskTemperatura[0];
    }
  }

  double setUnitTo(String from, String to) {
    switch (from) {
      case 'K':
        if (to == "C") {
          return -273.15;
        }
        break;
      case 'C':
        if (to == "K") {
          //plus
          return 273.15;
        }
        break;
      default:
    }
    return 1;
  }

  bool checkAnswer(int num, String from, String to) {
    bool isCorrect = false;
    setState(() {
      FocusManager.instance.primaryFocus?.unfocus();
      switch (from) {
        case 'K':
          if (to == "C" && controller.text == (num - 273.15).toString()) {
            isCorrect = true;
          }
          break;
        case 'C':
          if (to == "K" && controller.text == (num + 273.15).toString()) {
            isCorrect = true;
          }
          break;
        default:
      }
      if (isCorrect && appState.helpButtonShown == true) {
        appState.helpButtonShown = false;
        appState.postupakShownTemperatura = false;
      } else if (!isCorrect && appState.postupakShownTemperatura == false) {
        appState.helpButtonShown = true;
      }

      if (isCorrect) {
        appState.netocno = false;
        appState.tocnoVisible = true;
        String audioPath = "yes.mp3";
        playSound(audioPath);
        appState.animationGoing = true;
        opacity = 0;
        flickerTimer =
            Timer.periodic(const Duration(milliseconds: 300), (timer) {
          setState(() {
            opacity = opacity == 0 ? 1 : 0;
          });
        });

        Future.delayed(const Duration(milliseconds: 1500), () {
          setState(() {
            appState.animationGoing = false;
            generateIndexAndNumber();
            controller.clear();
            opacity = 1;
            flickerTimer.cancel();
          });
        });
      } else {
        animationController.forward();
        appState.netocno = true;
        appState.tocnoVisible = true;
        String audioPath = "no.mp3";
        playSound(audioPath);
        Future.delayed(const Duration(milliseconds: 200), () {
          setState(() {
            animationController.reset();
          });
        });
      }
    });
    return isCorrect;
  }

  completeSolution(int num, String from, String to) {
    setState(() {
      switch (from) {
        case 'K':
          if (to == "C") {
            controller.text = (num - 273.15).toString();
          }
          break;
        case 'C':
          if (to == "K") {
            controller.text = (num + 273.15).toString();
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
    return Stack(children: [
      Column(children: [
        Row(children: [
          Padding(
            padding: EdgeInsets.only(
                top: screenHeight / 100, left: screenWidth / 100),
            child: Text(
              "Preračunaj mjeru!\nOdgovor upiši na crtu i klikni na gumb 'PROVJERI'!",
              style: TextStyle(
                  fontSize: appState.fontSize == 1
                      ? screenHeight / 30
                      : screenHeight / 30 * (appState.fontSize - 0.2),
                  color: appState.fontColor),
              textAlign: TextAlign.left,
            ),
          ),
          Visibility(
              visible: appState.taskTemperatura,
              child: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const AlertDialog(
                            title: Text("Rješavate vlastite zadatke"));
                      },
                    );
                  },
                  icon: Icon(
                    Icons.info_outline,
                    size: screenWidth / 45,
                    color: appState.fontColor,
                  )))
        ]),
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
                        if (appState.postupakShownTemperatura == false) {
                          appState.postupakShownTemperatura = true;
                        } else if (appState.postupakShownTemperatura == true) {
                          appState.postupakShownTemperatura = false;
                        }
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
              width:
                  appState.fontSize == 1 ? screenWidth / 8 : screenWidth / 16,
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
              width: appState.fontSize == 1
                  ? screenWidth / 150
                  : screenWidth / 300,
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
              width: appState.fontSize == 1
                  ? screenWidth / 150
                  : screenWidth / 800,
            ),
            Expanded(
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: opacity,
                child: AnimatedPadding(
                  duration: const Duration(milliseconds: 200),
                  padding: EdgeInsets.only(
                      top: sizeAnimation.value, right: sizeAnimation.value),
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
                visible: appState.rjesenjeShownTemperatura,
                child: OutlinedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 212, 171, 36)),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        minimumSize: MaterialStateProperty.all<Size>(
                            Size.square(screenWidth / 35)),
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
                                : screenHeight /
                                    35 *
                                    (appState.fontSize - 0.25),
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
                  var isCorrect = checkAnswer(
                      numValue, values[valueFromIndex], values[valueToIndex]);
                  if (appState.taskTemperatura &&
                      appState.selfTaskTemperatura.isNotEmpty &&
                      isCorrect) {
                    appState.selfTaskTemperatura.removeAt(0);
                    appState.selfTaskTemperatura.removeAt(0);
                    appState.selfTaskTemperatura.removeAt(0);
                  }
                  if (appState.taskTemperatura &&
                      appState.selfTaskTemperatura.isEmpty) {
                    Future.delayed(const Duration(milliseconds: 1500), () {
                      openDialog(screenWidth, screenHeight, appState.fontColor);
                      appState.taskTemperatura = false;
                    });
                  }
                },
                child: Text('PROVJERI',
                    style: TextStyle(
                        fontSize: appState.fontSize == 1
                            ? screenHeight / 35
                            : screenHeight / 35 * (appState.fontSize - 0.25)))),
            SizedBox(
              height: screenHeight / 52,
            ),
          ],
        ),
        SizedBox(
          height: appState.fontSize == 1 ? 0 : screenHeight / 200,
        ),
        Padding(
          padding:
              EdgeInsets.only(right: screenWidth / 3, left: screenWidth / 3),
          child: Visibility(
              visible: appState.postupakShownTemperatura,
              child: Container(
                width: double.maxFinite,
                color: const Color.fromARGB(255, 232, 196, 80),
                child: Padding(
                  padding: EdgeInsets.only(left: screenWidth / 200),
                  child: Text(
                    '1 ${values[valueFromIndex]} = ${setUnitTo(values[valueFromIndex], values[valueToIndex]).toString().replaceAll(RegExp(r'([.]*0)(?!.*\d)'), '')} ${values[valueToIndex]}\n$numValue ${values[valueFromIndex]} = ($numValue + ${setUnitTo(values[valueFromIndex], values[valueToIndex]).toString().replaceAll(RegExp(r'([.]*0)(?!.*\d)'), '')}) ${values[valueToIndex]}',
                    style: TextStyle(fontSize: screenHeight / 25),
                    textAlign: TextAlign.left,
                  ),
                ),
              )),
        )
      ]),
      if (appState.animationGoing)
        Positioned.fill(
          child: AbsorbPointer(
            absorbing: true,
            child: Container(
              color: Colors.transparent, // Fully transparent
            ),
          ),
        ),
    ]);
  }

  Future openDialog(screenWidth, screenHeight, fontColor) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            backgroundColor: appState.backgroundColor,
            title: Text(
              "Bravo! Uspješno ste rješili sve vlastite zadatke! Želite li nastaviti s vježbanjem?",
              style: TextStyle(
                  fontSize: screenWidth / 50, color: appState.fontColor),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 200.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "DA",
                          style: TextStyle(
                              fontSize: screenHeight / 35, color: fontColor),
                        )),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        },
                        child: Text("NE",
                            style: TextStyle(
                                fontSize: screenHeight / 35, color: fontColor)))
                  ],
                ),
              )
            ],
          ));
}
