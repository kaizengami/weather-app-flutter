import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: Color(0xff1f655d),
    accentColor: Color(0xff40bf7a),
    backgroundColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TextTheme(
        bodyText1: TextStyle(color: Colors.white, fontFamily: 'Campton'),
        bodyText2: TextStyle(color: Colors.white, fontFamily: 'Campton'),
        subtitle1: TextStyle(color: Colors.white, fontFamily: 'Campton')),
    appBarTheme: AppBarTheme(
        color: Colors.black,
        actionsIconTheme: IconThemeData(color: Colors.white)));

ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: Color(0xfff5f5f5),
    accentColor: Color(0xff40bf7a),
    backgroundColor: Color(0xFF0b194a),
    scaffoldBackgroundColor: Color(0xFF0b194a),
    textTheme: TextTheme(
        bodyText1: TextStyle(color: Colors.white, fontFamily: 'Campton'),
        bodyText2: TextStyle(color: Colors.white, fontFamily: 'Campton'),
        subtitle1: TextStyle(color: Colors.white, fontFamily: 'Campton')),
    appBarTheme: AppBarTheme(
        color: Color(0xFF0b194a),
        actionsIconTheme: IconThemeData(color: Colors.white)));
