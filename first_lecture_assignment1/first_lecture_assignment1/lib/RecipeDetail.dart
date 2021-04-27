import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'Recipe.dart';

class RecipeDetail extends StatefulWidget{
  final Recipe recipe;
  RecipeDetail(this.recipe);
  @override
  _RecipeDetailState createState() {
    // TODO: implement createState
    return _RecipeDetailState(recipe);
  }
}

class _RecipeDetailState extends State{
  final Recipe recipe;
  int _sliderValue=1;
  _RecipeDetailState(this.recipe);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            recipe.label,
            style: TextStyle(fontSize: 40.0),),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image(image: AssetImage(recipe.imageUrl),),
            ),
            SizedBox(
              height: 14.0,
            ),
            Text(
              recipe.label,
              style: TextStyle(fontSize: 80,),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Quantity",
                  style: TextStyle(fontSize: 50),
                ),
                Text(
                  "Measure",
                  style: TextStyle(fontSize: 50),
                ),
                Text(
                  "Name",
                  style: TextStyle(fontSize: 50),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: recipe.ingredients.length,
                itemBuilder: (BuildContext context,int index){
                  final ingredient = recipe.ingredients[index];
                  return Container(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "${ingredient.quantity*_sliderValue}",
                          style: TextStyle(
                              fontSize: 20.0,fontFamily: "BebasNeue"),
                        ),
                        Text(
                              "${ingredient.measure}",
                          style: TextStyle(
                              fontSize: 20.0,fontFamily: "BebasNeue"),
                        ),
                        Text(
                              "${ingredient.name}",
                              style: TextStyle(
                              fontSize: 20.0,fontFamily: "BebasNeue"),
                        )
                      ],
                    )
                  );
                },
              )
            ),
            Slider(
                min: 1,
                max: 10,
                divisions: 10,
                label: "${_sliderValue*recipe.servings} servings",
                value: _sliderValue.toDouble(),
                onChanged: (newValue){
                  setState(() {
                    _sliderValue=newValue.round();
                  });
                },
            activeColor: Colors.green,
            inactiveColor: Colors.grey,)
          ],
        ),
      ),
    );
  }

}