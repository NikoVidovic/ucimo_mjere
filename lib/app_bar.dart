import 'package:flutter/material.dart';
import 'accessability.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double height;
  final bool imageShown;
  final String imagePath;
  final double imageWidth;
  final double sizedBoxWidth;
  const AppBarCustom(
      {super.key,
      required this.title,
      required this.height,
      required this.imageShown,
      required this.imagePath,
      required this.imageWidth,
      required this.sizedBoxWidth});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return AppBar(
        titleTextStyle: TextStyle(fontSize: screenHeight / 25),
        iconTheme: IconThemeData(color: Colors.white, size: screenWidth / 35),
        title: Row(
          children: [
            Visibility(
              visible: imageShown,
              child: Image(
                image: AssetImage(imagePath),
                width: imageWidth,
              ),
            ),
            SizedBox(
              width: screenWidth / 100,
            ),
            Text(title, style: const TextStyle(color: Colors.white)),
            SizedBox(
              width: sizedBoxWidth,
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AccessSettings()));
                },
                icon: const Icon(Icons.settings))
          ],
        ),
        toolbarHeight: height,
        backgroundColor: const Color.fromARGB(255, 22, 56, 74));
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
