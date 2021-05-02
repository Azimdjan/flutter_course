
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/componets/recipe_thumbnail.dart';
import 'package:flutter_app/models/models.dart';

class RecipesGridView extends StatelessWidget{
  final List<SimpleRecipe> recipes;
  const RecipesGridView({Key key,this.recipes}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16,right: 16,top: 16),
      child: GridView.builder(
        itemCount: recipes.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context,index){
          var simpleRecipe = recipes[index];
          return RecipeThumbnail(recipe: simpleRecipe,);
        },
      )
    );
  }
}