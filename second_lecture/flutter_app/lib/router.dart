import 'package:flutter/material.dart';
import 'package:flutter_app/constant/rout.dart';
import 'package:flutter_app/home.dart';
import 'package:flutter_app/screens/explore_screen.dart';
import 'package:flutter_app/screens/groceryScreen.dart';
import 'package:flutter_app/screens/recipes_screen.dart';

Route createRoute(Widget screen) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionDuration: Duration(milliseconds: 200),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = 0.0;
        var end = 1.0;
        var curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: curve));

        return FadeTransition(
          opacity: animation.drive(tween),
          child: child,
        );
      },
    );
  }
class Rout{
static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case page1:
        return MaterialPageRoute(builder: (context) => ExploreScreen());
      case page2:
        return MaterialPageRoute(builder: (context) => RecipeScreen());
      case page3:
        return MaterialPageRoute(builder: (context) => GroceryScreen());
      case page0:
        return MaterialPageRoute(builder: (context) => Home());
    }
  }
}