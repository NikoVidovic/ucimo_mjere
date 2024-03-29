import 'package:flutter/material.dart';
import 'main_image.dart';

class MainButton extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 620, // Adjust the width here
        height: 144, // Adjust the height here
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => route),
            );
          },
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            )),
            backgroundColor: MaterialStateProperty.all(boja),
          ),
          child: Row(
            children: [
              MainImage(
                path: imagePath,
              ),
              const SizedBox(
                width: 30,
              ),
              Text(
                naziv,
                style: const TextStyle(color: Colors.white, fontSize: 23),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
