import 'package:flutter_app/componets/Card1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/explore_recipe.dart';

import 'Card2.dart';
import 'Card3.dart';

class TodayRecipeListView extends StatelessWidget{
  final List<ExploreRecipe> recipes;
  const TodayRecipeListView({Key key,this.recipes}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16,right: 16,top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recipes of the day 🍳.",
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(height: 16,),
          Container(
            height: 450,
            color: Colors.transparent,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: recipes.length,
                itemBuilder: (context, index){
                  var recipe = recipes[index];
                  return buildCard(recipe);
                },
                separatorBuilder: (context,index){
                  return SizedBox(width: 16);
                },
                ),
          )
        ],
      ),
    );
  }

  buildCard(ExploreRecipe recipe){
    if(recipe.cardType == RecipeCardType.card1){
      return Card1(recipe: recipe);
    }
    else if(recipe.cardType == RecipeCardType.card2){
      return Card2(recipe: recipe);
    }
    else if(recipe.cardType == RecipeCardType.card3){
      return Card3(recipe: recipe);
    }
    else{
      throw Exception("This card does not exists yet.");
    }
  }

}