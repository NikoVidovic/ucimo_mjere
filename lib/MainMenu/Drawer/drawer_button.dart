import 'package:flutter/material.dart';

class IzbornikButton extends StatelessWidget {
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
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return (Row(children: [
      IconButton(
          icon: ikona,
          iconSize: screenWidth / 40,
          color: boja,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => route));
          }),
      GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => route),
            );
          },
          child: Text(title,
              style: TextStyle(fontSize: screenHeight / 35, color: boja)))
    ]));
  }
}
