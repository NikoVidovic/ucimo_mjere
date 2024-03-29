import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double height;
  final bool imageShown;
  final String imagePath;
  final double imageWidth;
  const AppBarCustom(
      {super.key,
      required this.title,
      required this.height,
      required this.imageShown,
      required this.imagePath,
      required this.imageWidth});
  @override
  Widget build(BuildContext context) {
    return AppBar(
        titleTextStyle: const TextStyle(fontSize: 30),
        iconTheme: const IconThemeData(color: Colors.white, size: 40),
        title: Row(
          children: [
            Visibility(
              visible: imageShown,
              child: Image(
                image: AssetImage(imagePath),
                width: imageWidth,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(title, style: const TextStyle(color: Colors.white)),
          ],
        ),
        toolbarHeight: height,
        backgroundColor: const Color.fromARGB(255, 22, 56, 74));
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
