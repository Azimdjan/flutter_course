import 'package:flutter/material.dart';

class TaxiServiceAppTheme {
  static TextTheme darkTextTheme = const TextTheme(
    headline1: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    headline2: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
      color: Color.fromRGBO(61, 41, 115, 1.0),
    ),
    bodyText1: TextStyle(
      fontSize: 17.0,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    bodyText2: TextStyle(
      fontSize: 17.0,
      fontWeight: FontWeight.w500,
      color: Color.fromRGBO(61, 41, 115, 1.0),
    ),
    headline3: TextStyle(
      fontSize: 33.0,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    headline4: TextStyle(
      fontSize: 45,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    headline5: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w500,
      color: Colors.white30,
    ),
    headline6: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w500,
      color: Color.fromRGBO(84, 92, 155, 1.0),
    ),
  );

  static ThemeData darkTheme() {
    return ThemeData(
      textTheme: darkTextTheme,
      fontFamily: 'SF-Pro-Display',
      primaryColor: const Color.fromRGBO(61, 41, 115, 1.0),
      accentColor: const Color.fromRGBO(67, 48, 122, 1.0),
      hintColor: const Color(0xff282F62),
    );
  }

  static const triangleIcon = 'assets/icons/triangle.png';
  static const historyIcon = 'assets/icons/history.svg';
  static const homeIcon = 'assets/icons/home.svg';
  static const invitationIcon = 'assets/icons/invitation.svg';
  static const logoutIcon = 'assets/icons/logout.svg';
  static const onlineIcon = 'assets/icons/online.svg';
  static const paymentIcon = 'assets/icons/payment.svg';
  static const promoIcon = 'assets/icons/promo.svg';
  static const settingsIcon = 'assets/icons/settings.svg';
  static const toLocationIcon = 'assets/icons/toLocation.svg';
  static const fromLocationIcon = 'assets/icons/fromLocationIcon.svg';
  static const starIcon = 'assets/icons/starIcon.svg';

  static const avatar = 'assets/images/avatar.png';
  static const image1 = 'assets/images/image1.png';
  static const image2 = 'assets/images/image2.png';
  static const image3 = 'assets/images/image3.png';
  static const rectangle = 'assets/images/Rectangle.png';
  static const vector = 'assets/images/Vector.svg';
}
