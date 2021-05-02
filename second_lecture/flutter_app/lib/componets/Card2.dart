import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/fooderlich_theme.dart';
import 'package:flutter_app/models/explore_recipe.dart';
import 'author.dart';

class Card2 extends StatelessWidget{
  final ExploreRecipe recipe;
  const Card2({Key key,this.recipe}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints.expand(width: 350,height: 450),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(recipe.backgroundImage),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Column(
          children: [
            AuthorCard(authorName: recipe.authorName, title: recipe.role,
            imageProvider: AssetImage(recipe.profileImage),),
            Expanded(
                child: Stack(
                  children: [
                    Positioned(
                        child: Text(recipe.title,style: FooderlichTheme.lightTextTheme.headline1,),
                    bottom: 16, right: 16,),
                    Positioned(
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: Text(recipe.subtitle,style: FooderlichTheme.lightTextTheme.headline1,),
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