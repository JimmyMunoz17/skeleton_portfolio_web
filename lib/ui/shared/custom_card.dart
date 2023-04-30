import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCard extends StatefulWidget {
  final String text;
  final double fontSizeTxt;
  final String textSubtitle;
  final double fontSizeTxtSubtitle;
  final String urlImg;
  final double widthImg;
  final double heightImg;
  final double widthContaner;
  final double heightContaner;
  final Color colorBorder;
  const CustomCard({
    Key? key,
    required this.text,
    required this.urlImg,
    required this.widthImg,
    required this.heightImg,
    required this.widthContaner,
    required this.heightContaner,
    this.fontSizeTxt = 30,
    this.colorBorder = Colors.lightBlue,
    this.textSubtitle = '',
    this.fontSizeTxtSubtitle = 0,
  }) : super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool isEnter = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isEnter = true),
      onExit: (_) => setState(() => isEnter = false),
      child: Container(
        width: isEnter ? widget.widthContaner + 15 : widget.widthContaner,
        height: isEnter ? widget.heightContaner + 15 : widget.heightContaner,
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
              Image.asset(
                widget.urlImg,
                width: widget.widthImg,
                height: widget.heightImg,
                alignment: Alignment.center,
              ),
              const SizedBox(
                height: 20,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: widget.text,
                    style: GoogleFonts.roboto(
                      fontSize: widget.fontSizeTxt,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: widget.textSubtitle,
                          style:
                              TextStyle(fontSize: widget.fontSizeTxtSubtitle))
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
