// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInputText extends StatefulWidget {
  final String? Function(dynamic value) validatorTxt;
  final void Function(String value) onChanged;
  final List<TextInputFormatter> inputFormatters;
  final TextInputType keyboardType;
  final Icon icon;
  final String hintText;
  final String labelText;
  final int maxLines;

  const CustomInputText({
    Key? key,
    required this.validatorTxt,
    required this.inputFormatters,
    required this.keyboardType,
    required this.icon,
    required this.hintText,
    required this.labelText,
    required this.onChanged,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  State<CustomInputText> createState() => CustomInputTextState();
}

class CustomInputTextState extends State<CustomInputText> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: TextFormField(
          validator: widget.validatorTxt,
          inputFormatters: widget.inputFormatters,
          textAlign: TextAlign.start,
          maxLines: widget.maxLines,
          keyboardType: widget.keyboardType,
          style: GoogleFonts.roboto(fontSize: 20),
          decoration: InputDecoration(
              icon: widget.icon,
              hintText: widget.hintText,
              labelText: widget.labelText,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue.withOpacity(0.3))),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide:
                      BorderSide(color: Colors.black.withOpacity(0.3)))),
          onChanged: widget.onChanged,
        ));
  }
}
