import 'package:flutter/material.dart';

class MainImage extends StatelessWidget {
  final String path;
  const MainImage({super.key, required this.path});
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      width: 300, // Adjust the width as needed
      height: 200, // Adjust the height as needed
    );
  }
}
