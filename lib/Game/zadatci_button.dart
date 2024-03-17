import 'package:flutter/material.dart';

class ZadatciButton extends StatelessWidget {
  const ZadatciButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 22, 56, 74)),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            minimumSize: MaterialStateProperty.all<Size>(
                const Size.square(50))), // Adjust the size as needed
        onPressed: () {},
        child: const Text('UNESITE VLASTITI ZADATAK'));
  }
}
