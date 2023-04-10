import 'package:flutter/material.dart';

Color colorblue = Color.fromRGBO(40, 172, 227, 5);
Color colorred = Color.fromRGBO(255, 0, 0, 5);
Color colorgreen = Color.fromRGBO(40, 198, 16, 5);
Color coloryellow = Color.fromRGBO(247, 213, 33, 5);
Color colorwhite = Color.fromRGBO(246, 247, 248, 5);

TextStyle buttontextstyle =
    TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600);
TextStyle titlestyle =
    TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600);
TextStyle buttontextstyle1 =
    TextStyle(fontSize: 18, color: colorblue, fontWeight: FontWeight.w600);
ButtonStyle loginbuttonstyle = ButtonStyle(
    elevation: MaterialStateProperty.all(10),
    backgroundColor: MaterialStateProperty.all(colorblue),
    padding: MaterialStateProperty.all<EdgeInsets>(
        EdgeInsets.symmetric(horizontal: 25.0)),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
    )));
