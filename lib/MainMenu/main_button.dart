import 'package:flutter/material.dart';
import 'package:hello_world/app_state.dart';
import 'package:provider/provider.dart';
import 'main_image.dart';

class MainButton extends StatefulWidget {
  final String naziv;
  final Color boja;
  final String imagePath;
  final Widget route;
  const MainButton({
    super.key,
    required this.naziv,
    required this.boja,
    required this.imagePath,
    required this.route,
  });

  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  late AppState appState;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    appState = Provider.of<AppState>(context);
    return Container(
      margin: EdgeInsets.all(screenWidth / 200),
      child: SizedBox(
        width: screenWidth / 2.1,
        height: screenHeight / 5.5,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => widget.route),
            );
          },
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            )),
            backgroundColor: MaterialStateProperty.all(widget.boja),
          ),
          child: Row(
            children: [
              MainImage(
                path: widget.imagePath,
              ),
              SizedBox(
                width: screenWidth / 50,
              ),
              Text(
                widget.naziv,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: screenHeight / 28 * appState.fontSize),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
