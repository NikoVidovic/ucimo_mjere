import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/Game/Povrsina/povrsina_zadatci_button.dart';
import 'package:provider/provider.dart';
import '../../app_state.dart';

class PostavkePovrsina extends StatefulWidget {
  final void Function(int) switchToTab;
  const PostavkePovrsina({
    required this.switchToTab,
    super.key,
  });

  @override
  State<PostavkePovrsina> createState() => _PostavkePovrsinaState();
}

class _PostavkePovrsinaState extends State<PostavkePovrsina> {
  late AppState appState;

  onSwitchMethodPostupak(bool newValue) {
    setState(() {
      if (newValue == true) {
        appState.postupakShownPovrsina = true;
      } else {
        appState.postupakShownPovrsina = false;
      }
    });
  }

  onSwitchMethodRjesenje(bool newValue) {
    setState(() {
      if (newValue == true) {
        appState.rjesenjeShownPovrsina = true;
      } else {
        appState.rjesenjeShownPovrsina = false;
      }
    });
  }

  bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width > 1440;
  bool isPhone(BuildContext context) =>
      MediaQuery.of(context).size.width <= 1440;
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
          Row(
            children: [
              Text(
                'Prilagodba zadataka',
                style: TextStyle(
                    fontSize: screenHeight / 18, color: appState.fontColor),
              ),
              SizedBox(
                width: screenWidth / 2.3,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: appState.backgroundColor == Colors.white
                        ? MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 22, 56, 74))
                        : MaterialStateProperty.all<Color>(appState.fontColor),
                    minimumSize: MaterialStateProperty.all<Size>(
                        Size.square(screenWidth / 35)),
                  ),
                  onPressed: () {
                    widget.switchToTab(0);
                  },
                  child: Text("SPREMI",
                      style: TextStyle(
                        color: appState.backgroundColor,
                        fontSize: isTablet(context)
                            ? appState.fontSize == 1
                                ? screenHeight / 35
                                : screenHeight / 35 * (appState.fontSize - 0.25)
                            : screenHeight / 25,
                      )))
            ],
          ),
          Divider(
            thickness: 2,
            color: appState.fontColor,
          ),
          SizedBox(height: screenHeight / 50),
          Padding(
            padding: EdgeInsets.only(left: screenWidth / 43),
            child: Text('Prikaz postupka rješavanja zadataka',
                style: TextStyle(
                    fontSize: appState.fontSize == 1
                        ? screenHeight / 31
                        : screenHeight / 31 * (appState.fontSize - 0.3),
                    color: appState.fontColor)),
          ),
          buildSwitchOption('Postupak', appState.postupakShownPovrsina,
              onSwitchMethodPostupak),
          SizedBox(
            height: screenHeight / 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: screenWidth / 43),
            child: Text('Prikaz opcije rješenja zadataka',
                style: TextStyle(
                    fontSize: appState.fontSize == 1
                        ? screenHeight / 31
                        : screenHeight / 31 * (appState.fontSize - 0.3),
                    color: appState.fontColor)),
          ),
          buildSwitchOption('Rješenje', appState.rjesenjeShownPovrsina,
              onSwitchMethodRjesenje),
          SizedBox(
            height: screenHeight / 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth / 43, vertical: screenHeight / 300),
            child: Text(
              'Težina zadatka: ${appState.currentSliderValuePovrsina.round()}',
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
                activeTrackColor: appState.backgroundColor == Colors.white
                    ? const Color.fromARGB(255, 22, 56, 74)
                    : appState.fontColor,
                inactiveTrackColor: appState.backgroundColor == Colors.white
                    ? const Color.fromARGB(255, 22, 56, 74).withOpacity(0.4)
                    : appState.fontColor.withOpacity(0.4),
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
                valueIndicatorColor: appState.fontColor,
                valueIndicatorTextStyle: TextStyle(
                  color: appState.backgroundColor,
                  fontSize: screenHeight / 30,
                ),
              ),
              child: Slider(
                min: 1,
                max: 4,
                value: appState.currentSliderValuePovrsina,
                divisions: 3,
                label: '${appState.currentSliderValuePovrsina.round()}',
                onChanged: (value) {
                  setState(() {
                    appState.currentSliderValuePovrsina = value;
                  });
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth / 43, vertical: screenHeight / 300),
            child: const ZadatciButtonPovrsina(),
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
                    fontSize: appState.fontSize == 1
                        ? screenHeight / 23
                        : screenHeight / 23 * (appState.fontSize - 0.3),
                    color: appState.fontColor),
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
