import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Responsivo
    return LayoutBuilder(
        builder: (_, BoxConstraints constraints) =>
            (constraints.maxWidth > 850) ? _TableDesktop() : _Mobile());
  }

  // ignore: non_constant_identifier_names
  _TableDesktop() {
    return SizedBox(
      width: 75,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _ButtonCircle(const AssetImage('images/logos/logo_github.png'),
              'https://github.com/'),
          const SizedBox(
            height: 20,
          ),
          _ButtonCircle(const AssetImage('images/logos/logo_linkedin.png'),
              'https://www.linkedin.com/'),
          const SizedBox(
            height: 20,
          ),
          _ButtonCircle(const AssetImage('images/icons/icon_email.png'),
              'mailto:email@hotmail.com?subject=contacto portafolio&body=Gracias por contactarme.'),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  _Mobile() {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _ButtonCircle(const AssetImage('images/logos/logo_github.png'),
              'https://github.com/'),
          const SizedBox(
            width: 20,
          ),
          _ButtonCircle(const AssetImage('images/logos/logo_linkedin.png'),
              'https://www.linkedin.com/'),
          const SizedBox(
            width: 20,
          ),
          _ButtonCircle(const AssetImage('images/icons/icon_email.png'),
              'mailto:email@hotmail.com?subject=contacto portafolio&body=Gracias por contactarme'),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  //
  // ignore: non_constant_identifier_names
  _ButtonCircle(AssetImage urlImage, String url) {
    final Uri url0 = Uri.parse(url);
    return Material(
      color: Colors.white60,
      shape: const CircleBorder(),
      // borderRadius: BorderRadius.circular(20),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: () => url0.hasEmptyPath
            ? throw Exception('Error $url0')
            : launchUrl(url0),
        splashColor: Colors.blue[20],
        hoverColor: Colors.grey.withOpacity(0.4),
        child: Ink.image(
          image: urlImage,
          width: 30,
          height: 30,
          alignment: Alignment.bottomCenter,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
