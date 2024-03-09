import 'package:flutter/material.dart';
import 'game.dart';
import 'main_image.dart';

class MainButton extends StatelessWidget {
  final String naziv;
  final Color boja;
  final String imagePath;
  const MainButton(
      {super.key,
      required this.naziv,
      required this.boja,
      required this.imagePath});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(16.0),
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Game()),
              );
            },
            style: ButtonStyle(
                minimumSize:
                    MaterialStateProperty.all(const Size(double.infinity, 220)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0))),
                backgroundColor: MaterialStateProperty.all(boja)),
            child: Row(children: [
              MainImage(path: imagePath),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: const EdgeInsets.only(left: 26.0),
                      child: Text(naziv,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 30))))
            ])));
  }
}
