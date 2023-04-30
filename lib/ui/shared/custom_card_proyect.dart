import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeleton_portfolio/ui/shared/custom_button_icon_opt.dart';

class CustomCardProyect extends StatefulWidget {
  final String txtTitle;
  final double fontSizeTxtTitle;
  final String textSubtitle;
  final double fontSizeTxtSubtitle;
  final Image image;
  final double widthContaner;
  final double heightContaner;
  final Color colorBorder;
  final CustomButtonIconOpt button1;
  final CustomButtonIconOpt button2;

  const CustomCardProyect({
    Key? key,
    required this.txtTitle,
    required this.fontSizeTxtTitle,
    required this.textSubtitle,
    required this.fontSizeTxtSubtitle,
    required this.image,
    required this.widthContaner,
    required this.heightContaner,
    required this.button1,
    required this.button2,
    this.colorBorder = Colors.lightBlue,
  }) : super(key: key);

  @override
  State<CustomCardProyect> createState() => _CustomCardProyectState();
}

class _CustomCardProyectState extends State<CustomCardProyect> {
  bool isEnter = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isEnter = true),
      onExit: (_) => setState(() => isEnter = false),
      child: Container(
        width: isEnter ? widget.widthContaner + 10 : widget.widthContaner,
        height: isEnter ? widget.heightContaner + 10 : widget.heightContaner,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            border: isEnter
                ? Border.all(color: widget.colorBorder)
                : Border.all(color: Colors.transparent)),
        child: Card(
            elevation: 20,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.image,
                const SizedBox(
                  height: 15,
                ),
                ListTile(
                  title: Text(
                    widget.txtTitle,
                    style: GoogleFonts.roboto(
                      fontSize: widget.fontSizeTxtTitle,
                    ),
                  ),
                  subtitle: Text(
                    widget.textSubtitle,
                    style: GoogleFonts.roboto(
                        fontSize: widget.fontSizeTxtSubtitle),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widget.button1,
                    const SizedBox(
                      width: 20,
                    ),
                    widget.button2,
                  ],
                )
              ],
            )),
      ),
    );
  }
}
