import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'zadatci_button.dart';

class Postavke extends StatefulWidget {
  const Postavke({super.key});

  @override
  State<Postavke> createState() => _PostavkeState();
}

class _PostavkeState extends State<Postavke> {
  bool switchPostupak = false;
  bool switchRjesenje = false;
  double currentSliderValue = 1;

  onSwitchMethodPostupak(bool newValue) {
    setState(() {
      switchPostupak = newValue;
    });
  }

  onSwitchMethodRjesenje(bool newValue) {
    setState(() {
      switchRjesenje = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 70.0),
      child: ListView(
        children: [
          const SizedBox(height: 40),
          const Text(
            'Prilagodba zadataka',
            style: TextStyle(fontSize: 40),
          ),
          const Divider(
            thickness: 2,
            color: Colors.black,
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.only(left: 30.0),
            child: Text('Prikaz postupka rješavanja zadataka',
                style: TextStyle(fontSize: 25)),
          ),
          buildSwitchOption('Postupak', switchPostupak, onSwitchMethodPostupak),
          const SizedBox(
            height: 25,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30.0),
            child: Text('Prikaz opcije rješenja zadtaka',
                style: TextStyle(fontSize: 25)),
          ),
          buildSwitchOption('Rješenje', switchRjesenje, onSwitchMethodRjesenje),
          const SizedBox(height: 5),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 3),
            child: Text(
              'Težina zadatka: ${currentSliderValue.round()}',
              style: const TextStyle(fontSize: 25),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 3),
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 20.0,
                activeTrackColor: const Color.fromARGB(255, 22, 56, 74),
                inactiveTrackColor:
                    const Color.fromARGB(255, 22, 56, 74).withOpacity(0.4),
                thumbShape: const RoundSliderThumbShape(
                  enabledThumbRadius: 14.0,
                  pressedElevation: 8.0,
                ),
                thumbColor: Colors.pinkAccent,
                overlayColor: Colors.pink.withOpacity(0.2),
                overlayShape:
                    const RoundSliderOverlayShape(overlayRadius: 32.0),
                tickMarkShape: const RoundSliderTickMarkShape(),
                activeTickMarkColor: Colors.pinkAccent,
                inactiveTickMarkColor: Colors.white,
                valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
                valueIndicatorColor: Colors.black,
                valueIndicatorTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              child: Slider(
                min: 1,
                max: 4,
                value: currentSliderValue,
                divisions: 3,
                label: '${currentSliderValue.round()}',
                onChanged: (value) {
                  setState(() {
                    currentSliderValue = value;
                  });
                },
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 3),
            child: ZadatciButton(),
          )
        ],
      ),
    );
  }

  Padding buildSwitchOption(String title, bool value, Function onSwitchMethod) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style: const TextStyle(fontSize: 35),
                textAlign: TextAlign.left),
            Transform.scale(
                scale: 1.0,
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
