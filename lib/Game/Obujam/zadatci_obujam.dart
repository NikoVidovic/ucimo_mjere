import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';

import '../../app_state.dart';

class ZadatciObujam extends StatefulWidget {
  const ZadatciObujam({super.key});

  @override
  State<ZadatciObujam> createState() => _ZadatciObujamState();
}

class _ZadatciObujamState extends State<ZadatciObujam>
    with SingleTickerProviderStateMixin {
  final controller = TextEditingController();
  late AppState appState;
  late Timer flickerTimer;
  final player = AudioPlayer();
  late AnimationController animationController;
  late Animation<double> sizeAnimation;

  int numValue = Random().nextInt(10) + 1;
  var values = ['mm', "cm", "dm", "m", "km"];
  int valueFromIndex = Random().nextInt(5);
  int valueToIndex = 0;
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
    if (appState.selfTaskObujam.isEmpty) {
      valueFromIndex = Random().nextInt(5);
      valueToIndex = 0;
      numValue = Random().nextInt(10) + 1;
      switch (appState.currentSliderValueObujam.round()) {
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
    } else {
      valueFromIndex = appState.selfTaskObujam[1];
      valueToIndex = appState.selfTaskObujam[2];
      numValue = appState.selfTaskObujam[0];
    }
  }

  double setUnitTo(String from, String to) {
    switch (from) {
      case 'mm':
        if (to == "cm") {
          return 1 / 1000;
        }
        if (to == "dm") {
          return 1 / 1000000;
        }
        if (to == "m") {
          return 1 / 1000000000;
        }
        if (to == "km") {
          return 1 / 1000000000000000000;
        }
        break;
      case 'cm':
        if (to == "mm") {
          return 1000;
        }
        if (to == "dm") {
          return 1 / 1000;
        }
        if (to == "m") {
          return 1 / 1000000;
        }
        if (to == "km") {
          return 1 / 1000000000000000;
        }
        break;
      case 'dm':
        if (to == "mm") {
          return 1000000;
        }
        if (to == "cm") {
          return 1000;
        }
        if (to == "m") {
          return 1 / 1000;
        }
        if (to == "km") {
          return 1 / 1000000000000;
        }
        break;
      case 'm':
        if (to == "mm") {
          return 1000000000;
        }
        if (to == "cm") {
          return 1000000;
        }
        if (to == "dm") {
          return 1000;
        }
        if (to == "km") {
          return 1 / 1000000000;
        }
        break;
      case 'km':
        if (to == "mm") {
          return 1000000000000000000;
        }
        if (to == "cm") {
          return 1000000000000000;
        }
        if (to == "dm") {
          return 1000000000000;
        }
        if (to == "m") {
          return 1000000000;
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
        case 'mm':
          if (to == "cm" && controller.text == (num / 1000).toString()) {
            isCorrect = true;
          }
          if (to == "dm" && controller.text == (num / 1000000).toString()) {
            isCorrect = true;
          }
          if (to == "m" && controller.text == (num / 1000000000).toString()) {
            isCorrect = true;
          }
          if (to == "km" &&
              controller.text == (num / 1000000000000000000).toString()) {
            isCorrect = true;
          }
          break;
        case 'cm':
          if (to == "mm" && controller.text == (num * 1000).toString()) {
            isCorrect = true;
          }
          if (to == "dm" && controller.text == (num / 1000).toString()) {
            isCorrect = true;
          }
          if (to == "m" && controller.text == (num / 1000000).toString()) {
            isCorrect = true;
          }
          if (to == "km" &&
              controller.text == (num / 1000000000000000).toString()) {
            isCorrect = true;
          }
          break;
        case 'dm':
          if (to == "mm" && controller.text == (num * 1000000).toString()) {
            isCorrect = true;
          }
          if (to == "cm" && controller.text == (num * 1000).toString()) {
            isCorrect = true;
          }
          if (to == "m" && controller.text == (num / 1000).toString()) {
            isCorrect = true;
          }
          if (to == "km" &&
              controller.text == (num / 1000000000000).toString()) {
            isCorrect = true;
          }
          break;
        case 'm':
          if (to == "mm" && controller.text == (num * 1000000000).toString()) {
            isCorrect = true;
          }
          if (to == "cm" && controller.text == (num * 1000000).toString()) {
            isCorrect = true;
          }
          if (to == "dm" && controller.text == (num * 1000).toString()) {
            isCorrect = true;
          }
          if (to == "km" && controller.text == (num / 1000000000).toString()) {
            isCorrect = true;
          }
          break;
        case 'km':
          if (to == "mm" &&
              controller.text == (num * 1000000000000000000).toString()) {
            isCorrect = true;
          }
          if (to == "cm" &&
              controller.text == (num * 1000000000000000).toString()) {
            isCorrect = true;
          }
          if (to == "dm" &&
              controller.text == (num * 1000000000000).toString()) {
            isCorrect = true;
          }
          if (to == "m" && controller.text == (num * 1000000000).toString()) {
            isCorrect = true;
          }
          break;
        default:
      }
      if (isCorrect && appState.helpButtonShown == true) {
        appState.helpButtonShown = false;
        appState.postupakShownObujam = false;
      } else if (!isCorrect && appState.postupakShownObujam == false) {
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
        appState.animationGoing = true;
        animationController.forward();
        appState.netocno = true;
        appState.tocnoVisible = true;
        String audioPath = "no.mp3";
        playSound(audioPath);
        Future.delayed(const Duration(milliseconds: 200), () {
          setState(() {
            appState.animationGoing = false;
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
        case 'mm':
          if (to == "cm") {
            controller.text = (num / 1000).toString();
          }
          if (to == "dm") {
            controller.text = (num / 1000000).toString();
          }
          if (to == "m") {
            controller.text = (num / 1000000000).toString();
          }
          if (to == "km") {
            controller.text = (num / 1000000000000000000).toString();
          }
          break;
        case 'cm':
          if (to == "mm") {
            controller.text = (num * 1000).toString();
          }
          if (to == "dm") {
            controller.text = (num / 1000).toString();
          }
          if (to == "m") {
            controller.text = (num / 1000000).toString();
          }
          if (to == "km") {
            controller.text = (num / 1000000000000000).toString();
          }
          break;
        case 'dm':
          if (to == "mm") {
            controller.text = (num * 1000000).toString();
          }
          if (to == "cm") {
            controller.text = (num * 1000).toString();
          }
          if (to == "m") {
            controller.text = (num / 1000).toString();
          }
          if (to == "km") {
            controller.text = (num / 1000000000000).toString();
          }
          break;
        case 'm':
          if (to == "mm") {
            controller.text = (num * 1000000000).toString();
          }
          if (to == "cm") {
            controller.text = (num * 1000000).toString();
          }
          if (to == "dm") {
            controller.text = (num * 1000).toString();
          }
          if (to == "km") {
            controller.text = (num / 1000000000).toString();
          }
          break;
        case 'km':
          if (to == "mm") {
            controller.text = (num * 1000000000000000000).toString();
          }
          if (to == "cm") {
            controller.text = (num * 1000000000000000).toString();
          }
          if (to == "dm") {
            controller.text = (num * 1000000000000).toString();
          }
          if (to == "m") {
            controller.text = (num * 1000000000).toString();
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
              visible: appState.taskObujam,
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
                        if (appState.postupakShownObujam == false) {
                          appState.postupakShownObujam = true;
                        } else if (appState.postupakShownObujam == true) {
                          appState.postupakShownObujam = false;
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
              values[valueFromIndex],
              style: TextStyle(
                  fontSize: appState.fontSize == 1
                      ? screenHeight / 18
                      : screenHeight / 18 * (appState.fontSize - 0.25),
                  color: appState.fontColor),
            ),
            Padding(
                padding: EdgeInsets.only(bottom: screenHeight / 25),
                child: Text(
                  '3',
                  style: TextStyle(
                      fontSize: appState.fontSize == 1
                          ? screenHeight / 25
                          : screenHeight / 25 * (appState.fontSize - 0.25),
                      color: appState.fontColor),
                )),
            Text(
              " = ",
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
            Padding(
                padding: EdgeInsets.only(bottom: screenHeight / 25),
                child: Text(
                  '3',
                  style: TextStyle(
                      fontSize: appState.fontSize == 1
                          ? screenHeight / 25
                          : screenHeight / 25 * (appState.fontSize - 0.25),
                      color: appState.fontColor),
                )),
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
                visible: appState.rjesenjeShownObujam,
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
                  if (appState.taskObujam &&
                      appState.selfTaskObujam.isNotEmpty &&
                      isCorrect) {
                    appState.selfTaskObujam.removeAt(0);
                    appState.selfTaskObujam.removeAt(0);
                    appState.selfTaskObujam.removeAt(0);
                  }
                  if (appState.taskObujam && appState.selfTaskObujam.isEmpty) {
                    Future.delayed(const Duration(milliseconds: 1500), () {
                      openDialog(screenWidth, screenHeight, appState.fontColor);
                      appState.taskObujam = false;
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
              visible: appState.postupakShownObujam,
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
