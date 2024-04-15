import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_state.dart';

class IzbornikButton extends StatefulWidget {
  final Icon ikona;
  final String title;
  final Widget route;
  final Color boja;
  const IzbornikButton(
      {super.key,
      required this.ikona,
      required this.title,
      required this.route,
      required this.boja});

  @override
  State<IzbornikButton> createState() => _IzbornikButtonState();
}

class _IzbornikButtonState extends State<IzbornikButton> {
  late AppState appState;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    appState = Provider.of<AppState>(context);
    return (Row(children: [
      IconButton(
          icon: widget.ikona,
          iconSize: screenWidth / 40 * appState.fontSize,
          color: widget.boja,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => widget.route));
          }),
      GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => widget.route),
            );
          },
          child: Text(widget.title,
              style: TextStyle(
                  fontSize: screenHeight / 35 * appState.fontSize,
                  color: widget.boja)))
    ]));
  }
}
