import 'package:flutter/material.dart';

class MainImage extends StatelessWidget {
  final String path;
  const MainImage({super.key, required this.path});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Image.asset(
      path,
      width: screenWidth / 10, // Adjust the width as needed
      height: screenHeight / 7, // Adjust the height as needed
    );
  }
}
