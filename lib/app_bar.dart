import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double height;
  const AppBarCustom({super.key, required this.title, required this.height});
  @override
  Widget build(BuildContext context) {
    return AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(title, style: const TextStyle(color: Colors.white)),
        toolbarHeight: height,
        backgroundColor: const Color.fromARGB(255, 22, 56, 74));
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
