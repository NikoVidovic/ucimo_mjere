import 'package:flutter/material.dart';
import 'package:hello_world/app_bar.dart';
import 'package:provider/provider.dart';

import '../app_state.dart';

class OAplikaciji extends StatefulWidget {
  const OAplikaciji({super.key});

  @override
  State<OAplikaciji> createState() => _OAplikacijiState();
}

class _OAplikacijiState extends State<OAplikaciji> {
  late AppState appState;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    appState = Provider.of<AppState>(context);
    return (Scaffold(
        backgroundColor: appState.backgroundColor,
        appBar: AppBarCustom(
          title: 'O aplikaciji',
          height: screenHeight / 9,
          imageShown: false,
          imagePath: '',
          imageWidth: 0,
          sizedBoxWidth: screenWidth / 1.56,
          infoShown: false,
          settingsShown: true,
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Container(
                margin: EdgeInsets.only(
                    left: screenWidth / 20, top: screenHeight / 18),
                child: Image.asset(
                  'assets/ic_launcher.png',
                  height: screenHeight / 11,
                  width: screenWidth / 20,
                )),
            Container(
                margin: EdgeInsets.only(
                    top: screenHeight / 15, left: screenWidth / 70),
                child: Text(
                  'Učimo mjere',
                  style: TextStyle(
                      fontSize: screenWidth / 30, color: appState.fontColor),
                ))
          ]),
          Container(
            margin:
                EdgeInsets.only(top: screenHeight / 75, left: screenWidth / 20),
            child: Text(
                'Aplikacija je razvijena 2017. uz financijsku potporu Ministarstva znanosti i obrazovanja u okviru '
                'projekta Učimo matematiku. Partneri su Hrvatska zajednica za Down sindrom, Fakultet elektrotehnike i računarstva Sveučilišta u Zagrebu i O.Š. Trnjanska.\n'
                '\nNajnovija verzija aplikacije razvijena je 2024. u okviru završnog rada na Fakultetu elektrotehnike i računarstva Sveučilišta u Zagrebu u suradnji '
                's Edukacijsko-rehabilitacijskim fakultetom u Zagrebu. Ovu verziju aplikacije razvio je student Niko Vidović. Završni rad mentorirala je prof. dr. sc. Željka Car uz asistenticu dr. '
                'sc. Mateu Žilak. Stručna suradnica: Ivana Vinceković, univ. mag. rehab. educ.\n'
                '\nOstale aplikacije pronađite na stranicama Kompetencijske mreže ICT-AAC (www.ict-aac.hr).\n'
                '\nPratite nas na društvenim mrežama: facebook.com/ictaac'
                '\nUpoznajte se s politikom privatnosti naših aplikacija: http://www.ict-aac.hr/index.php/hr/politika-privatnosti\n'
                '\nSva prava pridržana.',
                style: TextStyle(
                    fontSize: appState.fontSize == 1
                        ? screenHeight / 38
                        : screenHeight / 38 * (appState.fontSize - 0.4),
                    color: appState.fontColor)),
          )
        ])));
  }
}
