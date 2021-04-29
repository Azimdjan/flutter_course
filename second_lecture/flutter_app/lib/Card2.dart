import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/fooderlich_theme.dart';
import 'author.dart';

class Card2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints.expand(width: double.infinity,height: 550),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/mag5.png"),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Column(
          children: [
            AuthorCard(authorName: "Mike Katz", title: "Smoothie Connoisseur",
            imageProvider: AssetImage("assets/author_katz.jpeg"),),
            Expanded(
                child: Stack(
                  children: [
                    Positioned(
                        child: Text("Recipe",style: FooderlichTheme.lightTextTheme.headline1,),
                    bottom: 16, right: 16,),
                    Positioned(
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: Text("Smoothies",style: FooderlichTheme.lightTextTheme.headline1,),
                      ),
                      bottom: 70, left: 16,)
                  ],
                ))
          ],
        ),
      ),
    );
  }

}