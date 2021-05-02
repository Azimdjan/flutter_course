import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/fooderlich_theme.dart';
import 'package:flutter_app/models/explore_recipe.dart';

class Card3 extends StatelessWidget{
  final ExploreRecipe recipe;
  const Card3({Key key,this.recipe}): super(key: key);

  List<Widget> createTagChips(){
    final chips = <Widget>[];
    recipe.tags.take(6).forEach((element) {
      final chip = Chip(
        label: Text(element, style: FooderlichTheme.darkTextTheme.bodyText1,),
        backgroundColor: Colors.black.withOpacity(0.7),
      );
      chips.add(chip);
    });
    return chips;
  }
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
        borderRadius: BorderRadius.all(const Radius.circular(10.0)),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius: BorderRadius.all(const Radius.circular(10.0)),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.book,color: Colors.white,size: 40),
                SizedBox(height: 8,),
                Text(recipe.title,style: FooderlichTheme.darkTextTheme.headline1,),
                SizedBox(height: 30,),
              ],
            )
          ),
          Center(
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: 12,
              children: createTagChips(),
            ),
          )
        ],
      ),
    ),
    );
  }
}