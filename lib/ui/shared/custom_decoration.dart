import 'package:flutter/material.dart';

class CustomDecoration {
// Manejo de background opción 1
  // ignore: non_constant_identifier_names
  static BoxDecoration BoxDecorationContainerOpt1() {
    return const BoxDecoration(
        //Colores del gradiente
        gradient: LinearGradient(
      colors: [
        Color.fromRGBO(44, 83, 100, 1),
        Color.fromRGBO(15, 32, 39, 1),
      ],
      //Configuración vertical
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ));
  }

// Manejo de background opción 2
  // ignore: non_constant_identifier_names
  static BoxDecoration BoxDecorationContainerOpt2() {
    return const BoxDecoration(
        //Colores del gradiente
        gradient: LinearGradient(
      colors: [
        Color.fromRGBO(15, 32, 39, 1),
        Color.fromRGBO(32, 58, 67, 1),
        Color.fromRGBO(44, 83, 100, 1),
      ],
      //Configuración vertical
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ));
  }

  // Manejo de background opción 3
  // ignore: non_constant_identifier_names
  static BoxDecoration BoxDecorationContainerOpt3() {
    return const BoxDecoration(
        //Colores del gradiente
        gradient: LinearGradient(
      colors: [
        Color.fromRGBO(15, 32, 39, 1),
        Color.fromRGBO(44, 83, 100, 1),
      ],
      //Configuración vertical
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ));
  }
}
