import 'package:flutter/material.dart';

class FitAppTheme {
  FitAppTheme._();
  static const Color white = Color(0xFFFFFFFF);
  static const Color background = Color(0xFFF2F3F8);
  static const Color spacer = Color(0xFFF2F2F2);
  static const String fontName = 'Eurostil Bold';
  static const String fontNormal= 'Eurostil Normal';

  static const Color colorAppBar = Color(0xFFFF622D);
  static const Color bgColor = Color(0xFFFF622D);
  static const Color bgColorSecondary = Color(0xFFF6D8CD);
  static const Color bgColor2 = Color(0xFFE0342B);
  static const Color black = Color(0xFF000000);
  static const Color colorButtonL = Color(0xFF323639);
  static const Color secondary = Color(0xFFD7E0F9);
  static const Color grey200 = Color(0xFFF7F6F6);
  static const Color grey = Color(0xFFBEBFC1);
  static const Color white100 = Color(0xFFF5F6F7);

  static const TextTheme textTheme = TextTheme(
    headline4: display1,
    headline5: headline,
    headline6: title,
    subtitle2: subtitle,
    bodyText2: button,
    bodyText1: body1,
  );

  static const TextStyle display1 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: white,
  );

  static const TextStyle headline = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: white,
  );

  static const TextStyle title = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 25,
    letterSpacing: 0.18,
    color: black,
  );

  static const TextStyle title16 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: black,
  );

static const TextStyle title12 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 12,
    letterSpacing: 0.18,
    color: black,
  );

  static const TextStyle title15= TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.normal,
    fontSize: 15,
    letterSpacing: 0.18,
    color: black,
  );


  static const TextStyle titleWhite = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 25,
    letterSpacing: 0.18,
    color: white,
  );

  static const TextStyle title2White = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: white,
  );

  static const TextStyle description = TextStyle(
    fontFamily: fontNormal,
    fontWeight: FontWeight.normal,
    fontSize: 16,
    letterSpacing: -0.04,
    color: black,
  );

  static const TextStyle descriptionWhite = TextStyle(
    fontFamily: fontNormal,
    fontWeight: FontWeight.normal,
    fontSize: 16,
    letterSpacing: -0.04,
    color: white,
  );


  static const TextStyle button = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.normal,
    fontSize: 22,
    letterSpacing: 0.2,
    color: black,
  );

  static const TextStyle subtitle = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.normal,
    fontSize: 22,
    letterSpacing: 0.2,
    color: white,
  );

  static const TextStyle subtitleBlack = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.normal,
    fontSize: 22,
    letterSpacing: 0.2,
    color: black,
  );

  static const TextStyle body1 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: white,
  );

  static const TextStyle text12 = TextStyle(
    fontFamily: fontNormal,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: black, // was lightText
  );
}
