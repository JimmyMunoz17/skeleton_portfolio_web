import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../shared/custom_decoration.dart';
import '../shared/custom_card.dart';
import '../shared/localization_translate.dart';

class TrainingView extends StatelessWidget {
  const TrainingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //lista que obtiene las traducciones
    List<dynamic> option =
        LocalizationTranslate.of(context)!.translate('Training');
    //Responsivo
    return LayoutBuilder(
        builder: (_, BoxConstraints constraints) => (constraints.maxWidth > 900)
            ? _TableDesktop(constraints, option)
            : _Mobile(constraints, option));
  }

  // ignore: non_constant_identifier_names
  _TableDesktop(BoxConstraints constraints, List<dynamic> option) {
    //lista que obtiene las traducciones
    var items = List<String>.filled(3, '');
    for (var opt in option) {
      items[0] = opt['Title'];
      items[1] = opt['CardName1'];
      items[2] = opt['CardName2'];
    }
    double widthScreen = constraints.maxWidth;
    return Scaffold(
      body: Center(
        child: Container(
          decoration: CustomDecoration.BoxDecorationContainerOpt1(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                child: Text(
                  items[0],
                  style:
                      GoogleFonts.roboto(fontSize: 60, color: Colors.white70),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                FadeInUp(
                  duration: const Duration(seconds: 1),
                  child: CustomCard(
                    text: items[1],
                    fontSizeTxt: (widthScreen < 1150) ? 13 : 22,
                    textSubtitle: '\n2022',
                    fontSizeTxtSubtitle: (widthScreen < 1150) ? 11 : 18,
                    urlImg: 'images/logos/logo_github.png',
                    heightImg: (widthScreen < 1150) ? 110 : 210,
                    widthImg: (widthScreen < 1150) ? 110 : 210,
                    heightContaner: (widthScreen < 1150) ? 200 : 350,
                    widthContaner: (widthScreen < 1150) ? 200 : 350,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                FadeInDown(
                  duration: const Duration(seconds: 1),
                  child: CustomCard(
                    text: items[2],
                    fontSizeTxt: (widthScreen < 1150) ? 12 : 22,
                    textSubtitle: '\n2022',
                    fontSizeTxtSubtitle: (widthScreen < 1150) ? 11 : 18,
                    urlImg: 'images/logos/logo_github.png',
                    heightImg: (widthScreen < 1150) ? 110 : 210,
                    widthImg: (widthScreen < 1150) ? 110 : 210,
                    heightContaner: (widthScreen < 1150) ? 200 : 350,
                    widthContaner: (widthScreen < 1150) ? 200 : 350,
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  _Mobile(BoxConstraints constraints, List<dynamic> option) {
    //lista que obtiene las traducciones
    var items = List<String>.filled(3, '');
    for (var opt in option) {
      items[0] = opt['Title'];
      items[1] = opt['CardName1'];
      items[2] = opt['CardName2'];
    }
    double sizeScreen = constraints.maxWidth;
    return Scaffold(
      body: Center(
        child: Container(
          decoration: CustomDecoration.BoxDecorationContainerOpt1(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                child: Text(
                  items[0],
                  style:
                      GoogleFonts.roboto(fontSize: 40, color: Colors.white70),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeInUp(
                    duration: const Duration(seconds: 1),
                    child: CustomCard(
                      text: items[1],
                      fontSizeTxt: (sizeScreen < 1150) ? 13 : 22,
                      textSubtitle: '\n2022',
                      fontSizeTxtSubtitle: (sizeScreen < 1150) ? 11 : 18,
                      urlImg: 'images/logos/logo_github.png',
                      heightImg: (sizeScreen < 1150) ? 110 : 210,
                      widthImg: (sizeScreen < 1150) ? 110 : 210,
                      heightContaner: (sizeScreen < 1150) ? 200 : 350,
                      widthContaner: (sizeScreen < 1150) ? 200 : 350,
                    ),
                  ),
                  SizedBox(
                    width: (sizeScreen < 430) ? 5 : 15,
                  ),
                  FadeInDown(
                    duration: const Duration(seconds: 1),
                    child: CustomCard(
                      text: items[2],
                      fontSizeTxt: (sizeScreen < 1150) ? 12 : 22,
                      textSubtitle: '\n2022',
                      fontSizeTxtSubtitle: (sizeScreen < 1150) ? 11 : 18,
                      urlImg: 'images/logos/logo_github.png',
                      heightImg: (sizeScreen < 1150) ? 110 : 210,
                      widthImg: (sizeScreen < 1150) ? 110 : 210,
                      heightContaner: (sizeScreen < 1150) ? 200 : 350,
                      widthContaner: (sizeScreen < 1150) ? 200 : 350,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
