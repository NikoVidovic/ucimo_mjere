import 'package:flutter/material.dart';

class IzbornikButton extends StatelessWidget {
  final Icon ikona;
  final String title;
  final Widget route;
  const IzbornikButton(
      {super.key,
      required this.ikona,
      required this.title,
      required this.route});
  @override
  Widget build(BuildContext context) {
    return (Row(children: [
      IconButton(
          icon: ikona,
          iconSize: 30,
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
          child: Text(title, style: const TextStyle(fontSize: 20)))
    ]));
  }
}
