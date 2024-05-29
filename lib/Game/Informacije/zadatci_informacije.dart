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

class _ZadatciInformacijeState extends State<ZadatciInformacije>
    with SingleTickerProviderStateMixin {
  final controller = TextEditingController();
  late AppState appState;
  late Timer flickerTimer;
  final player = AudioPlayer();
  late AnimationController animationController;
  late Animation<double> sizeAnimation;

  int numValue = Random().nextInt(10) + 1;
  var valuesDecimalni = ['B', "KB", "MB", "GB", "TB"];
  var valuesBinarni = ['B', "KiB", "MiB", "GiB", "TiB"];
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
    if (appState.selfTaskInformacije.isEmpty) {
      valueFromIndex = Random().nextInt(5);
      valueToIndex = 0;
      numValue = Random().nextInt(10) + 1;
      switch (appState.currentSliderValueInformacije) {
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
          if (valueFromIndex == valuesDecimalni.length - 1) {
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
      valueFromIndex = appState.selfTaskInformacije[1];
      valueToIndex = appState.selfTaskInformacije[2];
      numValue = appState.selfTaskInformacije[0];
    }
  }

  double setUnitTo(String from, String to) {
    if (appState.decimalni == true) {
      switch (from) {
        case 'B':
          if (to == "KB") {
            return 1 / 1000;
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
            return 1000;
          }
          if (to == "MB") {
            return 1 / 1000;
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
    } else {
      switch (from) {
        case 'B':
          if (to == "KiB") {
            return 1 / 1024;
          }
          if (to == "MiB") {
            double value = 1 / 1024 / 1024;
            return double.parse(value.toStringAsFixed(10));
          }
          if (to == "GiB") {
            double value = 1 / 1024 / 1024 / 1024;
            return double.parse(value.toStringAsFixed(12));
          }
          if (to == "TiB") {
            double value = 1 / 1024 / 1024 / 1024 / 1024;
            return double.parse(value.toStringAsFixed(15));
          }
          break;
        case 'KiB':
          if (to == "B") {
            return 1024;
          }
          if (to == "MiB") {
            return 1 / 1024;
          }
          if (to == "GiB") {
            double value = 1 / 1024 / 1024;
            return double.parse(value.toStringAsFixed(10));
          }
          if (to == "TiB") {
            double value = 1 / 1024 / 1024 / 1024;
            return double.parse(value.toStringAsFixed(12));
          }
          break;
        case 'MiB':
          if (to == "B") {
            return 1024 * 1024;
          }
          if (to == "KiB") {
            return 1024;
          }
          if (to == "GiB") {
            return 1 / 1024;
          }
          if (to == "TiB") {
            double value = 1 / 1024 / 1024;
            return double.parse(value.toStringAsFixed(10));
          }
          break;
        case 'GiB':
          if (to == "B") {
            return 1024 * 1024 * 1024;
          }
          if (to == "KiB") {
            return 1024 * 1024;
          }
          if (to == "MiB") {
            return 1024;
          }
          if (to == "TiB") {
            return 1 / 1024;
          }
          break;
        case 'TiB':
          if (to == "B") {
            return 1024 * 1024 * 1024 * 1024;
          }
          if (to == "KiB") {
            return 1024 * 1024 * 1024;
          }
          if (to == "MiB") {
            return 1024 * 1024;
          }
          if (to == "GiB") {
            return 1024;
          }
          break;
        default:
      }
      return 1;
    }
  }

  bool checkAnswer(int num, String from, String to) {
    bool isCorrect = false;
    setState(() {
      FocusManager.instance.primaryFocus?.unfocus();
      if (appState.decimalni == true) {
        switch (from) {
          case 'B':
            if (to == "KB" && controller.text == (num / 1000).toString()) {
              isCorrect = true;
            }
            if (to == "MB" && controller.text == (num / 1000000).toString()) {
              isCorrect = true;
            }
            if (to == "GB" &&
                controller.text == (num / 1000000000).toString()) {
              isCorrect = true;
            }
            if (to == "TB" &&
                controller.text == (num / 1000000000000).toString()) {
              isCorrect = true;
            }
            break;
          case 'KB':
            if (to == "B" && controller.text == (num * 1000).toString()) {
              isCorrect = true;
            }
            if (to == "MB" && controller.text == (num / 1000).toString()) {
              isCorrect = true;
            }
            if (to == "GB" && controller.text == (num / 1000000).toString()) {
              isCorrect = true;
            }
            if (to == "TB" &&
                controller.text == (num / 1000000000).toString()) {
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
            if (to == "KB" &&
                controller.text == (num * 1000000000).toString()) {
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
      } else {
        switch (from) {
          case 'B':
            if (to == "KiB" && controller.text == (num / 1024).toString()) {
              isCorrect = true;
            }
            if (to == "MiB" &&
                controller.text == (num / 1024 / 1024).toStringAsFixed(10)) {
              isCorrect = true;
            }
            if (to == "GiB" &&
                controller.text ==
                    (num / 1024 / 1024 / 1024).toStringAsFixed(12)) {
              isCorrect = true;
            }
            if (to == "TiB" &&
                controller.text ==
                    (num / 1024 / 1024 / 1024 / 1024).toStringAsFixed(15)) {
              isCorrect = true;
            }
            break;
          case 'KiB':
            if (to == "B" && controller.text == (num * 1024).toString()) {
              isCorrect = true;
            }
            if (to == "MiB" && controller.text == (num / 1024).toString()) {
              isCorrect = true;
            }
            if (to == "GiB" &&
                controller.text == (num / 1024 / 1024).toStringAsFixed(10)) {
              isCorrect = true;
            }
            if (to == "TiB" &&
                controller.text ==
                    (num / 1024 / 1024 / 1024).toStringAsFixed(12)) {
              isCorrect = true;
            }
            break;
          case 'MiB':
            if (to == "B" &&
                controller.text == (num * 1024 * 1024).toString()) {
              isCorrect = true;
            }
            if (to == "KiB" && controller.text == (num * 1024).toString()) {
              isCorrect = true;
            }
            if (to == "GiB" && controller.text == (num / 1024).toString()) {
              isCorrect = true;
            }
            if (to == "TiB" &&
                controller.text == (num / 1024 / 1024).toStringAsFixed(10)) {
              isCorrect = true;
            }
            break;
          case 'GiB':
            if (to == "B" &&
                controller.text == (num * 1024 * 1024 * 1024).toString()) {
              isCorrect = true;
            }
            if (to == "KiB" &&
                controller.text == (num * 1024 * 1024).toString()) {
              isCorrect = true;
            }
            if (to == "MiB" && controller.text == (num * 1024).toString()) {
              isCorrect = true;
            }
            if (to == "TiB" && controller.text == (num / 1024).toString()) {
              isCorrect = true;
            }
            break;
          case 'TiB':
            if (to == "B" &&
                controller.text ==
                    (num * 1024 * 1024 * 1024 * 1024).toString()) {
              isCorrect = true;
            }
            if (to == "KiB" &&
                controller.text == (num * 1024 * 1024 * 1024).toString()) {
              isCorrect = true;
            }
            if (to == "MiB" &&
                controller.text == (num * 1024 * 1024).toString()) {
              isCorrect = true;
            }
            if (to == "GiB" && controller.text == (num * 1024).toString()) {
              isCorrect = true;
            }
            break;
          default:
        }
      }
      if (isCorrect && appState.helpButtonShown == true) {
        appState.helpButtonShown = false;
        appState.postupakShownInformacije = false;
      } else if (!isCorrect && appState.postupakShownInformacije == false) {
        appState.helpButtonShown = true;
      }

      if (isCorrect) {
        appState.netocno = false;
        appState.tocnoVisible = true;
        String audioPath = "yes.mp3";
        playSound(audioPath);
        appState.animationGoing = true;
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
            appState.animationGoing = false;
            generateIndexAndNumber();
            controller.clear();
            opacity =
                1; // Ensure opacity is set to 1 after clearing the text field
            flickerTimer.cancel(); // Stop the flickering effect
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
      if (appState.decimalni == true) {
        switch (from) {
          case 'B':
            if (to == "KB") {
              controller.text = (num / 1000).toString();
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
              controller.text = (num * 1000).toString();
            }
            if (to == "MB") {
              controller.text = (num / 1000).toString();
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
      } else {
        switch (from) {
          case 'B':
            if (to == "KiB") {
              controller.text = (num / 1024).toString();
            }
            if (to == "MiB") {
              controller.text = (num / 1024 / 1024).toStringAsFixed(10);
            }
            if (to == "GiB") {
              controller.text = (num / 1024 / 1024 / 1024).toStringAsFixed(12);
            }
            if (to == "TiB") {
              controller.text =
                  (num / 1024 / 1024 / 1024 / 1024).toStringAsFixed(15);
            }
            break;
          case 'KiB':
            if (to == "B") {
              controller.text = (num * 1024).toString();
            }
            if (to == "MiB") {
              controller.text = (num / 1024).toString();
            }
            if (to == "GiB") {
              controller.text = (num / 1024 / 1024).toStringAsFixed(10);
            }
            if (to == "TiB") {
              controller.text = (num / 1024 / 1024 / 1024).toStringAsFixed(12);
            }
            break;
          case 'MiB':
            if (to == "B") {
              controller.text = (num * 1024 * 1024).toString();
            }
            if (to == "KiB") {
              controller.text = (num * 1024).toString();
            }
            if (to == "GiB") {
              controller.text = (num / 1024).toString();
            }
            if (to == "TiB") {
              controller.text = (num / 1024 / 1024).toStringAsFixed(10);
            }
            break;
          case 'GiB':
            if (to == "B") {
              controller.text = (num * 1024 * 1024 * 1024).toString();
            }
            if (to == "KiB") {
              controller.text = (num * 1024 * 1024).toString();
            }
            if (to == "MiB") {
              controller.text = (num * 1024).toString();
            }
            if (to == "TiB") {
              controller.text = (num / 1024).toString();
            }
            break;
          case 'TiB':
            if (to == "B") {
              controller.text = (num * 1024 * 1024 * 1024 * 1024).toString();
            }
            if (to == "KiB") {
              controller.text = (num * 1024 * 1024 * 1024).toString();
            }
            if (to == "MiB") {
              controller.text = (num * 1024 * 1024).toString();
            }
            if (to == "GiB") {
              controller.text = (num * 1024).toString();
            }
            break;
          default:
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    appState = Provider.of<AppState>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
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
                visible: appState.taskInformacije,
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
                          if (appState.postupakShownInformacije == false) {
                            appState.postupakShownInformacije = true;
                          } else if (appState.postupakShownInformacije ==
                              true) {
                            appState.postupakShownInformacije = false;
                          }
                        });
                      },
                      child: Text(
                        'Trebaš pomoć?',
                        style: TextStyle(
                            fontSize: appState.fontSize == 1
                                ? screenHeight / 31
                                : screenHeight /
                                    31 *
                                    (appState.fontSize - 0.35)),
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
                appState.decimalni == true
                    ? "${valuesDecimalni[valueFromIndex]} = "
                    : "${valuesBinarni[valueFromIndex]} = ",
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
                appState.decimalni == true
                    ? valuesDecimalni[valueToIndex]
                    : valuesBinarni[valueToIndex],
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
                  visible: appState.rjesenjeShownInformacije,
                  child: OutlinedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 212, 171, 36)),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          side: MaterialStateProperty.all<BorderSide>(
                              BorderSide(
                                  color: appState.fontColor, width: 1.5))),
                      onPressed: () {
                        setState(() {
                          completeSolution(
                              numValue,
                              appState.decimalni == true
                                  ? valuesDecimalni[valueFromIndex]
                                  : valuesBinarni[valueFromIndex],
                              appState.decimalni == true
                                  ? valuesDecimalni[valueToIndex]
                                  : valuesBinarni[valueToIndex]);
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
                        numValue,
                        appState.decimalni == true
                            ? valuesDecimalni[valueFromIndex]
                            : valuesBinarni[valueFromIndex],
                        appState.decimalni == true
                            ? valuesDecimalni[valueToIndex]
                            : valuesBinarni[valueToIndex]);
                    if (appState.taskInformacije &&
                        appState.selfTaskInformacije.isNotEmpty &&
                        isCorrect) {
                      appState.selfTaskInformacije.removeAt(0);
                      appState.selfTaskInformacije.removeAt(0);
                      appState.selfTaskInformacije.removeAt(0);
                    }
                    if (appState.taskInformacije &&
                        appState.selfTaskInformacije.isEmpty) {
                      Future.delayed(const Duration(milliseconds: 1500), () {
                        openDialog(
                            screenWidth, screenHeight, appState.fontColor);
                        appState.taskInformacije = false;
                      });
                    }
                  },
                  child: Text('PROVJERI',
                      style: TextStyle(
                          fontSize: appState.fontSize == 1
                              ? screenHeight / 35
                              : screenHeight /
                                  35 *
                                  (appState.fontSize - 0.25)))),
            ],
          ),
          SizedBox(
            height: appState.fontSize == 1 ? 0 : screenHeight / 200,
          ),
          Padding(
            padding:
                EdgeInsets.only(right: screenWidth / 3, left: screenWidth / 3),
            child: Visibility(
                visible: appState.postupakShownInformacije,
                child: Container(
                  width: double.maxFinite,
                  color: const Color.fromARGB(255, 232, 196, 80),
                  child: Padding(
                    padding: EdgeInsets.only(left: screenWidth / 200),
                    child: Text(
                      appState.decimalni == true
                          ? '1 ${valuesDecimalni[valueFromIndex]} = ${setUnitTo(valuesDecimalni[valueFromIndex], valuesDecimalni[valueToIndex]).toString().replaceAll(RegExp(r'([.]*0)(?!.*\d)'), '')} ${valuesDecimalni[valueToIndex]}\n$numValue ${valuesDecimalni[valueFromIndex]} = ($numValue \u2022 ${setUnitTo(valuesDecimalni[valueFromIndex], valuesDecimalni[valueToIndex]).toString().replaceAll(RegExp(r'([.]*0)(?!.*\d)'), '')}) ${valuesDecimalni[valueToIndex]}'
                          : '1 ${valuesBinarni[valueFromIndex]} = ${setUnitTo(valuesBinarni[valueFromIndex], valuesBinarni[valueToIndex]).toString().replaceAll(RegExp(r'([.]*0)(?!.*\d)'), '')} ${valuesBinarni[valueToIndex]}\n$numValue ${valuesBinarni[valueFromIndex]} = ($numValue \u2022 ${setUnitTo(valuesBinarni[valueFromIndex], valuesBinarni[valueToIndex]).toString().replaceAll(RegExp(r'([.]*0)(?!.*\d)'), '')}) ${valuesBinarni[valueToIndex]}',
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
      ],
    );
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
