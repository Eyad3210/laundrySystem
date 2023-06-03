import 'package:flutter/material.dart';

const Color mainColor = Color(0xff00acc1);
const Color yellowColor = Color(0xfff17720);

const Color secondColor = Color(0xff26c6da);
//const Color grey = Color(0xff9e9e9e);


const Color darkGreyClr = Color(0xFF121212);
const Color pinkClr = Color(0xFFff4667);
const Color kCOlor1 = Color(0xff685959);
const Color kCOlor2 = Color(0xffADA79B);
const Color kCOlor3 = Color(0xffA5947F);
const Color kCOlor4 = Color(0xff738B71);
const Color kCOlor5 = Color(0xff6D454D);
const Color darkSettings = Color(0xff6132e4);
const Color accountSettings = Color(0xff73bc65);
const Color logOutSettings = Color(0xff5f95ef);
const Color notiSettings = Color(0xffdf5862);
const Color languageSettings = Color(0xffCB256C);


class ThemesApp {
  static final light = ThemeData(
    primaryColor: mainColor,
    backgroundColor: Colors.white,
    brightness: Brightness.light,
    
  );

  static final dark = ThemeData(
    primaryColor: darkGreyClr,
    appBarTheme: AppBarTheme(color:Colors.black),
    backgroundColor: darkGreyClr,
    brightness: Brightness.dark,
  );
}