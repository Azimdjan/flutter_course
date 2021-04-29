import 'package:flutter/material.dart';
import 'fooderlich_theme.dart';
import 'package:flutter/painting.dart';

class Card1 extends StatelessWidget{
  final String category = "Editor's Choice";
  final String title = "The Art of Dough";
  final String description = "Learn to make the perfect bread.";
  final String chef = "Ray Wenderlich";
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(width: double.infinity,height: 550),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/mag1.png"),
          fit: BoxFit.cover
        ),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Stack(
        children: [
          Positioned(child: Text(category,style: FooderlichTheme.darkTextTheme.bodyText1),
          top: 20, left: 10,),
          Positioned(
              child: Text(
            title, style: FooderlichTheme.darkTextTheme.headline2,
          ), top: 40, left: 10,),
          Positioned(child: Text(
            description, style: FooderlichTheme.darkTextTheme.bodyText1,
          ), bottom: 30, right: 10,),
          Positioned(child: Text(
            chef, style: FooderlichTheme.darkTextTheme.bodyText1,
          ), bottom: 10, right: 10,)
        ],
      )
    );
  }
}