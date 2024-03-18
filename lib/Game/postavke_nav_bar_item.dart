import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'zadatci_button.dart';

class Postavke extends StatefulWidget {
  final bool allSettingsVisible;
  const Postavke({super.key, required this.allSettingsVisible});

  @override
  State<Postavke> createState() => _PostavkeState();
}

class _PostavkeState extends State<Postavke> {
  bool switchPostupak = false;
  bool switchRjesenje = false;
  bool switchDuljina = true;
  bool switchVrijeme = true;
  bool switchMasa = true;
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

  onSwitchMethodDuljina(bool newValue) {
    setState(() {
      if (switchVrijeme == true || switchMasa == true) {
        switchDuljina = newValue;
      } else {
        const snackBar = SnackBar(
          content: Text(
            'Barem jedna od kategorija mora biti uključena',
            textAlign: TextAlign.center,
          ),
          duration: Duration(seconds: 2),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }

  onSwitchMethodVrijeme(bool newValue) {
    setState(() {
      if (switchDuljina == true || switchMasa == true) {
        switchVrijeme = newValue;
      } else {
        const snackBar = SnackBar(
          content: Text(
            'Barem jedna od kategorija mora biti uključena',
            textAlign: TextAlign.center,
          ),
          duration: Duration(seconds: 2),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }

  onSwitchMethodMasa(bool newValue) {
    setState(() {
      if (switchVrijeme == true || switchDuljina == true) {
        switchMasa = newValue;
      } else {
        const snackBar = SnackBar(
          content: Text(
            'Barem jedna od kategorija mora biti uključena',
            textAlign: TextAlign.center,
          ),
          duration: Duration(seconds: 2),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
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
            'Prilagodite postavke',
            style: TextStyle(fontSize: 40),
          ),
          const Divider(
            thickness: 2,
            color: Colors.black,
          ),
          const SizedBox(height: 10),
          buildSwitchOption('Postupak', switchPostupak, onSwitchMethodPostupak),
          buildSwitchOption('Rješenje', switchRjesenje, onSwitchMethodRjesenje),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 3),
            child: Text(
              'Težina zadatka: ${currentSliderValue.round()}',
              style: const TextStyle(fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 3),
            child: Slider(
                value: currentSliderValue,
                min: 1,
                max: 4,
                divisions: 3,
                label: currentSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    currentSliderValue = value;
                  });
                }),
          ),
          Visibility(
            visible: widget.allSettingsVisible,
            child: buildSwitchOption(
                'Duljina', switchDuljina, onSwitchMethodDuljina),
          ),
          Visibility(
            visible: widget.allSettingsVisible,
            child: buildSwitchOption(
                'Vrijeme', switchVrijeme, onSwitchMethodVrijeme),
          ),
          Visibility(
            visible: widget.allSettingsVisible,
            child: buildSwitchOption('Masa', switchMasa, onSwitchMethodMasa),
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
            Text(title, style: const TextStyle(fontSize: 20)),
            Transform.scale(
                scale: 0.7,
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
