import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Custom Button Menu
class CustomButtonMenu extends StatefulWidget {
  //Parámetros
  final String text;
  final Color color;
  final Function onPressed;
  final int delay;

  const CustomButtonMenu(
      {Key? key,
      required this.text,
      this.color = Colors.white70,
      required this.onPressed,
      this.delay = 0})
      : super(key: key);

  @override
  State<CustomButtonMenu> createState() => _CustomButtonMenuState();
}

class _CustomButtonMenuState extends State<CustomButtonMenu> {
  bool isHover = false; //Hover del Menú
  @override
  Widget build(BuildContext context) {
    //Identificación del tamaño de la página
    return LayoutBuilder(
      //table > 520 < mobile
      builder: (_, BoxConstraints constraints) => (constraints.maxWidth > 750)
          ? _TableDesktopButton()
          : _MobileButton(),
    );
  }

  // ignore: non_constant_identifier_names
  _TableDesktopButton() {
    return TextButton(
        style: TextButton.styleFrom(
            foregroundColor: widget.color,
            textStyle: const TextStyle(fontSize: 15)),
        onPressed: () => widget.onPressed(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            widget.text,
            style: GoogleFonts.roboto(fontSize: 20, color: Colors.white70),
          ),
        ));
  }

  // ignore: non_constant_identifier_names
  _MobileButton() {
    return FadeInLeft(
        from: 10,
        duration: const Duration(milliseconds: 150),
        delay: Duration(milliseconds: widget.delay),
        child: MouseRegion(
          onEnter: (_) => setState(() => isHover = true),
          onExit: (_) => setState(() => isHover = false),
          child: GestureDetector(
            onTap: () => widget.onPressed(),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 150,
              height: 40,
              color: isHover ? Colors.white10 : Colors.transparent,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    widget.text,
                    style:
                        GoogleFonts.roboto(fontSize: 15, color: Colors.black87),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
