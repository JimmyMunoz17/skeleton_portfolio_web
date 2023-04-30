import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/home_page_provider.dart';
import 'custom_button_menu.dart';
import 'localization_translate.dart';

//Custom Menu APP
class CustomMenu extends StatefulWidget {
  const CustomMenu({Key? key}) : super(key: key);

  @override
  State<CustomMenu> createState() => _CustomMenuState();
}

class _CustomMenuState extends State<CustomMenu> {
  @override
  Widget build(BuildContext context) {
    //Identificación del tamaño de la página
    return LayoutBuilder(
      //table > 520 < mobile
      builder: (_, BoxConstraints constraints) =>
          (constraints.maxWidth > 949) ? _TableDesktopMenu() : _MobileMenu(),
    );
  }
}

class _TableDesktopMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //lista que obtiene las traducciones
    List<dynamic> option = LocalizationTranslate.of(context)!.translate('Menu');
    var items = List<String>.filled(6, '');
    for (var opt in option) {
      items[0] = opt['Item1'];
      items[1] = opt['Item2'];
      items[2] = opt['Item3'];
      items[3] = opt['Item4'];
      items[4] = opt['Item5'];
      items[5] = opt['Item6'];
    }
    //instancia de provider y sin redibujar listen:false
    final homePageProvider =
        Provider.of<HomePageProvider>(context, listen: false);
    //Llamada al trductor
    LocalizationTranslate localizationTranslate = LocalizationTranslate();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      color: const Color.fromRGBO(9, 20, 25, 0.3),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButtonMenu(
              text: items[0], onPressed: () => homePageProvider.goTo(0)),
          CustomButtonMenu(
              text: items[1], onPressed: () => homePageProvider.goTo(1)),
          CustomButtonMenu(
              text: items[2], onPressed: () => homePageProvider.goTo(2)),
          CustomButtonMenu(
              text: items[3], onPressed: () => homePageProvider.goTo(3)),
          CustomButtonMenu(
              text: items[4], onPressed: () => homePageProvider.goTo(4)),
          CustomButtonMenu(
              text: items[5], onPressed: () => homePageProvider.goTo(5)),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  hoverColor: Colors.white24,
                  onTap: () async {
                    if (await localizationTranslate.readLocaleKey() == 'en') {
                      // ignore: use_build_context_synchronously
                      localizationTranslate.setLocale(
                          context, const Locale('es', 'ES'));
                    } else {
                      // ignore: use_build_context_synchronously
                      localizationTranslate.setLocale(context,
                          const Locale.fromSubtags(languageCode: 'es'));
                    }
                  },
                  child: Ink.image(
                    image: const AssetImage('images/icons/icon_espanol.png'),
                    width: 30,
                    height: 30,
                    alignment: Alignment.bottomCenter,
                    fit: BoxFit.cover,
                  ),
                ),
              )),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  hoverColor: Colors.white24,
                  onTap: () async {
                    if (await localizationTranslate.readLocaleKey() == 'es') {
                      // ignore: use_build_context_synchronously
                      localizationTranslate.setLocale(
                          context, const Locale('en', 'EN'));
                    } else {
                      // ignore: use_build_context_synchronously
                      localizationTranslate.setLocale(context,
                          const Locale.fromSubtags(languageCode: 'en'));
                    }
                  },
                  child: Ink.image(
                    image: const AssetImage('images/icons/icon_english.png'),
                    width: 30,
                    height: 30,
                    alignment: Alignment.bottomCenter,
                    fit: BoxFit.cover,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

class _MobileMenu extends StatefulWidget {
  @override
  State<_MobileMenu> createState() => _MobileMenuState();
}

//with SingleTickerProviderStateMixin --> libreria que se usa para el control de las animaciones
class _MobileMenuState extends State<_MobileMenu>
    with SingleTickerProviderStateMixin {
  //controlador de animaciones
  late AnimationController controller;
  @override
  @override
  void initState() {
    super.initState();
    //asignación del controlador con SingleTickerProviderStateMixin
    controller = AnimationController(
        vsync: this, duration: const Duration(microseconds: 200));
  }

  @override
  Widget build(BuildContext context) {
    //lista que obtiene las traducciones
    List<dynamic> option = LocalizationTranslate.of(context)!.translate('Menu');
    var items = List<String>.filled(6, '');
    for (var opt in option) {
      items[0] = opt['Item1'];
      items[1] = opt['Item2'];
      items[2] = opt['Item3'];
      items[3] = opt['Item4'];
      items[4] = opt['Item5'];
      items[5] = opt['Item6'];
    }
    //instancia de provider y sin redibujar listen:false
    final homePageProvider =
        Provider.of<HomePageProvider>(context, listen: false);
    //Llamada al trductor
    LocalizationTranslate localizationTranslate = LocalizationTranslate();
    //Configuración del cursor para dar click
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      // activación del ontap de del Menú
      child: GestureDetector(
        onTap: () {
          _menuActive(homePageProvider);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                width: homePageProvider.getIsOpen ? 150 : 55,
                height: homePageProvider.getIsOpen ? 340 : 50,
                color: Colors.white38,
                child: Column(
                  children: [
                    _MenuTitle(
                      isOpen: homePageProvider.getIsOpen,
                      controller: controller,
                    ),
                    if (homePageProvider.getIsOpen) ...[
                      CustomButtonMenu(
                          delay: 0,
                          text: items[0],
                          onPressed: () {
                            _menuActive(homePageProvider);
                            return homePageProvider.goTo(0);
                          }),
                      CustomButtonMenu(
                          delay: 40,
                          text: items[1],
                          onPressed: () {
                            _menuActive(homePageProvider);
                            return homePageProvider.goTo(1);
                          }),
                      CustomButtonMenu(
                          delay: 60,
                          text: items[2],
                          onPressed: () {
                            _menuActive(homePageProvider);
                            return homePageProvider.goTo(2);
                          }),
                      CustomButtonMenu(
                          delay: 80,
                          text: items[3],
                          onPressed: () {
                            _menuActive(homePageProvider);
                            return homePageProvider.goTo(3);
                          }),
                      CustomButtonMenu(
                          delay: 90,
                          text: items[4],
                          onPressed: () {
                            _menuActive(homePageProvider);
                            return homePageProvider.goTo(4);
                          }),
                      CustomButtonMenu(
                          delay: 100,
                          text: items[5],
                          onPressed: () {
                            _menuActive(homePageProvider);
                            return homePageProvider.goTo(5);
                          }),
                      Row(
                        children: [
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: Material(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(20),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: InkWell(
                                  hoverColor: Colors.white24,
                                  onTap: () async {
                                    if (await localizationTranslate
                                            .readLocaleKey() ==
                                        'en') {
                                      // ignore: use_build_context_synchronously
                                      localizationTranslate.setLocale(
                                          context, const Locale('es', 'ES'));
                                    } else {
                                      // ignore: use_build_context_synchronously
                                      localizationTranslate.setLocale(
                                          context,
                                          const Locale.fromSubtags(
                                              languageCode: 'es'));
                                    }
                                    _menuActive(homePageProvider);
                                  },
                                  child: Ink.image(
                                    image: const AssetImage(
                                        'images/icons/icon_espanol.png'),
                                    width: 30,
                                    height: 30,
                                    alignment: Alignment.bottomCenter,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: Material(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(20),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: InkWell(
                                  hoverColor: Colors.white24,
                                  onTap: () async {
                                    if (await localizationTranslate
                                            .readLocaleKey() ==
                                        'es') {
                                      // ignore: use_build_context_synchronously
                                      localizationTranslate.setLocale(
                                          context, const Locale('en', 'EN'));
                                    } else {
                                      // ignore: use_build_context_synchronously
                                      localizationTranslate.setLocale(
                                          context,
                                          const Locale.fromSubtags(
                                              languageCode: 'en'));
                                    }
                                    _menuActive(homePageProvider);
                                  },
                                  child: Ink.image(
                                    image: const AssetImage(
                                        'images/icons/icon_english.png'),
                                    width: 30,
                                    height: 30,
                                    alignment: Alignment.bottomCenter,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ))
                        ],
                      )
                    ]
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Método de estado del Menú
  void _menuActive(HomePageProvider homePageProvider) {
    if (homePageProvider.getIsOpen) {
      controller.reverse();
    } else {
      controller.forward();
    }
    setState(() {
      homePageProvider.setIsOpen = !homePageProvider.getIsOpen;
    });
  }
}

class _MenuTitle extends StatelessWidget {
  const _MenuTitle({
    Key? key,
    required this.isOpen,
    required this.controller,
  }) : super(key: key);

  final bool isOpen;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 125,
      height: 50,
      child: Row(
        children: [
          // ANIMACIÓN DEL MENÚ
          AnimatedContainer(
            duration: const Duration(microseconds: 200),
            curve: Curves.easeInOut,
            // activa la animación si se abre o cierra el menú
            width: isOpen ? 35 : 0,
          ),
          //ANIMACIÓN DEL MENÚ
          AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: controller,
              color: Colors.white70)
        ],
      ),
    );
  }
}
