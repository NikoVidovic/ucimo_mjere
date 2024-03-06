import 'package:flutter/material.dart';
import 'main.dart';

class IzbornikButton extends StatelessWidget {
  final Icon ikona;
  final String title;
  const IzbornikButton({super.key, required this.ikona, required this.title});
  @override
  Widget build(BuildContext context) {
    return (Row(children: [
      IconButton(
          icon: ikona,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MainMenu()));
          }),
      GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MainMenu()),
            );
          },
          child: Text(title))
    ]));
  }
}
