import 'package:flutter/material.dart';
import 'package:hello_world/app_bar.dart';
import 'bottom_app_bar.dart';
import 'postavke_body.dart';

class Postavke extends StatelessWidget {
  const Postavke({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: AppBarCustom(title: 'Postavke', height: 100.0),
        bottomNavigationBar: BottomAppBarCustom(),
        body: PostavkeBody());
  }
}
