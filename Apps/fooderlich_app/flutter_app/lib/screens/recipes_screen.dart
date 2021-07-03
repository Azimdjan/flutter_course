
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/api/mock_fooderlich_service.dart';
import 'package:flutter_app/componets/recipes_grid_view.dart';

class RecipeScreen extends StatelessWidget{
  final exploreService = MockFooderlichService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: exploreService.getRecipes(),
      builder: (context,snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          return RecipesGridView(recipes: snapshot.data,);
        }
        else{
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

}