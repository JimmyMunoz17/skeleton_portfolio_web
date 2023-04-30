import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../shared/custom_decoration.dart';
import '../shared/custom_button_icon_opt.dart';
import '../shared/custom_button_opt.dart';
import '../shared/custom_card_proyect.dart';
import '../shared/localization_translate.dart';

class ProyectView extends StatefulWidget {
  const ProyectView({Key? key}) : super(key: key);

  @override
  State<ProyectView> createState() => _ProyectViewState();
}

class _ProyectViewState extends State<ProyectView> {
  final List<Widget> listCard = [];
  // ignore: non_constant_identifier_names
  int _IndexCard = 0;

  @override
  void didChangeDependencies() {
    listCard.add(_WebBodyOpt(context));
    listCard.add(_MobileBodyOpt(context));
    listCard.add(_ArVideoGameBodyOpt(context));
    super.didChangeDependencies();
  }

  void incrementCard(index) {
    setState(() {
      _IndexCard = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //lista que obtiene las traducciones
    List<dynamic> option =
        LocalizationTranslate.of(context)!.translate('Proyect');
    var items = List<String>.filled(4, '');
    for (var opt in option) {
      items[0] = opt['Title'];
      items[1] = opt['Botton1'];
      items[2] = opt['Botton2'];
      items[3] = opt['Botton3'];
    }

    final Size sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: CustomDecoration.BoxDecorationContainerOpt3(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              //Responsivo los texto fittedBox
              FittedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    items[0],
                    style: GoogleFonts.roboto(
                        fontSize: (sizeScreen.width < 1000) ? 40 : 60,
                        color: Colors.white70),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButtonOpt(
                      text: items[1],
                      fontSizeText: (sizeScreen.width < 430) ? 18 : 20,
                      borderRadius: 20,
                      sizeWidth: (sizeScreen.width < 1000) ? 110 : 200,
                      sizeHeight: (sizeScreen.width < 430) ? 40 : 50,
                      onPressed: () => incrementCard(0)),
                  const SizedBox(
                    width: 15,
                  ),
                  CustomButtonOpt(
                      text: items[2],
                      fontSizeText: (sizeScreen.width < 430) ? 18 : 20,
                      borderRadius: 20,
                      sizeWidth: (sizeScreen.width < 1000) ? 110 : 200,
                      sizeHeight: (sizeScreen.width < 430) ? 40 : 50,
                      onPressed: () => incrementCard(1)),
                  const SizedBox(
                    width: 15,
                  ),
                  CustomButtonOpt(
                      text: (sizeScreen.width < 1000) ? 'AR/VG' : items[3],
                      fontSizeText: (sizeScreen.width < 430) ? 18 : 20,
                      borderRadius: 20,
                      sizeWidth: (sizeScreen.width < 1000) ? 110 : 200,
                      sizeHeight: (sizeScreen.width < 430) ? 40 : 50,
                      onPressed: () => incrementCard(2)),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 600,
                child: Scrollbar(
                  child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      scrollDirection: Axis.vertical,
                      child: listCard[_IndexCard]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  _WebBodyOpt(BuildContext context) {
    double sizeScreen = MediaQuery.of(context).size.width;
    //lista que obtiene las traducciones
    List<dynamic> option =
        LocalizationTranslate.of(context)!.translate('Proyect');
    var items = List<dynamic>.filled(1, '');
    var item = List<String>.filled(2, '');
    for (var opt in option) {
      items[0] = opt['ProyectWeb1'];
    }
    items[0].forEach((opt) {
      item[0] = opt['Name'];
      item[1] = opt['Description'];
    });
    return Wrap(
      direction: Axis.horizontal,
      spacing: 20,
      runSpacing: 20,
      children: [
        BounceInUp(
          duration: const Duration(seconds: 1),
          child: CustomCardProyect(
            txtTitle: item[0],
            fontSizeTxtTitle: 28,
            textSubtitle: item[1],
            fontSizeTxtSubtitle: 15,
            image: Image.asset(
              'images/logos/logo_github.png',
              width: 200,
              height: 100,
            ),
            widthContaner: 450,
            heightContaner: 400,
            button1: CustomButtonIconOpt(
                text: 'DEMO',
                fontSizeText: (sizeScreen < 430) ? 18 : 20,
                borderRadius: 20,
                sizeHeight: (sizeScreen < 430) ? 35 : 40,
                sizeWidth: (sizeScreen < 430) ? 150 : 180,
                iconImage: Image.asset(
                  'images/icons/icon_eye.png',
                  width: (sizeScreen < 430) ? 20 : 25,
                  height: (sizeScreen < 430) ? 20 : 25,
                  alignment: Alignment.centerLeft,
                ),
                onPressed: () {}),
            button2: CustomButtonIconOpt(
                text: 'REPO',
                fontSizeText: (sizeScreen < 430) ? 18 : 20,
                borderRadius: 20,
                sizeHeight: (sizeScreen < 430) ? 35 : 40,
                sizeWidth: (sizeScreen < 430) ? 150 : 180,
                iconImage: Image.asset(
                  'images/logos/logo_github.png',
                  width: (sizeScreen < 430) ? 20 : 28,
                  height: (sizeScreen < 430) ? 20 : 28,
                  alignment: Alignment.centerLeft,
                ),
                onPressed: () {}),
          ),
        ),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  _MobileBodyOpt(BuildContext context) {
    double sizeScreen = MediaQuery.of(context).size.width;
    //lista que obtiene las traducciones
    List<dynamic> option =
        LocalizationTranslate.of(context)!.translate('Proyect');
    var items = List<dynamic>.filled(1, '');
    var item = List<String>.filled(2, '');
    for (var opt in option) {
      items[0] = opt['ProyectMobile1'];
    }
    items[0].forEach((opt) {
      item[0] = opt['Name'];
      item[1] = opt['Description'];
    });
    return Wrap(
      direction: Axis.horizontal,
      spacing: 20,
      runSpacing: 20,
      children: [
        BounceInUp(
          duration: const Duration(seconds: 1),
          child: CustomCardProyect(
            txtTitle: item[0],
            fontSizeTxtTitle: 28,
            textSubtitle: item[1],
            fontSizeTxtSubtitle: 20,
            image: Image.asset(
              'images/logos/logo_github.png',
              width: 200,
              height: 100,
            ),
            widthContaner: 450,
            heightContaner: 400,
            button1: CustomButtonIconOpt(
                text: 'DEMO',
                fontSizeText: (sizeScreen < 430) ? 18 : 20,
                borderRadius: 20,
                sizeHeight: (sizeScreen < 430) ? 35 : 40,
                sizeWidth: (sizeScreen < 430) ? 150 : 180,
                iconImage: Image.asset(
                  'images/icons/icon_eye.png',
                  width: (sizeScreen < 430) ? 20 : 25,
                  height: (sizeScreen < 430) ? 20 : 25,
                  alignment: Alignment.centerLeft,
                ),
                onPressed: () {}),
            button2: CustomButtonIconOpt(
                text: 'REPO',
                fontSizeText: (sizeScreen < 430) ? 18 : 20,
                borderRadius: 20,
                sizeHeight: (sizeScreen < 430) ? 35 : 40,
                sizeWidth: (sizeScreen < 430) ? 150 : 180,
                iconImage: Image.asset(
                  'images/logos/logo_github.png',
                  width: (sizeScreen < 430) ? 20 : 28,
                  height: (sizeScreen < 430) ? 20 : 28,
                  alignment: Alignment.centerLeft,
                ),
                onPressed: () {}),
          ),
        ),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  _ArVideoGameBodyOpt(BuildContext context) {
    double sizeScreen = MediaQuery.of(context).size.width;
    //lista que obtiene las traducciones
    List<dynamic> option =
        LocalizationTranslate.of(context)!.translate('Proyect');
    var items = List<dynamic>.filled(2, '');
    var item = List<String>.filled(4, '');
    for (var opt in option) {
      items[0] = opt['ProyectARV1'];
      items[1] = opt['ProyectARV2'];
    }
    items[0].forEach((opt) {
      item[0] = opt['Name'];
      item[1] = opt['Description'];
    });
    items[1].forEach((opt) {
      item[2] = opt['Name'];
      item[3] = opt['Description'];
    });
    return Wrap(
      direction: Axis.horizontal,
      spacing: 20,
      runSpacing: 20,
      children: [
        BounceInUp(
          duration: const Duration(seconds: 1),
          child: CustomCardProyect(
            txtTitle: item[0],
            fontSizeTxtTitle: 28,
            textSubtitle: item[1],
            fontSizeTxtSubtitle: 15,
            image: Image.asset(
              'images/logos/logo_github.png',
              width: 400,
              height: 140,
            ),
            widthContaner: 450,
            heightContaner: 400,
            button1: CustomButtonIconOpt(
                text: 'DEMO',
                fontSizeText: (sizeScreen < 430) ? 18 : 20,
                borderRadius: 20,
                sizeHeight: (sizeScreen < 430) ? 35 : 40,
                sizeWidth: (sizeScreen < 430) ? 150 : 180,
                iconImage: Image.asset(
                  'images/icons/icon_eye.png',
                  width: (sizeScreen < 430) ? 20 : 25,
                  height: (sizeScreen < 430) ? 20 : 25,
                  alignment: Alignment.centerLeft,
                ),
                onPressed: () => null),
            button2: CustomButtonIconOpt(
                text: 'REPO',
                fontSizeText: (sizeScreen < 430) ? 18 : 20,
                borderRadius: 20,
                sizeHeight: (sizeScreen < 430) ? 35 : 40,
                sizeWidth: (sizeScreen < 430) ? 150 : 180,
                iconImage: Image.asset(
                  'images/logos/logo_github.png',
                  width: (sizeScreen < 430) ? 20 : 28,
                  height: (sizeScreen < 430) ? 20 : 28,
                  alignment: Alignment.centerLeft,
                ),
                onPressed: () => null),
          ),
        ),
        BounceInUp(
          duration: const Duration(seconds: 1),
          child: CustomCardProyect(
            txtTitle: item[2],
            fontSizeTxtTitle: 28,
            textSubtitle: item[3],
            fontSizeTxtSubtitle: 15,
            image: Image.asset(
              'images/logos/logo_github.png',
              width: 540,
              height: 140,
            ),
            widthContaner: 450,
            heightContaner: 400,
            button1: CustomButtonIconOpt(
                text: 'DEMO',
                fontSizeText: (sizeScreen < 430) ? 18 : 20,
                borderRadius: 20,
                sizeHeight: (sizeScreen < 430) ? 35 : 40,
                sizeWidth: (sizeScreen < 430) ? 150 : 180,
                iconImage: Image.asset(
                  'images/icons/icon_eye.png',
                  width: (sizeScreen < 430) ? 20 : 25,
                  height: (sizeScreen < 430) ? 20 : 25,
                  alignment: Alignment.centerLeft,
                ),
                onPressed: () {}),
            button2: CustomButtonIconOpt(
                text: 'REPO',
                fontSizeText: (sizeScreen < 430) ? 18 : 20,
                borderRadius: 20,
                sizeHeight: (sizeScreen < 430) ? 35 : 40,
                sizeWidth: (sizeScreen < 430) ? 150 : 180,
                iconImage: Image.asset(
                  'images/logos/logo_github.png',
                  width: (sizeScreen < 430) ? 20 : 28,
                  height: (sizeScreen < 430) ? 20 : 28,
                  alignment: Alignment.centerLeft,
                ),
                onPressed: () {}),
          ),
        )
      ],
    );
  }
}
