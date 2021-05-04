import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData lightTheme() => ThemeData(
    appBarTheme: const AppBarTheme(
      color: Color(0xffffffff),
    ),
    fontFamily: 'Roboto',
    scaffoldBackgroundColor: const Color(0xffF3F5F4),
    canvasColor: const Color(0xffF3F5F4),
    textTheme: const TextTheme(
      bodyText1: regularPostText,
      bodyText2: regularMainSecondText,
      headline1: bold20Black,
      headline2: regularTextFirst,
      headline3: regular16Grey600,
      headline4: regular10Grey,
      headline5: bold12blue,
    ),
    bottomNavigationBarTheme:
    const BottomNavigationBarThemeData(backgroundColor: Colors.white),
    accentColorBrightness: Brightness.light,
    backgroundColor: Colors.white,
    primaryColor: mainAccent,
    primaryColorDark: mainDark,
    iconTheme: const IconThemeData(color: Color.fromRGBO(224, 231, 255, 1)),
    colorScheme: const ColorScheme(
      surface: lightGrey,
      background: Color(0xffF2F6FA),
      brightness: Brightness.light,
      error: Colors.red,
      onError: Colors.red,
      onBackground: mainSecond,
      onPrimary: mainSecond,
      onSecondary: mainNeutral,
      onSurface: border,
      primary: secondDark,
      secondary: mainNeutral,
      primaryVariant: mainSecond,
      secondaryVariant: mainNeutral,
    ),
    buttonColor: mainAccent,
    buttonTheme: ButtonThemeData(
        buttonColor: mainSecond,
        colorScheme: const ColorScheme(
            surface: Colors.red,
            background: mainSecond,
            brightness: Brightness.light,
            error: Colors.red,
            onError: Colors.red,
            onBackground: mainSecond,
            onPrimary: mainSecond,
            onSecondary: mainNeutral,
            onSurface: border,
            primary: mainSecond,
            secondary: mainNeutral,
            primaryVariant: mainSecond,
            secondaryVariant: grey),
        disabledColor: mainNeutral.withOpacity(.2)),
    textSelectionTheme:
    const TextSelectionThemeData(cursorColor: mainSecond),
  );

  static const unselectedSwitch = Color.fromRGBO(238, 239, 240, 1);
  static const borderGrey = Color.fromRGBO(228, 228, 228, 1);
  static const mainAccent = Color.fromRGBO(42,103,227, 1);
  static const mainSecond = Color.fromRGBO(19, 133, 250, 1);
  static const textSecond = Color.fromRGBO(152, 152, 152, 1);
  static const mainFirst = Color.fromRGBO(0, 195, 137, 1);
  static const transparentBlue = Color.fromRGBO(255, 255, 255, 0.8);
  static const mainDark = Color.fromRGBO(255, 255, 255, 0.8);
  static const secondDark = Color.fromRGBO(36, 42, 55, 1);
  static const mainNeutral = Color.fromRGBO(142, 155, 168, 1);
  static const textFirst = Color.fromRGBO(255, 179, 89, 1.0);
  static const grey = Color.fromRGBO(148, 148, 148, 1.0);
  static const redNeutral = Color.fromRGBO(238, 82, 83, 1);
  static const regularText = Color.fromRGBO(148, 148, 148, 1.0);
  static const externalBorder = Color.fromRGBO(226, 229, 234, 1);
  static const scaffoldGrey = Color(0xffF5F6F7);
  static const border = Color(0xffF0F0F0);
  static const lightGrey = Color.fromRGBO(206, 211, 219, 1);
  static const mainLight = Colors.white;
  static const darkGrey =Colors.white;
  static const red = Color.fromRGBO(204, 33, 50, 1);
  static const lightGreen = Color.fromRGBO(228, 244, 232, 1);
  static const darkGreen = Color.fromRGBO(148, 148, 148, 0.7019607843137254);


  static const regularMainSecondText = TextStyle(
    fontSize: 5,
    fontWeight: FontWeight.bold,
    color: mainLight,
  );
  static const regular16Grey600 = TextStyle(
    fontFamily: 'Roboto medium',
    fontSize: 11,
    color: darkGrey,
  );
  static const regularTextFirst = TextStyle(
      fontFamily: 'Roboto black',
      fontSize: 24,
      color: textFirst);
  static const regular10Grey = TextStyle(
    fontFamily: 'Roboto regular',
    fontSize: 10,
    color: grey,
  );
  static const bold20Black = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: mainDark,
  );
  static const bold12blue = TextStyle(
    fontFamily: 'Roboto light',
    fontSize: 10,
    color: darkGreen,
  );
  static const regularPostText = TextStyle(
    fontFamily: 'Rubik',
    fontSize: 7,
    color: regularText,
  );
}