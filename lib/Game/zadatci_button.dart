import 'package:flutter/material.dart';

class ZadatciButton extends StatelessWidget {
  const ZadatciButton({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return OutlinedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 22, 56, 74)),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            minimumSize: MaterialStateProperty.all<Size>(
                Size.square(screenWidth / 25))), // Adjust the size as needed
        onPressed: () {},
        child: Text(
          'UNESITE VLASTITI ZADATAK',
          style: TextStyle(fontSize: screenHeight / 38),
        ));
  }
}
