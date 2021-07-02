import 'package:flutter/material.dart';
import 'package:weather_app/layouts/mainLayout.dart';
import 'package:weather_app/screens/mainScreen.dart';

class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MainLayout(MainScreen());
  }

}