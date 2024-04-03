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
        appBar: const AppBarCustom(
            title: 'Pristupačnost',
            height: 100,
            imageShown: false,
            imagePath: '',
            imageWidth: 0,
            sizedBoxWidth: 900),
        body: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 30, top: 15),
              child: Text(
                'Promjeni pozadinu aplikacije',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Text(
                    'Pozadina',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Second Widget (IconButton)
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/ic_launcher.png',
                          width: 150,
                        ),
                      ),
                      // Third Widget (IconButton)
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/ic_launcher.png',
                          width: 150,
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
