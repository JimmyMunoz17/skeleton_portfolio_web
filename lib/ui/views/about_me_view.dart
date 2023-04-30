import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';

import '../shared/custom_decoration.dart';
import '../shared/localization_translate.dart';

class AboutMeView extends StatelessWidget {
  const AboutMeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //lista que obtiene las traducciones
    List<dynamic> option =
        LocalizationTranslate.of(context)!.translate('AboutMe');
    //Responsivo
    return LayoutBuilder(
        builder: (_, BoxConstraints constraints) =>
            (constraints.maxWidth > 1165)
                ? _TableDesktop(option)
                : _Mobile(option));
  }

  // ignore: non_constant_identifier_names
  _TableDesktop(List<dynamic> option) {
    //lista que obtiene las traducciones
    var items = List<String>.filled(3, '');
    for (var opt in option) {
      items[0] = opt['Title'];
      items[1] = opt['Message1'];
      items[2] = opt['Message2'];
    }
    return Scaffold(
        body: Center(
      child: Container(
        decoration: CustomDecoration
            .BoxDecorationContainerOpt1(), //_BoxDecorationContainer(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                items[0],
                style: GoogleFonts.roboto(fontSize: 50, color: Colors.white70),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 500,
                    child: FadeInLeft(
                        duration: const Duration(seconds: 1),
                        child: Image.asset('images/icons/icon_user.png'))),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.only(right: 80),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText.rich(
                          TextSpan(
                              text: "Nombre | Name\n",
                              style: GoogleFonts.roboto(
                                  fontSize: 35, color: Colors.white70),
                              children: <TextSpan>[
                                TextSpan(
                                    text: items[1],
                                    style: const TextStyle(fontSize: 22)),
                                TextSpan(
                                    text: items[2],
                                    style: const TextStyle(fontSize: 22)),
                              ]),
                          minFontSize: 10,
                          maxLines: 28,
                        ),
                        const SizedBox(
                          width: 50,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }

  // ignore: non_constant_identifier_names
  _Mobile(List<dynamic> option) {
    //lista que obtiene las traducciones
    var items = List<String>.filled(3, '');
    for (var opt in option) {
      items[0] = opt['Title'];
      items[1] = opt['Message1'];
      items[2] = opt['Message2'];
    }
    return Scaffold(
        body: Center(
      child: Container(
        width: double.infinity,
        decoration: CustomDecoration.BoxDecorationContainerOpt1(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Text(
                items[0],
                style: GoogleFonts.roboto(fontSize: 40, color: Colors.white70),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText.rich(
                    TextSpan(
                        text: "Jimmy Muñoz\n",
                        style: GoogleFonts.roboto(
                            fontSize: 32, color: Colors.white70),
                        children: <TextSpan>[
                          TextSpan(
                              text: items[1],
                              style: const TextStyle(fontSize: 15)),
                          TextSpan(
                              text: items[2],
                              style: const TextStyle(fontSize: 15)),
                        ]),
                    minFontSize: 9,
                    maxLines: 35,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                width: 300,
                child: FadeInLeft(
                  duration: const Duration(seconds: 1),
                  child: Image.asset('images/icons/icon_user.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
