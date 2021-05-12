import 'package:custom_appbar/layout/mainLayout.dart';
import 'package:custom_appbar/screens/mainScreen.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MainLayout(MainScreen());
  }

}