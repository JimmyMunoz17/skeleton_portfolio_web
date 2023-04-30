import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../provider/home_page_provider.dart';
import '../layout/sidebar.dart';
import '../shared/custom_decoration.dart';
import '../shared/custom_button_opt.dart';
import '../shared/localization_translate.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //lista que obtiene las traducciones
    List<dynamic> option = LocalizationTranslate.of(context)!.translate('Home');
    //Responsivo
    return LayoutBuilder(
        builder: (_, BoxConstraints constraints) => (constraints.maxWidth > 850)
            ? _TableDesktopHome(context, option)
            : _MobileHome(context, option));
  }

  // ignore: non_constant_identifier_names
  _TableDesktopHome(BuildContext context, List<dynamic> option) {
    //lista que obtiene las traducciones
    var items = List<String>.filled(5, '');
    for (var opt in option) {
      items[0] = opt['Title'];
      items[1] = opt['Subtitle'];
      items[2] = opt['Message'];
      items[3] = opt['Botton1'];
      items[4] = opt['Botton2'];
    }
    final homePageProvider =
        Provider.of<HomePageProvider>(context, listen: false);
    return Scaffold(
      body: Container(
        decoration: CustomDecoration.BoxDecorationContainerOpt2(),
        child: Row(
          children: [
            const Sidebar(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Center(
                  child: FittedBox(
                    alignment: Alignment.centerLeft,
                    fit: BoxFit.contain,
                    child: Row(
                      children: [
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: items[0], //"Hola!! Soy",
                                style: GoogleFonts.roboto(
                                    fontSize: 40, color: Colors.white70),
                                children: const <TextSpan>[
                                  TextSpan(
                                    text: "\nNombre | Name",
                                    style: TextStyle(
                                        fontSize: 60, color: Colors.white70),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              alignment: Alignment.topLeft,
                              child: AnimatedTextKit(
                                repeatForever: true,
                                // isRepeatingAnimation: true,
                                animatedTexts: [
                                  TyperAnimatedText(
                                      items[
                                          1], //'Ingeniero de sistemas y desarrollador de software',
                                      textStyle: GoogleFonts.roboto(
                                          fontSize: 30, color: Colors.white70),
                                      speed: const Duration(milliseconds: 100),
                                      curve: Curves.easeInCubic),
                                ],
                              ),
                            ),
                            SizedBox(
                                height: 150,
                                width: 800,
                                child: Column(
                                  children: [
                                    AutoSizeText(
                                        items[
                                            2], //'Como un apasionado de la tecnología y del aprendizaje continuo, me enfoco en el desarrollo de software, aplicaciones móviles, web y videojuegos. Mi enfoque está en crear soluciones con un desarrollo estructurado y buenas prácticas, implementando diseños innovadores y gamificación para garantizar la mejor experiencia para el usuario y el cumplimiento de los objetivos del proyecto.',
                                        maxLines: 7,
                                        minFontSize: 20,
                                        maxFontSize: 22,
                                        style: GoogleFonts.roboto(
                                            fontSize: 22,
                                            color: Colors.white60)),
                                  ],
                                )),
                            SizedBox(
                              height: 40,
                              child: Row(
                                children: [
                                  CustomButtonOpt(
                                      text: items[3], //'VISUALIZAR CV',
                                      fontSizeText: 20,
                                      borderRadius: 18.0,
                                      onPressed: () {}),
                                  const SizedBox(
                                    width: 60,
                                  ),
                                  CustomButtonOpt(
                                      text: items[4], //'CONTACTO',
                                      fontSizeText: 20,
                                      borderRadius: 18.0,
                                      onPressed: () => homePageProvider.goTo(5))
                                ],
                              ),
                            )
                          ],
                        ),
                        FadeIn(
                          duration: const Duration(seconds: 2),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 50, horizontal: 100),
                            child: Image.asset('images/icons/icon_user.png'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  _MobileHome(BuildContext context, List<dynamic> option) {
    //lista que obtiene las traducciones
    var items = List<String>.filled(5, '');
    for (var opt in option) {
      items[0] = opt['Title'];
      items[1] = opt['Subtitle'];
      items[2] = opt['Message'];
      items[3] = opt['Botton1'];
      items[4] = opt['Botton2'];
    }
    //Size Screen
    double sizeScreen = MediaQuery.of(context).size.width;

    final homePageProvider =
        Provider.of<HomePageProvider>(context, listen: false);
    return Scaffold(
      body: Container(
        decoration: CustomDecoration.BoxDecorationContainerOpt2(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Center(
                child: FittedBox(
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FadeIn(
                        duration: const Duration(seconds: 2),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Image.asset('images/icons/icon_user.png'),
                        ),
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: items[0],
                          style: GoogleFonts.roboto(
                              fontSize: 40, color: Colors.white70),
                          children: const <TextSpan>[
                            TextSpan(
                              text: "\nJimmy Muñoz",
                              style: TextStyle(
                                  fontSize: 60, color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        alignment: Alignment.topLeft,
                        child: AnimatedTextKit(
                          repeatForever: true,
                          animatedTexts: [
                            TyperAnimatedText(items[1],
                                textStyle: GoogleFonts.roboto(
                                    fontSize: (sizeScreen < 598 ? 24 : 27),
                                    color: Colors.white70),
                                speed: const Duration(milliseconds: 100),
                                curve: Curves.easeInCubic),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 40,
                        child: Row(
                          children: [
                            CustomButtonOpt(
                                text: items[3],
                                fontSizeText: 20,
                                borderRadius: 18.0,
                                onPressed: () {}),
                            const SizedBox(
                              width: 60,
                            ),
                            CustomButtonOpt(
                                text: items[4],
                                fontSizeText: 20,
                                borderRadius: 18.0,
                                onPressed: () => homePageProvider.goTo(5))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Sidebar(),
          ],
        ),
      ),
    );
  }
}
