import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Custom Button
class CustomButtonIconOpt extends StatefulWidget {
  final String text;
  final double fontSizeText;
  final Color colorText;
  final Color colorButton;
  final Function onPressed;
  final double sizeWidth;
  final double sizeHeight;
  final double borderRadius;
  final Image iconImage;

  const CustomButtonIconOpt({
    Key? key,
    required this.text,
    required this.fontSizeText,
    required this.onPressed,
    required this.iconImage,
    this.colorText = Colors.white,
    this.colorButton = Colors.lightBlueAccent,
    this.sizeWidth = 230.0,
    this.sizeHeight = 170.0,
    this.borderRadius = 0.0,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButtonIconOpt> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => widget.onPressed(),
      icon: widget.iconImage,
      label: Text(widget.text,
          style: GoogleFonts.roboto(
              fontSize: widget.fontSizeText, color: widget.colorText)),
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius))),
          fixedSize: MaterialStateProperty.all(
              Size(widget.sizeWidth, widget.sizeHeight)),
          elevation: MaterialStateProperty.all(10),
          backgroundColor: MaterialStateProperty.all(widget.colorButton)),
    );
  }
}
