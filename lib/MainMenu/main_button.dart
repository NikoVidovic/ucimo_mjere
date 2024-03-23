import 'package:flutter/material.dart';
import 'main_image.dart';

class MainButton extends StatelessWidget {
  final String naziv;
  final Color boja;
  final String imagePath;
  final Widget route;

  const MainButton({
    Key? key,
    required this.naziv,
    required this.boja,
    required this.imagePath,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: 700, // Adjust the width here
        height: 50, // Adjust the height here
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
              Text(
                naziv,
                style: const TextStyle(color: Colors.white, fontSize: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
