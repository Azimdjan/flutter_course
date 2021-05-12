import 'package:flutter/material.dart';
import 'package:flutter_app/screens/welcome_screen.dart';
import 'fooderlich_theme.dart';
import 'package:provider/provider.dart';
import 'models/models.dart';
import 'home.dart';
import 'package:flutter_app/router.dart';
import 'package:flutter_app/constant/rout.dart';

void main() {
  runApp(Fooderlich());
}

class Fooderlich extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var darkTheme = FooderlichTheme.dark();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      // onGenerateRoute: Rout.generateRoute,
      // initialRoute: page,
      home: Welcome_Screen(),
    );
  }
}