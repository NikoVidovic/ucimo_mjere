import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_state.dart';
import 'zadatci_button.dart';

class Postavke extends StatefulWidget {
  const Postavke({super.key});

  @override
  State<Postavke> createState() => _PostavkeState();
}

class _PostavkeState extends State<Postavke> {
  late AppState appState;

  onSwitchMethodPostupak(bool newValue) {
    setState(() {
      if (newValue == true) {
        appState.postupakShown = true;
      } else {
        appState.postupakShown = false;
      }
    });
  }

  onSwitchMethodRjesenje(bool newValue) {
    setState(() {
      if (newValue == true) {
        appState.rjesenjeShown = true;
      } else {
        appState.rjesenjeShown = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    appState = Provider.of<AppState>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(left: screenWidth / 20),
      child: ListView(
        children: [
          SizedBox(height: screenHeight / 20),
          Text(
            'Prilagodba zadataka',
            style: TextStyle(
                fontSize: screenHeight / 18, color: appState.fontColor),
          ),
          const Divider(
            thickness: 2,
            color: Colors.black,
          ),
          SizedBox(height: screenHeight / 50),
          Padding(
            padding: EdgeInsets.only(left: screenWidth / 43),
            child: Text('Prikaz postupka rješavanja zadataka',
                style: TextStyle(
                    fontSize: screenHeight / 31, color: appState.fontColor)),
          ),
          buildSwitchOption(
              'Postupak', appState.postupakShown, onSwitchMethodPostupak),
          SizedBox(
            height: screenHeight / 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: screenWidth / 43),
            child: Text('Prikaz opcije rješenja zadataka',
                style: TextStyle(
                    fontSize: screenHeight / 31, color: appState.fontColor)),
          ),
          buildSwitchOption(
              'Rješenje', appState.rjesenjeShown, onSwitchMethodRjesenje),
          SizedBox(
            height: screenHeight / 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth / 43, vertical: screenHeight / 300),
            child: Text(
              'Težina zadatka: ${appState.currentSliderValue.round()}',
              style: TextStyle(
                  fontSize: screenHeight / 31, color: appState.fontColor),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth / 43, vertical: screenHeight / 300),
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: screenHeight / 40,
                activeTrackColor: const Color.fromARGB(255, 22, 56, 74),
                inactiveTrackColor:
                    const Color.fromARGB(255, 22, 56, 74).withOpacity(0.4),
                thumbShape: RoundSliderThumbShape(
                  enabledThumbRadius: screenHeight / 50,
                ),
                thumbColor: Colors.pinkAccent,
                overlayColor: Colors.pink.withOpacity(0.2),
                overlayShape:
                    RoundSliderOverlayShape(overlayRadius: screenHeight / 50),
                tickMarkShape: const RoundSliderTickMarkShape(),
                activeTickMarkColor: Colors.pinkAccent,
                inactiveTickMarkColor: Colors.white,
                valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
                valueIndicatorColor: Colors.black,
                valueIndicatorTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: screenHeight / 30,
                ),
              ),
              child: Slider(
                min: 1,
                max: 4,
                value: appState.currentSliderValue,
                divisions: 3,
                label: '${appState.currentSliderValue.round()}',
                onChanged: (value) {
                  setState(() {
                    appState.currentSliderValue = value;
                  });
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth / 43, vertical: screenHeight / 300),
            child: const ZadatciButton(),
          )
        ],
      ),
    );
  }

  Padding buildSwitchOption(String title, bool value, Function onSwitchMethod) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth / 43, vertical: screenHeight / 300),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style: TextStyle(
                    fontSize: screenHeight / 23, color: appState.fontColor),
                textAlign: TextAlign.left),
            Transform.scale(
                scale: screenHeight / 500,
                child: CupertinoSwitch(
                  activeColor: Colors.orange,
                  trackColor: Colors.grey,
                  value: value,
                  onChanged: (bool newValue) {
                    onSwitchMethod(newValue);
                  },
                ))
          ],
        ));
  }
}
