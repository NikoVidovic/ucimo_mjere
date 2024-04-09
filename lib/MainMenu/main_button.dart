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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.all(screenWidth / 200),
      child: SizedBox(
        width: screenWidth / 2.1, // Adjust the width here
        height: screenHeight / 5.5, // Adjust the height here
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
              SizedBox(
                width: screenWidth / 50,
              ),
              Text(
                naziv,
                style:
                    TextStyle(color: Colors.white, fontSize: screenHeight / 28),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
