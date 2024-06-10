import 'package:flutter/material.dart';
import 'package:hello_world/MainMenu/o_aplikaciji.dart';
import 'accessability.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';

class AppBarCustom extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final double height;
  final bool imageShown;
  final String imagePath;
  final double imageWidth;
  final double sizedBoxWidth;
  final bool infoShown;
  final bool settingsShown;
  const AppBarCustom(
      {super.key,
      required this.title,
      required this.height,
      required this.imageShown,
      required this.imagePath,
      required this.imageWidth,
      required this.sizedBoxWidth,
      required this.infoShown,
      required this.settingsShown});

  @override
  State<AppBarCustom> createState() => _AppBarCustomState();
  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _AppBarCustomState extends State<AppBarCustom> {
  late AppState appState;
  bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width > 1200;
  bool isPhone(BuildContext context) =>
      MediaQuery.of(context).size.width <= 1200;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    appState = Provider.of<AppState>(context);
    return AppBar(
        titleTextStyle: TextStyle(fontSize: screenHeight / 25),
        iconTheme: IconThemeData(color: Colors.white, size: screenWidth / 35),
        title: Row(
          children: [
            Visibility(
              visible: widget.imageShown,
              child: Image(
                image: AssetImage(widget.imagePath),
                width: widget.imageWidth,
              ),
            ),
            SizedBox(
              width: screenWidth / 100,
            ),
            Text(widget.title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: isTablet(context)
                        ? screenWidth / 50
                        : screenWidth / 50)),
            SizedBox(
              width: widget.sizedBoxWidth,
            ),
            Visibility(
              visible: widget.infoShown,
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OAplikaciji()));
                  },
                  child: Text(
                    'O aplikaciji',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: isTablet(context)
                            ? appState.fontSize == 1
                                ? screenHeight / 40
                                : screenHeight / 40 * (appState.fontSize - 0.2)
                            : screenHeight / 25),
                  )),
            ),
            SizedBox(
              width: isTablet(context) ? screenWidth / 30 : screenWidth / 80,
            ),
            Visibility(
              visible: widget.settingsShown,
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AccessSettings()));
                  },
                  icon: const Icon(Icons.settings)),
            )
          ],
        ),
        toolbarHeight: widget.height,
        backgroundColor: const Color.fromARGB(255, 22, 56, 74));
  }
}
