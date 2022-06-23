//import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class Global {
  //Colores
  static const Color colorBlanco = Color(0xffffffff);
  static const Color colorazul = Color(0xff4A64FE);
  static const Color colorEmpresa = Color(0xff6498d1);
  static const Color colorNegro = Color(0xff000000);
  
  static const Color bacgroundColorCard = Color.fromARGB(255, 74, 78, 83);
  static const Color basicBackground = Color.fromARGB(255, 53, 57, 60);
  static const Color basicFont = Color.fromARGB(255, 209, 209, 209);
  static const Color accentColor = Color.fromARGB(255, 182, 58, 178);
  static const Color highLightColor = Color.fromARGB(255, 99, 204, 202);
  static const Color alertColor = Color.fromARGB(255, 155, 93, 229);


  /*static mensaje(BuildContext context, String mensaje, String titulo, {Color backgroundColorCustom = Colors.redAccent}) {
    Flushbar(
      title: titulo,
      message: mensaje,
      duration: const Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.GROUNDED,
      backgroundColor: backgroundColorCustom,
    ).show(context);
  }*/

}