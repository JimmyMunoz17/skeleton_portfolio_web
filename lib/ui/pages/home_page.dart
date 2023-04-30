import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/home_page_provider.dart';
import '../shared/custom_menu.dart';
import '../views/about_me_view.dart';
import '../views/contact_view.dart';
import '../views/home_view.dart';
import '../views/proyect_view.dart';
import '../views/skill_view.dart';
import '../views/training_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // ignore: avoid_unnecessary_containers
        body: Container(
      child: Stack(children: const [
        //Cuerpo de la web
        _HomeBody(),
        Positioned(child: CustomMenu()),
        //Menú e iconos
        _CircleAvatarIcon(),
      ]),
    ));
  }
}

class _CircleAvatarIcon extends StatelessWidget {
  const _CircleAvatarIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homePageProvider =
        Provider.of<HomePageProvider>(context, listen: false);
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: InkWell(
            onTap: () => homePageProvider.goTo(0),
            child: Ink.image(
              image: const AssetImage('images/icons/icon_user.png'),
              width: 50,
              height: 50,
              alignment: Alignment.bottomCenter,
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //instancia de provider y sin redibujar listen:false
    final homePageProvider =
        Provider.of<HomePageProvider>(context, listen: false);

    return PageView(
      //Manejador del Scroll con el provider
      controller: homePageProvider.scrollController,
      //Control del Scroll
      scrollDirection: Axis.vertical,
      scrollBehavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      }),
      children: const [
        //Instancias de View de la página
        HomeView(),
        AboutMeView(),
        SkillView(),
        TrainingView(),
        ProyectView(),
        ContactView(),
      ],
    );
  }
}
