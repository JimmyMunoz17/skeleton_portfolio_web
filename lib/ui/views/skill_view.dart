import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../shared/custom_decoration.dart';
import '../shared/custom_card.dart';
import '../shared/localization_translate.dart';

class SkillView extends StatelessWidget {
  const SkillView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //lista que obtiene las traducciones
    List<dynamic> option =
        LocalizationTranslate.of(context)!.translate('Skill');
    //Responsivo
    return LayoutBuilder(
        builder: (_, BoxConstraints constraints) => (constraints.maxWidth > 900)
            ? _TableDesktop(constraints, option)
            : _Mobile(option));
  }

  // ignore: non_constant_identifier_names
  _TableDesktop(BoxConstraints constraints, List<dynamic> option) {
    //lista que obtiene las traducciones
    var items = List<String>.filled(1, '');
    for (var opt in option) {
      items[0] = opt['Title'];
    }
    double widthScreen = constraints.maxWidth;
    return Scaffold(
      body: Center(
        child: Container(
          decoration: CustomDecoration.BoxDecorationContainerOpt3(),
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
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeInUp(
                    duration: const Duration(seconds: 1),
                    child: CustomCard(
                      text: 'GitHub',
                      urlImg: 'images/logos/logo_github.png',
                      heightContaner: (widthScreen < 1150) ? 200 : 250,
                      widthContaner: (widthScreen < 1150) ? 200 : 250,
                      heightImg: (widthScreen < 1150) ? 100 : 160,
                      widthImg: (widthScreen < 1150) ? 100 : 160,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  FadeInUp(
                    duration: const Duration(seconds: 2),
                    child: CustomCard(
                      text: 'Flutter',
                      urlImg: 'images/logos/logo_flutter.png',
                      heightContaner: (widthScreen < 1150) ? 200 : 250,
                      widthContaner: (widthScreen < 1150) ? 200 : 250,
                      heightImg: (widthScreen < 1150) ? 100 : 160,
                      widthImg: (widthScreen < 1150) ? 100 : 160,
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

  // ignore: non_constant_identifier_names
  _Mobile(List<dynamic> option) {
    //lista que obtiene las traducciones
    var items = List<String>.filled(1, '');
    for (var opt in option) {
      items[0] = opt['Title'];
    }
    return Scaffold(
      body: Center(
        child: Container(
          decoration: CustomDecoration.BoxDecorationContainerOpt3(),
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
                    child: const CustomCard(
                      text: 'GitHub',
                      urlImg: 'images/logos/logo_github.png',
                      fontSizeTxt: 20,
                      heightContaner: 150,
                      widthContaner: 150,
                      heightImg: 50,
                      widthImg: 50,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  FadeInUp(
                    duration: const Duration(seconds: 2),
                    child: const CustomCard(
                      text: 'Flutter',
                      urlImg: 'images/logos/logo_flutter.png',
                      fontSizeTxt: 20,
                      heightContaner: 150,
                      widthContaner: 150,
                      heightImg: 50,
                      widthImg: 50,
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
